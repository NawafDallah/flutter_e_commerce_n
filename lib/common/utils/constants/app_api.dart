import 'api_secret.dart';

class AppApi {
  const AppApi._(); // to avoid initiate object

  /////////////////////// Images link api ///////////////////////
  static const String catigoriesImage = "$imageApiLink/catigories";
  static const String bannersImage = "$imageApiLink/banners";
  static const String productsImage = "$imageApiLink/products";

  /////////////////////// Auth ///////////////////////
  static const String signUp = "$secretAPIKey/auth/sign_up.php";
  static const String logIn = "$secretAPIKey/auth/sign_in.php";
  static const String verifyCode = "$secretAPIKey/auth/verify_code.php";
  static const String forgetPassword = "$secretAPIKey/auth/forget_password.php";
  static const String resetPassword = "$secretAPIKey/auth/reset_password.php";
  static const String resendVerifyCode =
      "$secretAPIKey/auth/resend_verification_code.php";

  /////////////////////// Browse ///////////////////////
  static const String home = "$secretAPIKey/browse/home.php";
  // needs categoryId=?&page=?&itemsPerPage=? ->
  static const String products = "$secretAPIKey/browse/item.php?";
  // needs userId=? ->
  static const String updateUser = "$secretAPIKey/browse/update_user.php?";
  // needs userId=? ->
  static const String deleteUser = "$secretAPIKey/browse/delete_user.php?";
}
