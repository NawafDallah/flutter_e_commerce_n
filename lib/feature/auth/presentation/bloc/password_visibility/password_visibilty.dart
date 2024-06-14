import 'package:flutter_bloc/flutter_bloc.dart';

class LogInPassVisibilityCubit extends Cubit<bool> {
  LogInPassVisibilityCubit() : super(true);

  void toggleVisibility() => emit(!state);
}

class SignUpPassVisibilityCubit extends Cubit<bool> {
  SignUpPassVisibilityCubit() : super(true);

  void toggleVisibility() => emit(!state);
}


class ResetPassVisibilityCubit extends Cubit<bool> {
  ResetPassVisibilityCubit() : super(true);

  void toggleVisibility() => emit(!state);
}

class ConfirmPassVisibilityCubit extends Cubit<bool> {
  ConfirmPassVisibilityCubit() : super(true);

  void toggleVisibility() => emit(!state);
}
