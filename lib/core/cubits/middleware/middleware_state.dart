part of 'middleware_cubit.dart';

class MiddlewareState extends Equatable {
  final String middlewarePage;
  const MiddlewareState({required this.middlewarePage});

  @override
  List<Object> get props => [middlewarePage];
}
