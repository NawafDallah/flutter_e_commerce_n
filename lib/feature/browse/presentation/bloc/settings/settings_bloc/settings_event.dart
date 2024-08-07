part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

final class UpdateUserEvent extends SettingsEvent {
  final int userId;
  final int userPhone;
  final String userName;

  const UpdateUserEvent({
    required this.userId,
    required this.userPhone,
    required this.userName,
  });

  @override
  List<Object> get props => [userId];
}

final class DeleteUserEvent extends SettingsEvent {
  final int userId;

  const DeleteUserEvent({required this.userId});

  @override
  List<Object> get props => [userId];
}
