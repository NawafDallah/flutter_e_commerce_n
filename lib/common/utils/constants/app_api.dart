import 'api_secret.dart';

class AppApi {
  const AppApi._(); // to avoid initiate object

  /////////////////////// Auth ///////////////////////
  static const String signUp = "$secretAPIKey/auth/sign_up.php";
  static const String logIn = "$secretAPIKey/auth/sign_in.php";
  static const String verifyCode = "$secretAPIKey/auth/verify_code.php";
  static const String forgetPassword = "$secretAPIKey/auth/forget_password.php";
  static const String resetPassword = "$secretAPIKey/auth/reset_password.php";
  static const String resendVerifyCode = "$secretAPIKey/auth/resend_verification_code.php";
}
