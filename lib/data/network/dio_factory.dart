import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_advanced_course/app/app_prefs.dart';
import 'package:flutter_advanced_course/app/constants.dart';
import 'package:flutter_advanced_course/app/di.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:cookie_jar/cookie_jar.dart'; // تأكد إنك مضيف هذا الإضافة

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();

    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      receiveTimeout: Constants.apiTimeOut,
      sendTimeout: Constants.apiTimeOut,
      followRedirects: true, // إضافة تفعيل اتباع التحويلات
    );

    // إضافة إدارة الكوكيز
    dio.interceptors.add(CookieManager(CookieJar()));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final AppPrefs appPrefs = instance<AppPrefs>();
        String? token = await appPrefs.getLoginToken();

        if (token != null && token.isNotEmpty) {
          options.headers["Authorization"] = "Bearer $token";
          print("Token added to request: $token");
        } else {
          print("No token found");
        }

        options.followRedirects = true;
        handler.next(options);
      },
      onError: (error, handler) async {
        // في حالة 401 Unauthorized، امسح التوكن
        if (error.response?.statusCode == 401) {
          final AppPrefs appPrefs = instance<AppPrefs>();
          await appPrefs.logout();
        }
        handler.next(error);
      },
    ));

    // لوج للطلبات أثناء التطوير
    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ));
    }

    return dio;
  }
}
