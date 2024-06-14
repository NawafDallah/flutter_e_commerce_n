part of 'localization_cubit.dart';

class ChangeLocaleState extends Equatable {
  final Locale locale;
  const ChangeLocaleState({required this.locale});

  @override
  List<Object?> get props => [locale];
}
