// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_vote_tally.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewVoteTally _$ReviewVoteTallyFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ReviewVoteTally',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['helpful', 'my_vote', 'not_helpful'],
        );
        final val = ReviewVoteTally(
          helpful: $checkedConvert('helpful', (v) => (v as num).toInt()),
          myVote: $checkedConvert(
            'my_vote',
            (v) => $enumDecodeNullable(_$ReviewVoteTallyMyVoteEnumEnumMap, v),
          ),
          notHelpful: $checkedConvert('not_helpful', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {'myVote': 'my_vote', 'notHelpful': 'not_helpful'},
    );

Map<String, dynamic> _$ReviewVoteTallyToJson(ReviewVoteTally instance) =>
    <String, dynamic>{
      'helpful': instance.helpful,
      'my_vote': _$ReviewVoteTallyMyVoteEnumEnumMap[instance.myVote],
      'not_helpful': instance.notHelpful,
    };

const _$ReviewVoteTallyMyVoteEnumEnumMap = {
  ReviewVoteTallyMyVoteEnum.numberNegative1: -1,
  ReviewVoteTallyMyVoteEnum.number1: 1,
};
