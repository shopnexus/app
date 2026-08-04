// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote_review_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoteReviewRequest _$VoteReviewRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('VoteReviewRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['vote']);
      final val = VoteReviewRequest(
        vote: $checkedConvert(
          'vote',
          (v) => $enumDecode(_$VoteReviewRequestVoteEnumEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$VoteReviewRequestToJson(VoteReviewRequest instance) =>
    <String, dynamic>{
      'vote': _$VoteReviewRequestVoteEnumEnumMap[instance.vote]!,
    };

const _$VoteReviewRequestVoteEnumEnumMap = {
  VoteReviewRequestVoteEnum.numberNegative1: -1,
  VoteReviewRequestVoteEnum.number1: 1,
};
