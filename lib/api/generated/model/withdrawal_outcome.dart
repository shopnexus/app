//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// How a withdrawal ended, stated rather than inferred. The underlying session status cannot say it on its own: a cash-out the owner called off and one an admin refused both leave the money back in the wallet and the session not-successful, and telling them apart by whether `resolved_by_id` happens to be set is a rule every client would have to know. `awaiting-review` covers both `pending` and `processing`. 
enum WithdrawalOutcome {
          /// How a withdrawal ended, stated rather than inferred. The underlying session status cannot say it on its own: a cash-out the owner called off and one an admin refused both leave the money back in the wallet and the session not-successful, and telling them apart by whether `resolved_by_id` happens to be set is a rule every client would have to know. `awaiting-review` covers both `pending` and `processing`. 
      @JsonValue(r'awaiting-review')
      awaitingReview(r'awaiting-review'),
          /// How a withdrawal ended, stated rather than inferred. The underlying session status cannot say it on its own: a cash-out the owner called off and one an admin refused both leave the money back in the wallet and the session not-successful, and telling them apart by whether `resolved_by_id` happens to be set is a rule every client would have to know. `awaiting-review` covers both `pending` and `processing`. 
      @JsonValue(r'approved')
      approved(r'approved'),
          /// How a withdrawal ended, stated rather than inferred. The underlying session status cannot say it on its own: a cash-out the owner called off and one an admin refused both leave the money back in the wallet and the session not-successful, and telling them apart by whether `resolved_by_id` happens to be set is a rule every client would have to know. `awaiting-review` covers both `pending` and `processing`. 
      @JsonValue(r'rejected')
      rejected(r'rejected'),
          /// How a withdrawal ended, stated rather than inferred. The underlying session status cannot say it on its own: a cash-out the owner called off and one an admin refused both leave the money back in the wallet and the session not-successful, and telling them apart by whether `resolved_by_id` happens to be set is a rule every client would have to know. `awaiting-review` covers both `pending` and `processing`. 
      @JsonValue(r'cancelled')
      cancelled(r'cancelled');

  const WithdrawalOutcome(this.value);

  final String value;

  @override
  String toString() => value;
}
