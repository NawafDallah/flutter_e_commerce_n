part of 'product_category_bloc.dart';

sealed class ProductCategoryEvent extends Equatable {
  const ProductCategoryEvent();

  @override
  List<Object> get props => [];
}

final class GetProductsEvent extends ProductCategoryEvent {
  final int categoryId;
  final int page;
  final int itemsPerPage;

  const GetProductsEvent({
    required this.categoryId,
    required this.page,
    required this.itemsPerPage,
  });

  @override
  List<Object> get props => [categoryId];
}
