import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/localization/app_localizations.dart';
import 'config/routes/app_router.dart';
import 'config/theme/theme.dart';
import 'core/cubits/locale/localization_cubit.dart';
import 'core/cubits/middleware/middleware_cubit.dart';
import 'core/cubits/network/network_connection_cubit.dart';
import 'core/cubits/theme_mode/theme_mode_cubit.dart';
import 'feature/auth/presentation/bloc/auth_bloc/auth_bloc_bloc.dart';
import 'feature/browse/presentation/bloc/browse/home_bloc/browse_bloc.dart';
import 'feature/browse/presentation/bloc/browse/product_category_bloc/product_category_bloc.dart';
import 'feature/browse/presentation/bloc/settings/settings_bloc/settings_bloc.dart';
import 'feature/favorite/presentation/bloc/local_product_bloc/favorite_product_bloc.dart';
import 'init_dependencies.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocalizationCubit>(
          create: (context) => sl<LocalizationCubit>()..getSavedLanguage(),
        ),
        BlocProvider<ThemeModeCubit>(
          create: (context) => sl<ThemeModeCubit>()..getSavedThemeMode(),
        ),
        BlocProvider<NetworkConnectionCubit>(
          create: (context) =>
              sl<NetworkConnectionCubit>()..monitorInternetConnection(),
        ),
        BlocProvider<MiddlewareCubit>(
          create: (context) => sl<MiddlewareCubit>()..getSavedMiddlewarePage(),
        ),
        BlocProvider(
          create: (context) => sl<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<HomeBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<ProductCategoryBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<FavoriteProductBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<SettingsBloc>(),
        ),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          builder: (context, _) {
            final localizationState = context.watch<LocalizationCubit>().state;
            final themeModeState = context.watch<ThemeModeCubit>().state;
            final middlewareState = context.watch<MiddlewareCubit>().state;
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1.0)),
              child: MaterialApp(
                // builder: DevicePreview.appBuilder,
                title: 'e_commerce_n_flutter',
                themeMode: themeModeState.themeMode,
                theme: NAppTheme.lightTheme,
                darkTheme: NAppTheme.darkTheme,
                debugShowCheckedModeBanner: false,
                locale: localizationState.locale,
                // List all of the app's supported locales here
                supportedLocales: const [
                  Locale('en'),
                  Locale('ar'),
                ],
                // These delegates make sure that the localization
                // data for the proper language is loaded
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  // Built-in localization for text direction LTR/RTL
                  GlobalWidgetsLocalizations.delegate
                ],
                // Returns a locale which will be used by the app
                localeResolutionCallback: (locale, supportedLocales) {
                  // Check if the current device locale is supported
                  for (var supportedLocale in supportedLocales) {
                    if (supportedLocale.languageCode == locale!.languageCode &&
                        supportedLocale.countryCode == locale.countryCode) {
                      return supportedLocale;
                    }
                  }
                  // If the locale of the device is not supported, use the first one
                  // from the list (English, in this case).
                  return supportedLocales.first;
                },
                onGenerateRoute: AppRouter.onGenerateRoute,
                initialRoute: middlewareState.middlewarePage,
              ),
            );
          }),
    );
  }
}
