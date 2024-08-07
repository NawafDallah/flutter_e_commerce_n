import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<bool> {
  ProfileCubit() : super(false);

  void set(bool value) {
    emit(value);
  }
}
