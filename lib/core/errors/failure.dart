/// Abstract class defining a failure.
abstract class Failure {

  /// Constructs a [Failure] with the provided [errorMessage].
  const Failure({
    required this.errorMessage,
  });
  /// The error message associated with the failure.
  final String errorMessage;

  @override
  String toString() {
    return 'Failure{errorMessage: $errorMessage}';
  }
}

/// A failure representing a server error.
class ServerFailure extends Failure {
  /// Constructs a [ServerFailure] with the provided [errorMessage].
  const ServerFailure({
    required super.errorMessage,
  });

  @override
  String toString() {
    return 'ServerFailure{${super.errorMessage}}';
  }
}


/// Implementations of Failure types...
