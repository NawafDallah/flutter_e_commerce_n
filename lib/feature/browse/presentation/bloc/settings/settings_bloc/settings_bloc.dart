import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/use_case/delete_user.dart';
import '../../../../domain/use_case/update_user.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final DeleteUserCase _deleteUserCase;
  final UpdateUserCase _updateUserCase;

  SettingsBloc({
    required DeleteUserCase deleteUserCase,
    required UpdateUserCase updateUserCase,
  })  : _deleteUserCase = deleteUserCase,
        _updateUserCase = updateUserCase,
        super(SettingsInitial()) {
    on<UpdateUserEvent>(_onUpdateUser);
    on<DeleteUserEvent>(_onDeleteUser);
  }

  void _onDeleteUser(
    DeleteUserEvent event,
    Emitter<SettingsState> emit,
  ) async {
    emit(DeleteUserLoadingState());
    final response = await _deleteUserCase(params: event.userId);

    response.fold(
      (l) => emit(DeleteUserFailureState(error: l.message!)),
      (r) => emit(DeleteUserSuccessState()),
    );
  }

  void _onUpdateUser(
    UpdateUserEvent event,
    Emitter<SettingsState> emit,
  ) async {
    emit(UpdateUserLoadingState());

    final response = await _updateUserCase(
        params: UpdateUserParams(
      userId: event.userId,
      userPhone: event.userPhone,
      userName: event.userName,
    ));
    response.fold(
      (l) => emit(UpdateUserFailureState(error: l.message!)),
      (r) => emit(UpdateUserSuccessState()),
    );
  }
}
