part of 'init_dependencies.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  /// dio
  sl.registerLazySingleton<Dio>(() => Dio());

  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

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

  /// browse-->
  _initBrowse();

  /// favorite-->
  _initFavorite();
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
      () => AuthRepositoryImp(authService: sl()),
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

_initBrowse() {
  /// data sources
  sl
    ..registerFactory<BrowseService>(
      () => BrowseServiceImp(dio: sl()),
    )

    /// repository
    ..registerFactory<BrowseRepository>(
      () => BrowseRepositoryImp(browseService: sl()),
    )

    /// use cases
    ..registerFactory(() => GetHomeDataCase(browseRepository: sl()))
    ..registerFactory(() => GetProductsCase(browseRepository: sl()))

    /// bloc
    ..registerLazySingleton<HomeBloc>(
      () => HomeBloc(
        getHomeDataCase: sl(),
      ),
    )
    ..registerLazySingleton<ProductCategoryBloc>(
      () => ProductCategoryBloc(
        getProductsCase: sl(),
      ),
    );
}

_initFavorite() {
  /// repository
  sl
    ..registerFactory<FavoriteProductRepo>(
      () => FavoriteProductRepoImp(appDatabase: sl()),
    )

    /// use cases
    ..registerFactory(() => GetSavedProductUseCase(favoriteProductRepo: sl()))
    ..registerFactory(
        () => DeleteFavoriteProductsUseCase(favoriteProductRepo: sl()))
    ..registerFactory(
        () => AddProductToFavoriteUseCase(favoriteProductRepo: sl()))
    ..registerFactory(
        () => DeleteFavoriteProductUseCase(favoriteProductRepo: sl()))

    /// bloc
    ..registerLazySingleton<FavoriteProductBloc>(
      () => FavoriteProductBloc(
        addProductToFavoriteUseCase: sl(),
        deleteFavoriteProductsUseCase: sl(),
        getSavedProductUseCase: sl(),
        deleteFavoriteProductUseCase: sl(),
      ),
    );
}
