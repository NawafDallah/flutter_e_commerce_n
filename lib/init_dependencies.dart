import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config/localization/language_cache_helper.dart';
import 'config/middle_ware/middleware_cache_helper.dart';
import 'config/theme/theme_mode_cache_helper.dart';
import 'core/cubits/locale/localization_cubit.dart';
import 'core/cubits/middleware/middleware_cubit.dart';
import 'core/cubits/network/network_connection_cubit.dart';
import 'core/cubits/theme_mode/theme_mode_cubit.dart';
import 'feature/auth/data/date_sources/user_service.dart';
import 'feature/auth/data/repository/auth_repository_impl.dart';
import 'feature/auth/domain/repository/auth_repository.dart';
import 'feature/auth/domain/use_case/user_forget_password.dart';
import 'feature/auth/domain/use_case/user_log_in.dart';
import 'feature/auth/domain/use_case/user_resend_verify_code.dart';
import 'feature/auth/domain/use_case/user_reset_password.dart';
import 'feature/auth/domain/use_case/user_sign_up.dart';
import 'feature/auth/domain/use_case/user_verify_code.dart';
import 'feature/auth/presentation/bloc/auth_bloc/auth_bloc_bloc.dart';
import 'feature/on_boarding/data/data_sources/static/on_boarding_service.dart';
import 'feature/on_boarding/data/repository/on_boarding_repository_imp.dart';
import 'feature/on_boarding/domain/repository/on_boarding_repository.dart';
import 'feature/on_boarding/domain/use_case/get_on_boarding_list.dart';
import 'feature/on_boarding/presentation/bloc/on_boarding_list/onboarding_cubit.dart';


final sl = GetIt.instance;

Future<void> initDependencies() async {
  /// dio
  sl.registerLazySingleton<Dio>(() => Dio());

  // Hive (Local Storage)
  Hive.init((await getApplicationDocumentsDirectory()).path);
  final userBox = await Hive.openBox("userBox");
  sl.registerLazySingleton(() => userBox);

  /// SharedPreferences (Local Storage)
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  ///// core & config /////

  /// INTERNET-CONNECTION-->
  /// core/network-cubit
  sl.registerLazySingleton(() => NetworkConnectionCubit());

  /// LOCALIZATION--> 
  /// config/LanguageCacheHelper
  sl.registerFactory(() => LanguageCacheHelper(sharedPreferences: sl()));

  /// core/Localization-cubit
  sl.registerLazySingleton(() => LocalizationCubit(languageCacheHelper: sl()));

  /// THEME_MODE-->
  /// config/ThemeModeCacheHelper
  sl.registerFactory(() => ThemeModeCacheHelper(sharedPreferences: sl()));

  /// core/ThemeMode-cubit
  sl.registerLazySingleton(() => ThemeModeCubit(themeModeCacheHelper: sl()));

  /// MIDDLEWARE-->
  /// config/MiddlewareCacheHelper
  sl.registerFactory(() => MiddlewareCacheHelper(sharedPreferences: sl()));

  /// core/Middleware-cubit
  sl.registerLazySingleton(() => MiddlewareCubit(middlewareCacheHelper: sl()));

  ///// Features /////

  /// on-boarding-->
  _initOnBoarding();

  /// auth-->
  _initAuth();
}

_initOnBoarding() {
  /// data sources
  sl
    ..registerFactory<OnBoardingService>(
      () => const OnBoardingServiceImp(),
    )

    /// repository
    ..registerFactory<OnBoardingRepository>(
      () => OnBoardingRepositoryImp(onboardingService: sl()),
    )

    /// use cases
    ..registerFactory(
      () => GetOnBoardingListCase(onBoardingRepository: sl()),
    )

    /// bloc
    ..registerLazySingleton(
      () => OnboardingCubit(getOnBoardingListCase: sl()),
    );
}

_initAuth() {
  /// data sources
  sl
    ..registerFactory<AuthService>(
      () => AuthServiceImp(dio: sl()),
    )

    /// repository
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImp(authService: sl(), /*userBox: sl() */),
    )

    /// use cases
    ..registerFactory(() => UserSignUpCase(authRepository: sl()))
    ..registerFactory(() => UserVerifyCodeCase(authRepository: sl()))
    ..registerFactory(() => ResendVerifyCodeCase(authRepository: sl()))
    ..registerFactory(() => ForgetPasswordCase(authRepository: sl()))
    ..registerFactory(() => ResetPasswordCase(authRepository: sl()))
    ..registerFactory(() => UserLogInCase(authRepository: sl()))

    /// bloc
    ..registerLazySingleton<AuthBloc>(
      () => AuthBloc(
        userSignUpCase: sl(),
        userVerifyCodeCase: sl(),
        resendVerifyCodeCase: sl(),
        forgetPasswordCase: sl(),
        resetPasswordCase: sl(),
        userLogInCase: sl(),
      ),
    );
}
