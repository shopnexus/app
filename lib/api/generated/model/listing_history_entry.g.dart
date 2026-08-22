// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_history_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListingHistoryEntry _$ListingHistoryEntryFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ListingHistoryEntry',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'actor',
            'actor_kind',
            'change_type',
            'changed_at',
            'code',
            'details',
            'fields',
            'version',
          ],
        );
        final val = ListingHistoryEntry(
          actor: $checkedConvert(
            'actor',
            (v) => v == null
                ? null
                : AccountSummary.fromJson(v as Map<String, dynamic>),
          ),
          actorKind: $checkedConvert(
            'actor_kind',
            (v) => $enumDecode(_$ListingHistoryEntryActorKindEnumEnumMap, v),
          ),
          changeType: $checkedConvert(
            'change_type',
            (v) => $enumDecode(_$ListingHistoryEntryChangeTypeEnumEnumMap, v),
          ),
          changedAt: $checkedConvert(
            'changed_at',
            (v) => DateTime.parse(v as String),
          ),
          code: $checkedConvert(
            'code',
            (v) => $enumDecode(_$ListingHistoryCodeEnumMap, v),
          ),
          details: $checkedConvert(
            'details',
            (v) => (v as Map<String, dynamic>).map(
              (k, e) => MapEntry(k, e as Object),
            ),
          ),
          fields: $checkedConvert(
            'fields',
            (v) => (v as List<dynamic>).map((e) => e as String).toList(),
          ),
          version: $checkedConvert('version', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'actorKind': 'actor_kind',
        'changeType': 'change_type',
        'changedAt': 'changed_at',
      },
    );

Map<String, dynamic> _$ListingHistoryEntryToJson(
  ListingHistoryEntry instance,
) => <String, dynamic>{
  'actor': instance.actor?.toJson(),
  'actor_kind': _$ListingHistoryEntryActorKindEnumEnumMap[instance.actorKind]!,
  'change_type':
      _$ListingHistoryEntryChangeTypeEnumEnumMap[instance.changeType]!,
  'changed_at': instance.changedAt.toIso8601String(),
  'code': _$ListingHistoryCodeEnumMap[instance.code]!,
  'details': instance.details,
  'fields': instance.fields,
  'version': instance.version,
};

const _$ListingHistoryEntryActorKindEnumEnumMap = {
  ListingHistoryEntryActorKindEnum.seller: 'seller',
  ListingHistoryEntryActorKindEnum.staff: 'staff',
  ListingHistoryEntryActorKindEnum.system: 'system',
};

const _$ListingHistoryEntryChangeTypeEnumEnumMap = {
  ListingHistoryEntryChangeTypeEnum.insert: 'insert',
  ListingHistoryEntryChangeTypeEnum.update: 'update',
  ListingHistoryEntryChangeTypeEnum.delete: 'delete',
};

const _$ListingHistoryCodeEnumMap = {
  ListingHistoryCode.listingPeriodCreate: 'listing.create',
  ListingHistoryCode.listingPeriodEdit: 'listing.edit',
  ListingHistoryCode.listingPeriodEditSubmitted: 'listing.edit_submitted',
  ListingHistoryCode.listingPeriodPublish: 'listing.publish',
  ListingHistoryCode.listingPeriodApprove: 'listing.approve',
  ListingHistoryCode.listingPeriodTakedown: 'listing.takedown',
  ListingHistoryCode.listingPeriodHide: 'listing.hide',
  ListingHistoryCode.listingPeriodVariantAdded: 'listing.variant_added',
  ListingHistoryCode.listingPeriodVariantEdited: 'listing.variant_edited',
  ListingHistoryCode.listingPeriodVariantRemoved: 'listing.variant_removed',
  ListingHistoryCode.listingPeriodDelete: 'listing.delete',
};
