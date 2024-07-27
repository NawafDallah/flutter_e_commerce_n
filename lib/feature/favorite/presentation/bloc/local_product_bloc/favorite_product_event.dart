part of 'favorite_product_bloc.dart';

sealed class FavoriteProductEvent extends Equatable {
  const FavoriteProductEvent();

  @override
  List<Object> get props => [];
}

class GetSavedFavoriteProductEvent extends FavoriteProductEvent {
  const GetSavedFavoriteProductEvent();
}

class DeleteFavoriteProductsEvent extends FavoriteProductEvent {
  final List<ProductEntity> products;

  const DeleteFavoriteProductsEvent({required this.products});

  @override
  List<Object> get props => [products];
}

class ToggleFavoriteProductEvent extends FavoriteProductEvent {
  final ProductEntity product;

  const ToggleFavoriteProductEvent({required this.product});

  @override
  List<Object> get props => [product];
}
