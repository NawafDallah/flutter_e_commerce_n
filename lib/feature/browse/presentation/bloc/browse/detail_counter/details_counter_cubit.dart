import 'package:bloc/bloc.dart';

class DetailsCounterCubit extends Cubit<int> {
  DetailsCounterCubit() : super(0);

  void incriment() {
    emit(state + 1);
  }

  void decriment() {
    if (state == 0) {
      emit(state);
    } else{
      emit(state - 1);
    }
    
  }
}
