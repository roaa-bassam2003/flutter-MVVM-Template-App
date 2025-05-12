import 'package:dio/dio.dart';
import 'package:flutter_advanced_course/app/app_prefs.dart';
import 'package:flutter_advanced_course/data/data_source/remote_data_source.dart';
import 'package:flutter_advanced_course/data/network/app_api.dart';
import 'package:flutter_advanced_course/data/network/dio_factory.dart';
import 'package:flutter_advanced_course/data/network/network_info.dart';
import 'package:flutter_advanced_course/data/repository/repository_impl.dart';
import 'package:flutter_advanced_course/domain/repository/repository.dart';
import 'package:flutter_advanced_course/domain/usecase/change_password_use_case.dart';
import 'package:flutter_advanced_course/domain/usecase/forgot_password_use_case.dart';
import 'package:flutter_advanced_course/domain/usecase/login_use_case.dart';
import 'package:flutter_advanced_course/presentation/common/auth/change_password/view_model/change_password_view_model.dart';
import 'package:flutter_advanced_course/presentation/common/auth/forgot_password/view_model/forgot_password_view_model.dart';
import 'package:flutter_advanced_course/presentation/common/auth/login/view_model/login_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

// app module is a module where we put all generic DI
Future<void> initAppModule() async {
  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();

  // register sharedPrefs in GetIt.instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance and register it in GetIt.instance
  instance.registerLazySingleton<AppPrefs>(() => AppPrefs(instance()));

  // network info instance
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker.createInstance()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  // app service client
  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance<AppServiceClient>()));

  // repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance()));
}

// login module is a module where we put all DI related to login
initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    // login use case
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    // login view model
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}


// forgot password module is a module where we put all DI related to forgot password
initForgotPasswordModule() {
  if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
    // forgot password  use case
    instance.registerFactory<ForgotPasswordUseCase>(() => ForgotPasswordUseCase(instance()));
    // forgot password view model
    instance.registerFactory<ForgotPasswordViewModel>(() => ForgotPasswordViewModel(instance()));
  }
}


// change password module is a module where we put all DI related to change password
initChangePasswordModule() {
  if (!GetIt.I.isRegistered<ChangePasswordUseCase>()) {
    // change password use case
    instance.registerFactory<ChangePasswordUseCase>(() => ChangePasswordUseCase(instance()));
    // change password view model
    instance.registerFactory<ChangePasswordViewModel>(() => ChangePasswordViewModel(instance()));
  }
}