part of 'theme_mode_cubit.dart';

class ChangeThemeModeState extends Equatable{
  final ThemeMode themeMode;

  const ChangeThemeModeState({required this.themeMode});
  @override
  List<Object> get props => [themeMode];
}
