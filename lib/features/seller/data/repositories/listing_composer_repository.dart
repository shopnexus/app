import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopnexus_flutter_app/api/api_providers.dart';
import 'package:shopnexus_flutter_app/api/generated/api/account_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/catalog_api.dart';
import 'package:shopnexus_flutter_app/api/generated/model/category.dart';
import 'package:shopnexus_flutter_app/api/generated/model/contact.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_listing_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_upload_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_detail.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_suggestion.dart';
import 'package:shopnexus_flutter_app/api/generated/model/publish_listing_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/suggest_listing_request.dart';

part 'listing_composer_repository.g.dart';

/// A recording to send with a suggestion request. It travels inline as base64
/// rather than through an upload slot because it is input and not content —
/// nothing keeps it, so there is nothing to reap.
class VoiceNote {
  const VoiceNote({required this.bytes, required this.mime});

  final List<int> bytes;
  final String mime;
}

/// The AI-assisted posting flow: photos and a note in, a filled-in form back,
/// and the seller's corrected form out as a real listing.
///
/// Nothing here posts on the seller's behalf. `POST /listings/suggestions`
/// writes nothing at all, so an abandoned attempt leaves only the uploaded
/// photos behind, and [createListing] is the only call that creates anything.
class ListingComposerRepository {
  ListingComposerRepository(this._catalog, this._account);

  final CatalogApi _catalog;
  final AccountApi _account;

  /// Reserve a slot, PUT the bytes at the store, confirm the object landed.
  /// Answers the resource id, which is what every `attachments` field takes —
  /// an unconfirmed slot resolves to nothing, so it cannot be attached.
  Future<String> uploadPhoto({
    required List<int> bytes,
    required String filename,
    required String mime,
  }) async {
    final reserved = await _catalog.listingsUploadsPost(
      createUploadRequest: CreateUploadRequest(
        filename: filename,
        mime: mime,
        size: bytes.length,
      ),
    );
    final slot = reserved.data!.data;

    // A bare Dio on purpose: the URL is already signed for this key and this
    // method, and the app's bearer token has no business at an object store
    // that is not this API — some stores reject a request carrying both.
    await Dio().put<void>(
      slot.url,
      data: Stream<List<int>>.fromIterable([bytes]),
      options: Options(
        headers: <String, dynamic>{
          Headers.contentTypeHeader: mime,
          Headers.contentLengthHeader: bytes.length,
          ...slot.headers,
        },
      ),
    );

    await _catalog.listingsUploadsIdConfirmationPost(id: slot.resourceId);
    return slot.resourceId;
  }

  /// One synchronous call. At least one of [attachments], [note] or [voiceNote]
  /// has to carry something, or the route answers 422.
  Future<ListingSuggestion> suggest({
    List<String> attachments = const [],
    String note = '',
    VoiceNote? voiceNote,
    String? language,
  }) async {
    final response = await _catalog.listingsSuggestionsPost(
      suggestListingRequest: SuggestListingRequest(
        attachments: attachments.isEmpty ? null : attachments,
        note: note.isEmpty ? null : note,
        voiceNote: voiceNote == null ? null : base64Encode(voiceNote.bytes),
        voiceNoteMime: voiceNote?.mime,
        language: language,
      ),
    );
    return response.data!.data;
  }

  /// Creates the listing and its variants together. It starts as a draft and is
  /// not public until [publishListing].
  Future<ListingDetail> createListing(CreateListingRequest request) async {
    final response = await _catalog.listingsPost(createListingRequest: request);
    return response.data!.data;
  }

  /// Queues the listing for moderation. This is also where it gets its
  /// location: [pickupContactId] names which of the seller's own addresses a
  /// carrier collects from, and omitting it means their default pickup address.
  Future<ListingDetail> publishListing(
    String id, {
    String? pickupContactId,
  }) async {
    final response = await _catalog.listingsIdPublicationPost(
      id: id,
      publishListingRequest: pickupContactId == null
          ? null
          : PublishListingRequest(pickupContactId: pickupContactId),
    );
    return response.data!.data;
  }

  /// The whole tree, flat with a parent reference on each row. Unpaginated —
  /// a category tree stays small.
  Future<List<Category>> categories() async {
    final response = await _catalog.categoriesGet();
    return response.data!.data;
  }

  /// The seller's saved addresses, which is what a pickup contact is picked from.
  Future<List<Contact>> contacts() async {
    final response = await _account.contactsGet();
    return response.data!.data;
  }
}

@riverpod
ListingComposerRepository listingComposerRepository(Ref ref) =>
    ListingComposerRepository(
      ref.watch(catalogApiProvider),
      ref.watch(accountApiProvider),
    );
