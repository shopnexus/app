/// The auth request/response shapes are the generated ones — this file only
/// re-exports them, so the feature's own layers keep one import.
///
/// There used to be a hand-written freezed twin of every request here, each the
/// same fields under the same json keys. A drift between the two was a runtime
/// 400 nobody saw until a user hit it.
library;

export 'package:shopnexus_flutter_app/api/generated/model/auth_result.dart';
export 'package:shopnexus_flutter_app/api/generated/model/change_password_request.dart';
export 'package:shopnexus_flutter_app/api/generated/model/email_verification_request.dart';
export 'package:shopnexus_flutter_app/api/generated/model/login_request.dart';
export 'package:shopnexus_flutter_app/api/generated/model/logout_request.dart';
export 'package:shopnexus_flutter_app/api/generated/model/o_auth_login_request.dart';
export 'package:shopnexus_flutter_app/api/generated/model/password_reset_confirm_request.dart';
export 'package:shopnexus_flutter_app/api/generated/model/password_reset_request.dart';
export 'package:shopnexus_flutter_app/api/generated/model/refresh_request.dart';
export 'package:shopnexus_flutter_app/api/generated/model/register_request.dart';
