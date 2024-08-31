part of 'search_product_bloc.dart';

sealed class SearchProductEvent extends Equatable {
  const SearchProductEvent();

  @override
  List<Object> get props => [];
}

final class SearchProductInitialEvent extends SearchProductEvent {
  const SearchProductInitialEvent();
}

final class SearchForProductEvent extends SearchProductEvent {
  final String productName;

  const SearchForProductEvent({required this.productName});

  @override
  List<Object> get props => [productName];
}
