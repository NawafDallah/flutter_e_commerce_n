import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/entities/products_entity.dart';
import '../../../../domain/use_case/search_product.dart';

part 'search_product_event.dart';
part 'search_product_state.dart';

class SearchProductBloc extends Bloc<SearchProductEvent, SearchProductState> {
  final SearchProductCase _searchProductCase;
  SearchProductBloc({required SearchProductCase searchProductCase})
      : _searchProductCase = searchProductCase,
        super(SearchProductInitial()) {
    on<SearchProductInitialEvent>(_initialEvent);
    on<SearchForProductEvent>(_searchProduct);
  }

  _initialEvent(
    SearchProductInitialEvent event,
    Emitter<SearchProductState> emit,
  ) {
    emit(SearchProductInitial());
  }

  _searchProduct(
    SearchForProductEvent event,
    Emitter<SearchProductState> emit,
  ) async {
    emit(SearchProductLoading());
    final products = await _searchProductCase(params: event.productName);

    products.fold(
      (failure) => emit(SearchProductFailure(error: failure.message!)),
      (products) => emit(
        SearchProductSuccess(products: products),
      ),
    );
  }
}
