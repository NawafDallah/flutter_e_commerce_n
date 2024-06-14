import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../config/middle_ware/middleware_cache_helper.dart';
import '../../../config/routes/routes.dart';

part 'middleware_state.dart';

class MiddlewareCubit extends Cubit<MiddlewareState> {
  final MiddlewareCacheHelper _middlewareCacheHelper;
  MiddlewareCubit({required MiddlewareCacheHelper middlewareCacheHelper})
      : _middlewareCacheHelper = middlewareCacheHelper,
        super(const MiddlewareState(
          middlewarePage: Routes.onBoarding,
        ));

  void getSavedMiddlewarePage() {
    final String cachedMiddlewarePage =
        _middlewareCacheHelper.getCachedMiddleware();

    emit(MiddlewareState(middlewarePage: cachedMiddlewarePage));
  }

  void changeMiddleWarePage(String middlewarePage) {
    _middlewareCacheHelper.cacheMiddleware(middlewarePage);
    emit(MiddlewareState(middlewarePage: middlewarePage));
  }
}
