import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/products_entity.dart';

class SelectedFavoriteProductsCubit extends Cubit<Set<ProductEntity>> {
  SelectedFavoriteProductsCubit() : super({});

  void toggleSelection(ProductEntity product) {
    final updatedSelection = Set<ProductEntity>.from(state);
    if (updatedSelection.contains(product)) {
      updatedSelection.remove(product);
    } else {
      updatedSelection.add(product);
    }
    emit(updatedSelection);
  }

  void clearSelection() {
    emit({});
  }
}
