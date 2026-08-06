//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// How a withdrawal ended, stated rather than inferred. The underlying session status can be translated into it — `cancelled` and `failed` are different rows, so a cash-out the payee called off is distinguishable from one an admin refused — but that translation is the platform's to make: five statuses onto four outcomes is a mapping every client would otherwise re-derive, and be one release behind on the day a status is added. `awaiting-review` covers both `pending` and `processing`.
enum WithdrawalOutcome {
  /// How a withdrawal ended, stated rather than inferred. The underlying session status can be translated into it — `cancelled` and `failed` are different rows, so a cash-out the payee called off is distinguishable from one an admin refused — but that translation is the platform's to make: five statuses onto four outcomes is a mapping every client would otherwise re-derive, and be one release behind on the day a status is added. `awaiting-review` covers both `pending` and `processing`.
  @JsonValue(r'awaiting-review')
  awaitingReview(r'awaiting-review'),

  /// How a withdrawal ended, stated rather than inferred. The underlying session status can be translated into it — `cancelled` and `failed` are different rows, so a cash-out the payee called off is distinguishable from one an admin refused — but that translation is the platform's to make: five statuses onto four outcomes is a mapping every client would otherwise re-derive, and be one release behind on the day a status is added. `awaiting-review` covers both `pending` and `processing`.
  @JsonValue(r'approved')
  approved(r'approved'),

  /// How a withdrawal ended, stated rather than inferred. The underlying session status can be translated into it — `cancelled` and `failed` are different rows, so a cash-out the payee called off is distinguishable from one an admin refused — but that translation is the platform's to make: five statuses onto four outcomes is a mapping every client would otherwise re-derive, and be one release behind on the day a status is added. `awaiting-review` covers both `pending` and `processing`.
  @JsonValue(r'rejected')
  rejected(r'rejected'),

  /// How a withdrawal ended, stated rather than inferred. The underlying session status can be translated into it — `cancelled` and `failed` are different rows, so a cash-out the payee called off is distinguishable from one an admin refused — but that translation is the platform's to make: five statuses onto four outcomes is a mapping every client would otherwise re-derive, and be one release behind on the day a status is added. `awaiting-review` covers both `pending` and `processing`.
  @JsonValue(r'cancelled')
  cancelled(r'cancelled');

  const WithdrawalOutcome(this.value);

  final String value;

  @override
  String toString() => value;
}
