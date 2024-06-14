import 'package:dartz/dartz.dart';
import '../error/failure.dart';

abstract interface class UseCase<T, Params> {
  Future<Either<Failure, T>> call({Params params});
}

class NoParams {}
