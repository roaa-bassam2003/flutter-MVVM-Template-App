import 'package:dio/dio.dart';
import 'package:flutter_advanced_course/data/network/failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  // named constructor for ErrorHandler
  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error, so it is an error from response of the api or from dio itself
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.defaultError.getFailure();
    }
  }
}

Failure _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeOut.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeOut.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeOut.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.badRequest.getFailure();
    case DioExceptionType.badResponse:
      // api response to me with bade response
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(error.response?.statusCode ?? 0,
            error.response?.statusMessage ?? "");
      } else {
        return DataSource.defaultError.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.noInternetConnection.getFailure();
    case DioExceptionType.unknown:
      return DataSource.defaultError.getFailure();
  }
}

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unAuthorized,
  notFound,
  internalServerError,
  connectTimeOut,
  cancel,
  receiveTimeOut,
  sendTimeOut,
  cacheError,
  noInternetConnection,
  defaultError,
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.success:
        return Failure(
          ResponseCode.success,
          ResponseMessage.success,
        );
      case DataSource.noContent:
        return Failure(
          ResponseCode.noContent,
          ResponseMessage.noContent,
        );
      case DataSource.badRequest:
        return Failure(
          ResponseCode.badRequest,
          ResponseMessage.badRequest,
        );
      case DataSource.forbidden:
        return Failure(
          ResponseCode.forbidden,
          ResponseMessage.forbidden,
        );
      case DataSource.unAuthorized:
        return Failure(
          ResponseCode.unAuthorized,
          ResponseMessage.unAuthorized,
        );
      case DataSource.notFound:
        return Failure(
          ResponseCode.notFound,
          ResponseMessage.notFound,
        );
      case DataSource.internalServerError:
        return Failure(
          ResponseCode.internalServerError,
          ResponseMessage.internalServerError,
        );
      case DataSource.connectTimeOut:
        return Failure(
          ResponseCode.connectTimeOut,
          ResponseMessage.connectTimeOut,
        );
      case DataSource.cancel:
        return Failure(
          ResponseCode.cancel,
          ResponseMessage.cancel,
        );
      case DataSource.receiveTimeOut:
        return Failure(
          ResponseCode.receiveTimeOut,
          ResponseMessage.receiveTimeOut,
        );
      case DataSource.sendTimeOut:
        return Failure(
          ResponseCode.sendTimeOut,
          ResponseMessage.sendTimeOut,
        );
      case DataSource.cacheError:
        return Failure(
          ResponseCode.cacheError,
          ResponseMessage.cacheError,
        );
      case DataSource.noInternetConnection:
        return Failure(
          ResponseCode.noInternetConnection,
          ResponseMessage.noInternetConnection,
        );
      case DataSource.defaultError:
        return Failure(
          ResponseCode.defaultError,
          ResponseMessage.defaultError,
        );
    }
  }
}

class ResponseCode {
  // success
  static const int success = 200;
  static const int noContent = 201;
  // Client Errors
  static const int badRequest = 400; // API reject my request
  static const int forbidden = 403; // user is blocked to access
  static const int unAuthorized = 401; // authentication problem (token expired)
  static const int notFound = 404; // ex. id to deal with not found
  // Server Errors
  static const int internalServerError = 500; // crash in server

  // Connection Errors or local status code (happen before call API, means in my local device)
  static const int connectTimeOut = -1; // Service Unavailable
  static const int cancel = -2;
  static const int receiveTimeOut = -3; // Gateway Timeout for receive
  static const int sendTimeOut = -4; // Gateway Timeout for send
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  // for un known errors
  static const int defaultError = -7;
}

class ResponseMessage {
  // success
  static const String success = "success";
  static const String noContent = "success";
  // Client Errors
  static const String badRequest =
      "bad request, Try again later"; // API reject my request
  static const String forbidden =
      "user is unautherised, Try again later"; // user is blocked to access
  static const String unAuthorized =
      "forbidden request, Try again later"; // authentication problem (token expired)
  static const String notFound =
      "some thing went wrong, Try again later"; // resource not found
  // Server Errors
  static const String internalServerError =
      "some thing went wrong, Try again later"; // crash in server

  // Connection Errors or local status code (happen before call API, means in my local device)
  static const String connectTimeOut =
      "time out error, Try again later"; // Service Unavailable
  static const String cancel = "request was cancelled, Try again later";
  static const String receiveTimeOut =
      "time out error, Try again later"; // Gateway Timeout for receive
  static const String sendTimeOut =
      "time out error, Try again later"; // Gateway Timeout for send
  static const String cacheError = "cache error, Try again later";
  static const String noInternetConnection =
      "please check your internet connection";
  // for un known errors
  static const String defaultError = "some thing went wrong, Try again later";
}

class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}
