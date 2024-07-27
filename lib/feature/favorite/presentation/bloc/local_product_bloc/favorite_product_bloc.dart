import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/entities/products_entity.dart';
import '../../../domain/use_case/add_product_to_favorite.dart';
import '../../../domain/use_case/delete_favorite_product.dart';
import '../../../domain/use_case/delete_favorite_products.dart';
import '../../../domain/use_case/get_saved_product.dart';

part 'favorite_product_event.dart';
part 'favorite_product_state.dart';

class FavoriteProductBloc
    extends Bloc<FavoriteProductEvent, FavoriteProductState> {
  final GetSavedProductUseCase _getSavedProductUseCase;
  final DeleteFavoriteProductsUseCase _deleteFavoriteProductsUseCase;
  final DeleteFavoriteProductUseCase _deleteFavoriteProductUseCase;
  final AddProductToFavoriteUseCase _addProductToFavoriteUseCase;
  FavoriteProductBloc({
    required AddProductToFavoriteUseCase addProductToFavoriteUseCase,
    required DeleteFavoriteProductsUseCase deleteFavoriteProductsUseCase,
    required GetSavedProductUseCase getSavedProductUseCase,
    required DeleteFavoriteProductUseCase deleteFavoriteProductUseCase,
  })  : _getSavedProductUseCase = getSavedProductUseCase,
        _addProductToFavoriteUseCase = addProductToFavoriteUseCase,
        _deleteFavoriteProductsUseCase = deleteFavoriteProductsUseCase,
        _deleteFavoriteProductUseCase = deleteFavoriteProductUseCase,
        super(FavoriteProductInitial()) {
    on<GetSavedFavoriteProductEvent>(_getFavoriteProduct);
    on<DeleteFavoriteProductsEvent>(_deleteFavoriteProducts);
    on<ToggleFavoriteProductEvent>(_toggleFavoriteProduct);

    add(const GetSavedFavoriteProductEvent());
  }

  void _deleteFavoriteProducts(
    DeleteFavoriteProductsEvent event,
    Emitter<FavoriteProductState> emit,
  ) async {
    await _deleteFavoriteProductsUseCase(params: event.products);
    final products = await _getSavedProductUseCase();
    emit(GetFavoriteProductsSuccess(products: products));
  }

  void _getFavoriteProduct(
    GetSavedFavoriteProductEvent event,
    Emitter<FavoriteProductState> emit,
  ) async {
    final products = await _getSavedProductUseCase();
    emit(GetFavoriteProductsSuccess(products: products));
  }

  void _toggleFavoriteProduct(
    ToggleFavoriteProductEvent event,
    Emitter<FavoriteProductState> emit,
  ) async {
    if (state is GetFavoriteProductsSuccess &&
        (state as GetFavoriteProductsSuccess).isFavorite(event.product)) {
      await _deleteFavoriteProductUseCase(params: event.product);
    } else {
      await _addProductToFavoriteUseCase(params: event.product);
    }
    final products = await _getSavedProductUseCase();
    emit(GetFavoriteProductsSuccess(products: products));
  }
}
