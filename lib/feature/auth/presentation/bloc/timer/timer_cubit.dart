import 'dart:async';
import 'package:bloc/bloc.dart';

class TimerCubit extends Cubit<int> {
  late Timer _timer;
  bool _isClosed = false;

  TimerCubit() : super(60);

  void startTimer() {
    emit(60);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state == 0) {
        timer.cancel();
      } else if(!_isClosed){
        emit(state - 1);
      }
    });
  }

  void stopTimer() {
    _timer.cancel();
  }

  @override
  Future<void> close() {
    _isClosed = true;
     _timer.cancel();
    return super.close();
  }
}
