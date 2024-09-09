import 'package:pocketbase/pocketbase.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromPocketBase(ClientException error) {
    String errorMessage;

    switch (error.statusCode) {
      case 400:
        errorMessage = 'Bad request. Please check your input.';
        break;
      case 401:
        errorMessage = 'Unauthorized. Please check your credentials.';
        break;
      case 403:
        errorMessage =
            'Forbidden. You do not have permission to perform this action.';
        break;
      case 404:
        errorMessage = 'Not found. The requested resource was not found.';
        break;
      case 500:
        errorMessage = 'Internal server error. Please try again later.';
        break;
      default:
        errorMessage = 'An unknown error occurred. Please try again.';
        break;
    }

    return ServerFailure(errorMessage: errorMessage);
  }
}
