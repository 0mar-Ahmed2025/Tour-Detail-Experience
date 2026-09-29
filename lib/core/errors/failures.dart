abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure([
    super.message = 'An error occurred while connecting to the server.',
  ]);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure([
    super.message = 'Sorry, the requested flight was not found.',
  ]);
}

class ParsingFailure extends Failure {
  const ParsingFailure([super.message = 'Data processing error']);
}

class NetworkFailure extends Failure {
  const NetworkFailure([
    super.message = 'Please check your internet connection.',
  ]);
}
