import 'package:pocketbase/pocketbase.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  // Factory constructor to create a ServerFailure from a ClientException
  factory ServerFailure.fromPocketBase(ClientException error) {
    // You can add more detailed handling here based on the status code
    String errorMessage;

    switch (error.statusCode) {
      case 400:
        errorMessage = 'Bad request. Please check your input.';
        break;
      case 401:
        errorMessage = 'Unauthorized. Please check your credentials.';
        break;
      case 403:
        errorMessage = 'Forbidden. You do not have permission to perform this action.';
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




// import 'package:dio/dio.dart';

// abstract class Failure {
//   final String message;

//   const Failure(this.message);
// }

// class ServerFailure extends Failure {
//   const ServerFailure(super.message);

//   factory ServerFailure.fromDioError(DioException error) {
//     switch (error.type) {
//       case DioExceptionType.connectionTimeout:
//         return const ServerFailure("Connection timeout");
//       case DioExceptionType.sendTimeout:
//         return const ServerFailure("Send timeout");
//       case DioExceptionType.receiveTimeout:
//         return const ServerFailure("Receive timeout");
//       case DioExceptionType.badCertificate:
//         return const ServerFailure("Bad certificate");
//       case DioExceptionType.badResponse:
//         return ServerFailure.fromResponse(
//             error.response!.statusCode!, error.response! );
//       case DioExceptionType.cancel:
//         return const ServerFailure("Cancel");
//       case DioExceptionType.connectionError:
//         return const ServerFailure("Connection error");
//       default:
//         return const ServerFailure("Unknown error");
//     }
//   }
//   factory ServerFailure.fromResponse(int statusCode, Response response) {
//     if (statusCode == 404) {
//       return const ServerFailure("Request not found");
//     } else if (statusCode == 401 || statusCode == 403 || statusCode == 400) {
//       return ServerFailure(response.data['error']['message']);
//     } else if (statusCode == 500) {
//       return const ServerFailure("Internal server error");
//     }
//     return const ServerFailure("Unknown error, try again later");
//   }
// }

