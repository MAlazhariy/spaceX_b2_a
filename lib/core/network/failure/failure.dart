import 'package:equatable/equatable.dart';
import 'package:spacex/core/network/error_handling/api_error_handler.dart';
import 'package:spacex/core/network/failure/exceptions/local_exception.dart';
import 'package:spacex/core/network/failure/exceptions/server_exception.dart';

/// [Failure] is using as a return type in the Repository, like:
/// Either<Failure, ..>.
class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  /// Use this named constructor when get [Failure] from [ServerException]
  factory Failure.fromServer(ServerException e) {
    return Failure(e.error.message);
  }

  /// Use this named constructor when get [Failure] from [ServerException]
  factory Failure.fromException(Object e) {
    if (e is ServerException) {
      return Failure(e.error.message);
    } else if (e is LocalException) {
      return Failure(e.message);
    }

    final error = ApiErrorHandler.handle(e);
    return Failure(error.message);
  }

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class LocalFailure extends Failure {
  const LocalFailure(super.message);
}
