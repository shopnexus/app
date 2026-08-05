import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopnexus_flutter_app/api/generated/model/category.dart';
import 'package:shopnexus_flutter_app/api/generated/model/contact.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_listing_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_suggestion.dart';
import 'package:shopnexus_flutter_app/core/utils/error_handler.dart';
import 'package:shopnexus_flutter_app/features/seller/data/repositories/listing_composer_repository.dart';

part 'listing_suggestion_provider.freezed.dart';

part 'listing_suggestion_provider.g.dart';

/// A photo the seller picked. [resourceId] is null until the bytes are at the
/// store and confirmed — an unconfirmed upload resolves to nothing, so it can be
/// attached neither to a suggestion request nor to a listing.
@freezed
abstract class ListingPhoto with _$ListingPhoto {
  const factory ListingPhoto({
    required String path,
    String? resourceId,
    @Default(true) bool uploading,
    String? errorMessage,
  }) = _ListingPhoto;
}

@freezed
abstract class ListingSuggestionState with _$ListingSuggestionState {
  const factory ListingSuggestionState({
    @Default([]) List<ListingPhoto> photos,
    @Default(false) bool suggesting,
    @Default(false) bool submitting,

    /// The model's answer, or null while the seller has not asked for one. The
    /// form is editable either way — a seller who skips the AI just fills it in.
    ListingSuggestion? suggestion,
    @Default([]) List<Category> categories,
    @Default([]) List<Contact> contacts,

    /// Set once `POST /listings` landed, so a failed publication does not invite
    /// a second press that would post the same item twice.
    String? createdListingId,
    @Default(false) bool published,
    String? errorMessage,
  }) = _ListingSuggestionState;
}

@riverpod
class ListingSuggestionNotifier extends _$ListingSuggestionNotifier {
  final ImagePicker _picker = ImagePicker();

  /// `SuggestListingRequest.attachments` caps at ten, and only the first three
  /// are what the model reads.
  static const _maxPhotos = 10;

  /// `CreateUploadRequest.size` caps at 10 MiB, checked before a byte moves.
  static const _maxPhotoBytes = 10 * 1024 * 1024;

  @override
  ListingSuggestionState build() {
    Future.microtask(_loadPickers);
    return const ListingSuggestionState();
  }

  Future<void> _loadPickers() async {
    final repository = ref.read(listingComposerRepositoryProvider);
    try {
      final categories = await repository.categories();
      if (!ref.mounted) return;
      state = state.copyWith(categories: categories);
    } catch (_) {
      // An empty picker is recoverable — reopening the screen reloads it and
      // nothing the seller typed is lost. A banner here would bury the form.
    }
    try {
      final contacts = await repository.contacts();
      if (!ref.mounted) return;
      state = state.copyWith(contacts: contacts);
    } catch (_) {}
  }

  /// For the "tải lại" affordance next to an empty category picker.
  Future<void> reloadPickers() => _loadPickers();

  Future<void> addPhotosFromGallery() => _addPhotos(
    () => _picker.pickMultiImage(maxWidth: 1600, imageQuality: 85),
  );

