//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'suggest_listing_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SuggestListingRequest {
  /// Returns a new [SuggestListingRequest] instance.
  SuggestListingRequest({
    this.attachments,

    this.language,

    this.note,

    this.voiceNote,

    this.voiceNoteMime,
  });

  /// Confirmed uploads. The first three are what the model reads.
  @JsonKey(name: r'attachments', required: false, includeIfNull: false)
  final List<String>? attachments;

  /// ISO-639-1 hint for the transcription. Omit to let the model detect.
  @JsonKey(name: r'language', required: false, includeIfNull: false)
  final String? language;

  /// What the seller typed. A phone's own dictation key fills this in just as well.
  @JsonKey(name: r'note', required: false, includeIfNull: false)
  final String? note;

  /// The recording, base64. Inline rather than an upload because it is input and not content: nothing keeps it, so nothing has to reap it. Around a megabyte at most — a seller describes an item in a sentence or two.
  @JsonKey(name: r'voice_note', required: false, includeIfNull: false)
  final String? voiceNote;

  @JsonKey(name: r'voice_note_mime', required: false, includeIfNull: false)
  final String? voiceNoteMime;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SuggestListingRequest &&
          other.attachments == attachments &&
          other.language == language &&
          other.note == note &&
          other.voiceNote == voiceNote &&
          other.voiceNoteMime == voiceNoteMime;

  @override
  int get hashCode =>
      attachments.hashCode +
      language.hashCode +
      note.hashCode +
      voiceNote.hashCode +
      voiceNoteMime.hashCode;

  factory SuggestListingRequest.fromJson(Map<String, dynamic> json) =>
      _$SuggestListingRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestListingRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
