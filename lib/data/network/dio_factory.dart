import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_advanced_course/app/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {

  Future<Dio> getDio() async {
    Dio dio = Dio();

    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      receiveTimeout: Constants.apiTimeOut,
      sendTimeout: Constants.apiTimeOut,
    );

    // it is depug mode so print app logs
    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }

    return dio;
  }
}
