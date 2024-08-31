part of 'search_product_bloc.dart';

sealed class SearchProductState extends Equatable {
  const SearchProductState();

  @override
  List<Object> get props => [];
}

final class SearchProductInitial extends SearchProductState {}

final class SearchProductLoading extends SearchProductState {}

final class SearchProductSuccess extends SearchProductState {
  final List<ProductEntity> products;

  const SearchProductSuccess({required this.products});
  @override
  List<Object> get props => [products];
}

final class SearchProductFailure extends SearchProductState {
  final String error;

  const SearchProductFailure({required this.error});

  @override
  List<Object> get props => [error];
}
