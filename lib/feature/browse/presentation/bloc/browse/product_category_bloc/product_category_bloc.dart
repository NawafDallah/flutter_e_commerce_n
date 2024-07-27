import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../../core/entities/products_entity.dart';
import '../../../../domain/use_case/get_products.dart';

part 'product_category_event.dart';
part 'product_category_state.dart';

class ProductCategoryBloc
    extends Bloc<ProductCategoryEvent, ProductCategoryState> {
  final GetProductsCase _getProductsCase;
  ProductCategoryBloc({
    required GetProductsCase getProductsCase,
  })  : _getProductsCase = getProductsCase,
        super(const ProductCategoryInitial()) {
    on<GetProductsEvent>(_getProducts);
  }

  void _getProducts(
    GetProductsEvent event,
    Emitter<ProductCategoryState> emit,
  ) async {
    emit(const GetProductLoadingStata());
    final catigories = await _getProductsCase(
        params: ProductParams(
      catigoryId: event.categoryId,
      page: event.page,
      itemsPerPage: event.itemsPerPage,
    ));

    await Future.delayed(const Duration(seconds: 1), () {
      catigories.fold(
        (failure) => emit(GetProductFailureStata(error: failure.message!)),
        (products) => emit(GetProductSuccessState(products: products)),
      );
    });
  }
}
