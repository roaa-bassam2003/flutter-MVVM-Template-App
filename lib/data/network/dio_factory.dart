import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_advanced_course/app/app_prefs.dart';
import 'package:flutter_advanced_course/app/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String applicationJson = "application/json";
const String contentType = "content-type";
const String accept = "accept";
const String authorization = "authorization";
const String defaultLanguage = "language";

class DioFactory {
  final AppPrefs _appPrefs;
  DioFactory(this._appPrefs);

  Future<Dio> getDio() async {
    Dio dio = Dio();

    String language = await _appPrefs.getAppLanguage();

    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      authorization: Constants.token,
      defaultLanguage: language,
    };

    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: headers,
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
