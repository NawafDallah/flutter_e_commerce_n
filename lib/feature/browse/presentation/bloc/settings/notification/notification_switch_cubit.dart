import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationSwitchCubit extends Cubit<bool> {
  NotificationSwitchCubit() : super(false);

  void toggleSwitch() {
    emit(!state);
  }
}
