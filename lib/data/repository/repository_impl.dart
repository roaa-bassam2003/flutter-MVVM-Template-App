import 'package:dartz/dartz.dart';
import 'package:flutter_advanced_course/data/data_source/remote_data_source.dart';
import 'package:flutter_advanced_course/data/mapper/mapper.dart';
import 'package:flutter_advanced_course/data/network/error_handler.dart';
import 'package:flutter_advanced_course/data/network/failure.dart';
import 'package:flutter_advanced_course/data/network/network_info.dart';
import 'package:flutter_advanced_course/data/network/requests.dart';
import 'package:flutter_advanced_course/domain/model/models.dart';
import 'package:flutter_advanced_course/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(
    this._networkInfo,
    this._remoteDataSource,
  );

  @override
  Future<Either<Failure, Authentication>> login(
    LoginRequest loginRequest,
  ) async {
    if (await _networkInfo.isConnected) {
      // it is connected to internet, it is save to call API

      try {
        final response = await _remoteDataSource.login(
          loginRequest,
        );

        if (response.status == ApiInternalStatus.success) {
          // success --> return data --> either right
          return right(
            response.toDomain(),
          );
        } else {
          // failure --> business error --> either left
          return left(Failure(
            ApiInternalStatus.failure,
            response.message ?? ResponseMessage.defaultError,
          ));
        }
      } catch (error) {
        return left(
          ErrorHandler.handle(error).failure,
        );
      }
    } else {
      // return internet connection error --> either left
      return left(
        DataSource.noInternetConnection.getFailure(),
      );
    }
  }
}