  Future<void> addPhotoFromCamera() => _addPhotos(() async {
    final shot = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1600,
      imageQuality: 85,
    );
    return shot == null ? const <XFile>[] : [shot];
  });

  Future<void> _addPhotos(Future<List<XFile>> Function() pick) async {
    final List<XFile> picked;
    try {
      picked = await pick();
    } catch (e) {
      if (ref.mounted) {
        state = state.copyWith(errorMessage: 'Không mở được ảnh: $e');
      }
      return;
    }
    if (picked.isEmpty || !ref.mounted) return;

    final room = _maxPhotos - state.photos.length;
    if (room <= 0) {
      state = state.copyWith(
        errorMessage: 'Mỗi sản phẩm chỉ gửi được tối đa $_maxPhotos ảnh.',
      );
      return;
    }

    final accepted = picked.take(room).toList();
    state = state.copyWith(
      errorMessage: null,
      photos: [
        ...state.photos,
        ...accepted.map((file) => ListingPhoto(path: file.path)),
      ],
    );

    // Uploaded in parallel so the seller can keep typing while the bytes move.
    await Future.wait(accepted.map(_upload));
  }

  Future<void> _upload(XFile file) async {
    try {
      final bytes = await file.readAsBytes();
      if (bytes.length > _maxPhotoBytes) {
        _patchPhoto(
          file.path,
          (photo) => photo.copyWith(
            uploading: false,
            errorMessage: 'Ảnh lớn hơn 10 MB',
          ),
        );
        return;
      }
      final resourceId = await ref
          .read(listingComposerRepositoryProvider)
          .uploadPhoto(
            bytes: bytes,
            filename: file.name,
            mime: file.mimeType ?? _mimeFor(file.name),
          );
      _patchPhoto(
        file.path,
        (photo) => photo.copyWith(resourceId: resourceId, uploading: false),
      );
    } catch (e) {
      // Short on purpose: this lands inside a thumbnail. The seller's move is
      // to remove the photo and pick it again either way.
      final reason = _status(e) == 422
          ? 'Định dạng ảnh không nhận'
          : 'Tải ảnh thất bại';
      _patchPhoto(
        file.path,
        (photo) => photo.copyWith(uploading: false, errorMessage: reason),
      );
    }
  }

  void _patchPhoto(String path, ListingPhoto Function(ListingPhoto) patch) {
    if (!ref.mounted) return;
    state = state.copyWith(
      photos: state.photos
          .map((photo) => photo.path == path ? patch(photo) : photo)
          .toList(),
    );
  }

  void removePhoto(String path) {
    state = state.copyWith(
      photos: state.photos.where((photo) => photo.path != path).toList(),
    );
  }

  /// One synchronous call to `POST /listings/suggestions`. Answers a form to
  /// correct — it creates no listing and no draft, so calling it twice costs
  /// nothing but the wait.
  Future<void> requestSuggestion({
    required String note,
    VoiceNote? voiceNote,
  }) async {
    final attachments = state.photos
        .map((photo) => photo.resourceId)
        .whereType<String>()
        .toList();
    final trimmed = note.trim();
    if (attachments.isEmpty && trimmed.isEmpty && voiceNote == null) {
      state = state.copyWith(
        errorMessage:
            'Thêm ít nhất một ảnh hoặc vài dòng mô tả để AI có gì mà đọc.',
      );
      return;
    }

    state = state.copyWith(suggesting: true, errorMessage: null);
    try {
      final suggestion = await ref
          .read(listingComposerRepositoryProvider)
          .suggest(
            attachments: attachments,
            note: trimmed,
            voiceNote: voiceNote,
            // A transcription hint only, so it travels with a recording and
            // means nothing for typed text.
            language: voiceNote == null ? null : 'vi',
          );
      if (!ref.mounted) return;
      state = state.copyWith(suggesting: false, suggestion: suggestion);
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        suggesting: false,
        errorMessage: _suggestionErrorMessage(e),
      );
    }
  }

  /// Creates the listing, then queues it for moderation when [publish]. Two
  /// calls because publication is what takes the pickup address, and a seller
  /// who is not ready to be found keeps a draft.
  Future<bool> submit({
    required CreateListingRequest request,
    required bool publish,
    String? pickupContactId,
  }) async {
    state = state.copyWith(submitting: true, errorMessage: null);
    String? listingId;
    try {
      final listing = await ref
          .read(listingComposerRepositoryProvider)
          .createListing(request);
      listingId = listing.id;
      if (publish) {
        await ref
            .read(listingComposerRepositoryProvider)
            .publishListing(listingId, pickupContactId: pickupContactId);
      }
      if (!ref.mounted) return true;
      state = state.copyWith(
        submitting: false,
        createdListingId: listingId,
        published: publish,
      );
      return true;
    } catch (e) {
      if (!ref.mounted) return false;
      state = state.copyWith(
        submitting: false,
        // The listing already exists when publication is what failed. Saying so
        // is the difference between retrying the publication and posting the
        // same item a second time.
        createdListingId: listingId,
        errorMessage: listingId == null
            ? _createErrorMessage(e)
            : _publishErrorMessage(e),
      );
      return false;
    }
  }

  void reset() {
    state = const ListingSuggestionState();
    Future.microtask(_loadPickers);
  }
}

/// The API renders every failure as `{"error": {"code", "message"}}`, and its
/// message is written for a user — preferred over anything invented here.
String _serverMessage(Object error) {
  if (error is! DioException) return '';
  final data = error.response?.data;
  if (data is Map && data['error'] is Map) {
    final message = (data['error'] as Map)['message'];
    if (message is String && message.isNotEmpty) return message;
  }
  return '';
}

int? _status(Object error) =>
    error is DioException ? error.response?.statusCode : null;

String _or(Object error, String fallback) {
  final message = _serverMessage(error);
  if (message.isNotEmpty) return message;
  // No status means the request never reached a handler — a timeout or a dead
  // connection, which ErrorHandler already words for a user.
  return _status(error) == null
      ? ErrorHandler.getErrorMessage(error)
      : fallback;
}

String _suggestionErrorMessage(Object error) {
  switch (_status(error)) {
    case 413:
      return 'Ghi âm dài quá. Hãy nói ngắn hơn, hoặc gõ mô tả vào ô ghi chú.';
    case 422:
      return _or(
        error,
        'Chưa có ảnh hay mô tả nào để AI đọc, hoặc bạn cần xác minh danh tính trước khi bán.',
      );
    case 502:
      return 'AI chưa đọc ra được gì dùng được. Thử lại, hoặc tự điền form bên dưới.';
    default:
      return _or(error, 'Không lấy được gợi ý từ AI. Vui lòng thử lại.');
  }
}

String _createErrorMessage(Object error) {
  switch (_status(error)) {
    case 404:
      return _or(error, 'Danh mục, thẻ hoặc ảnh không còn tồn tại.');
    case 409:
      return _or(error, 'Tên sản phẩm này đã được dùng. Đổi tên khác nhé.');
    case 422:
      return _or(error, 'Bạn cần xác minh danh tính trước khi đăng bán.');
    default:
      return _or(error, 'Không lưu được sản phẩm. Vui lòng thử lại.');
  }
}

String _publishErrorMessage(Object error) {
  switch (_status(error)) {
    case 409:
      return 'Sản phẩm đã được lưu, và đang chờ duyệt hoặc đã lên sàn.';
    case 422:
      return _or(
        error,
        'Đã lưu sản phẩm nhưng chưa đăng được: cần một địa chỉ lấy hàng và ít nhất một phiên bản có giá.',
      );
    default:
      return _or(
        error,
        'Đã lưu sản phẩm nhưng chưa gửi duyệt được. Bạn có thể gửi lại từ danh sách sản phẩm.',
      );
  }
}

String _mimeFor(String filename) {
  final name = filename.toLowerCase();
  if (name.endsWith('.png')) return 'image/png';
  if (name.endsWith('.webp')) return 'image/webp';
  if (name.endsWith('.heic') || name.endsWith('.heif')) return 'image/heic';
  return 'image/jpeg';
}
