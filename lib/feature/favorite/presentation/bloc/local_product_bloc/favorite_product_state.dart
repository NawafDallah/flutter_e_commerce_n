part of 'favorite_product_bloc.dart';

sealed class FavoriteProductState extends Equatable {
  const FavoriteProductState();

  @override
  List<Object> get props => [];
}

final class FavoriteProductInitial extends FavoriteProductState {}

////////////////  Favorite Products Loading ////////////////

class FavoriteProductsLoading extends FavoriteProductState {
  const FavoriteProductsLoading();
}

////////////////  Favorite Products Success ////////////////

class GetFavoriteProductsSuccess extends FavoriteProductState {
  final List<ProductEntity> products;

  const GetFavoriteProductsSuccess({required this.products});

  @override
  List<Object> get props => [products];

  bool isFavorite(ProductEntity product) {
    return products.any((p) => p.itemId == product.itemId);
  }
}
