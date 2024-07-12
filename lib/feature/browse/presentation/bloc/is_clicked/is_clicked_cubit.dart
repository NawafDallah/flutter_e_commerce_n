import 'package:flutter_bloc/flutter_bloc.dart';

class IsEditBtnClickedCubit extends Cubit<bool> {
  IsEditBtnClickedCubit() : super(false);

  void isCicked() {
    emit(!state);
  }
}

class IsFavoriteCardClickedCubit extends Cubit<int?> {
  IsFavoriteCardClickedCubit() : super(null);

  void isSelected(int index) {
    emit(index);
  }
}
