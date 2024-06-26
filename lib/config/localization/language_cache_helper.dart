import 'package:shared_preferences/shared_preferences.dart';

class LanguageCacheHelper {
  final SharedPreferences _sharedPreferences;

  const LanguageCacheHelper({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  /// cache the languageCode in locale storage
  void cacheLanguageCode(String languageCode) {
    _sharedPreferences.setString("LOCALE", languageCode);
  }

  /// get the languageCode from locale storage. if null
  /// return in this case engilsh languageCode
  String getCachedLanguageCode() {
    final cachedLanguageCode = _sharedPreferences.getString("LOCALE");
    if (cachedLanguageCode != null) {
      return cachedLanguageCode;
    } else {
      return "en";
    }
  }
}
