import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? responseMessage;

  const Failure({required this.responseMessage});

  @override
  List<Object?> get props => [responseMessage];
}

// class HttpFailure extends Failure {
//   final int? statusCode;
//   final String? responseMessage;
//   final Exception? exception;

//   const HttpFailure({
//     this.statusCode,
//     this.responseMessage,
//     this.exception,
//   }) : super(statusCode, responseMessage, exception);
// }

class NoInternetFailure extends Failure {
  const NoInternetFailure() : super(responseMessage: 'Erro de conexão');
}

class GeneralFailure extends Failure {
  final String message;
  const GeneralFailure({required this.message})
      : super(responseMessage: message);
}
