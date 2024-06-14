import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../config/localization/language_cache_helper.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<ChangeLocaleState> {
  final LanguageCacheHelper _languageCacheHelper;
  LocalizationCubit({required LanguageCacheHelper languageCacheHelper})
      : _languageCacheHelper = languageCacheHelper,
        super(const ChangeLocaleState(locale: Locale('en')));

  void getSavedLanguage() {
    final String cachedLanguageCode =
        _languageCacheHelper.getCachedLanguageCode();

    emit(ChangeLocaleState(locale: Locale(cachedLanguageCode)));
  }

  void changeLanguage(String languageCode) {
    _languageCacheHelper.cacheLanguageCode(languageCode);
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }
}
