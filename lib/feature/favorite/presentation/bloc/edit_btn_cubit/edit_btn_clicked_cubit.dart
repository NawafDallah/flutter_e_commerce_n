import 'package:flutter_bloc/flutter_bloc.dart';


class EditBtnClickedCubit extends Cubit<bool> {
  EditBtnClickedCubit() : super(false);

  void isCicked() {
    emit(!state);
  }
}




