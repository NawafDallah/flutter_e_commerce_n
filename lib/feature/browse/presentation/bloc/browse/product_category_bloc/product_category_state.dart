part of 'product_category_bloc.dart';

sealed class ProductCategoryState extends Equatable {
  const ProductCategoryState();

  @override
  List<Object> get props => [];
}

final class ProductCategoryInitial extends ProductCategoryState {
  const ProductCategoryInitial();
}

////////////////  PRODUCT SUCCESS  ////////////////

final class GetProductSuccessState extends ProductCategoryState {
  final List<ProductEntity> products;

  const GetProductSuccessState({required this.products});
  @override
  List<Object> get props => [products];
}

////////////////  PRODUCT FAILURE ////////////////

final class GetProductFailureStata extends ProductCategoryState {
  final String error;
  const GetProductFailureStata({required this.error});

  @override
  List<Object> get props => [error];
}

////////////////  PRODUCT LOADING ////////////////

final class GetProductLoadingStata extends ProductCategoryState {
  const GetProductLoadingStata();
}
