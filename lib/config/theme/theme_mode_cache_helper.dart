import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeCacheHelper {
  final SharedPreferences _sharedPreferences;

  const ThemeModeCacheHelper({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  /// cache the THEME_MODE in locale storage
  void cacheThemeMode(String themeMode) {
    _sharedPreferences.setString("THEME_MODE", themeMode);
  }

  /// get the THEME_MODE from locale storage. if null
  /// return default. in this case THEME_MODE.SYSTEM
  String getCachedThemeMode() {
    final cachedThemeModeCode = _sharedPreferences.getString("THEME_MODE");
    if (cachedThemeModeCode != null) {
      return cachedThemeModeCode;
    } else {
      return "system";
    }
  }
}
