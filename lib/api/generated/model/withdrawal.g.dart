// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdrawal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Withdrawal _$WithdrawalFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Withdrawal',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'amount',
        'bank_account',
        'created_at',
        'currency',
        'id',
        'outcome',
        'status',
      ],
    );
    final val = Withdrawal(
      amount: $checkedConvert('amount', (v) => (v as num).toInt()),
      bankAccount: $checkedConvert(
        'bank_account',
        (v) => BankAccount.fromJson(v as Map<String, dynamic>),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      currency: $checkedConvert('currency', (v) => v as String),
      id: $checkedConvert('id', (v) => v as String),
      outcome: $checkedConvert(
        'outcome',
        (v) => $enumDecode(_$WithdrawalOutcomeEnumMap, v),
      ),
      resolutionNote: $checkedConvert('resolution_note', (v) => v as String?),
      resolvedAt: $checkedConvert(
        'resolved_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      resolvedById: $checkedConvert('resolved_by_id', (v) => v as String?),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(_$PaymentSessionStatusEnumMap, v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'bankAccount': 'bank_account',
    'createdAt': 'created_at',
    'resolutionNote': 'resolution_note',
    'resolvedAt': 'resolved_at',
    'resolvedById': 'resolved_by_id',
  },
);

Map<String, dynamic> _$WithdrawalToJson(Withdrawal instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'bank_account': instance.bankAccount.toJson(),
      'created_at': instance.createdAt.toIso8601String(),
      'currency': instance.currency,
      'id': instance.id,
      'outcome': _$WithdrawalOutcomeEnumMap[instance.outcome]!,
      'resolution_note': ?instance.resolutionNote,
      'resolved_at': ?instance.resolvedAt?.toIso8601String(),
      'resolved_by_id': ?instance.resolvedById,
      'status': _$PaymentSessionStatusEnumMap[instance.status]!,
    };

const _$WithdrawalOutcomeEnumMap = {
  WithdrawalOutcome.awaitingReview: 'awaiting-review',
  WithdrawalOutcome.approved: 'approved',
  WithdrawalOutcome.rejected: 'rejected',
  WithdrawalOutcome.cancelled: 'cancelled',
};

const _$PaymentSessionStatusEnumMap = {
  PaymentSessionStatus.pending: 'pending',
  PaymentSessionStatus.processing: 'processing',
  PaymentSessionStatus.success: 'success',
  PaymentSessionStatus.cancelled: 'cancelled',
  PaymentSessionStatus.failed: 'failed',
};
