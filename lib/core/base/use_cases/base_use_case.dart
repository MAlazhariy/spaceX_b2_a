import 'package:dartz/dartz.dart';
import 'package:spacex/core/network/failure/failure.dart';

/// This is just interface to [BaseUseCaseParams] and [BaseUseCaseNoParams],
/// and should use only as a required type for a useCase.
///
/// - Use [BaseUseCaseParams], if the use case requires a parameter.
///
/// - Use [BaseUseCaseNoParams], if the use case have no params.
abstract class BaseUseCase {}

/// Use in case that you want to make a use case that
/// requires a parameters.
abstract class BaseUseCaseParams<Type, Params> extends BaseUseCase {
  Future<Either<Failure, Type>> call(Params params);
}

/// Use in case that you want to make a use case that
/// have no parameters.
abstract class BaseUseCaseNoParams<Type> extends BaseUseCase {
  Future<Either<Failure, Type>> call();
}

// class NoParams extends Equatable {
//   const NoParams();
//
//   @override
//   List<Object> get props => [];
// }
