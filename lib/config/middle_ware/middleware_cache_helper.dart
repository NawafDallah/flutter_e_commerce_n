import 'package:shared_preferences/shared_preferences.dart';

import '../routes/routes.dart';

class MiddlewareCacheHelper {
  final SharedPreferences _sharedPreferences;

  const MiddlewareCacheHelper({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;
 
  /// cache the middleware page in locale storage
  void cacheMiddleware(String page) {
    _sharedPreferences.setString("MIDDLEWARE", page);
  }

  /// get the middleware pagr from locale storage. if null
  /// return in this case onBoarding page
  String getCachedMiddleware() {
    final cachedMiddleware = _sharedPreferences.getString("MIDDLEWARE");
    if (cachedMiddleware != null) {
      return cachedMiddleware;
    } else {
      return Routes.onBoarding;
    }
  }
}
