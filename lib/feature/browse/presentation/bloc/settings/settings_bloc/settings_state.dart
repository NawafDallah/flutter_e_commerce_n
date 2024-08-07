part of 'settings_bloc.dart';

sealed class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

final class SettingsInitial extends SettingsState {}

////////////////  SETTINGS SUCCESS ////////////////

final class UpdateUserSuccessState extends SettingsState {}

final class DeleteUserSuccessState extends SettingsState {}

////////////////  SETTINGS LOADING ////////////////

final class UpdateUserLoadingState extends SettingsState {}

final class DeleteUserLoadingState extends SettingsState {}

////////////////  SETTINGS FAILURE ////////////////

final class UpdateUserFailureState extends SettingsState {
  final String error;

  const UpdateUserFailureState({required this.error});
}

final class DeleteUserFailureState extends SettingsState {
  final String error;

  const DeleteUserFailureState({required this.error});
}
