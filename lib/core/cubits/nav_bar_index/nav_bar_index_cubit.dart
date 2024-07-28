import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'nav_bar_index_state.dart';

class NavBarIndexCubit extends Cubit<SelectedIndex> {
  NavBarIndexCubit() : super(const SelectedIndex(index: 0));

  void selectedIndex(int selectedIndex) {
    emit(SelectedIndex(index: selectedIndex));
  }
}
