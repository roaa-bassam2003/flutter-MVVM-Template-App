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
          return left(
            Failure(
              ApiInternalStatus.failure,
              response.message ?? ResponseMessage.defaultError,
            ),
          );
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

  @override
  Future<Either<Failure, String>> forgotPassword(String email) async {
    if (await _networkInfo.isConnected) {
      try {
        // its safe to call API
        final response = await _remoteDataSource.forgotPassword(email);

        if (response.status == ApiInternalStatus.success) {
          // success
          // return right
          return Right(response.toDomain());
        } else {
          // failure
          // return left
          return Left(Failure(
            ApiInternalStatus.failure,
            response.message ?? ResponseMessage.defaultError,
          ));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return network connection error
      // return left
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, String>> changePassword(
    ChangePasswordRequest changePasswordRequest,
  ) async {
    if (await _networkInfo.isConnected) {
      // it is connected to internet, it is save to call API

      try {
        final response = await _remoteDataSource.changePassword(
          changePasswordRequest,
        );

        if (response.status == ApiInternalStatus.success) {
          // success --> return data --> either right
          return Right(response.toDomain());
          // return right(
          //   response.toDomain(),
          // );
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

  @override
  Future<Either<Failure, String>> report(ReportRequest reportRequest) async {
    if (await _networkInfo.isConnected) {
      // it is connected to internet, it is save to call API

      try {
        final response = await _remoteDataSource.report(
          reportRequest,
        );

        if (response.status == ApiInternalStatus.success) {
          // success --> return data --> either right
          return Right(response.toDomain());
          // return right(
          //   response.toDomain(),
          // );
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

  @override
  Future<Either<Failure, Governments>> governmentsCities() async {
    if (await _networkInfo.isConnected) {
      // it is connected to internet, it is save to call API

      try {
        final response = await _remoteDataSource.governmentsCities();

        if (response.status == ApiInternalStatus.success) {
          // success --> return data --> either right
          return Right(response.toDomain());
          // return right(
          //   response.toDomain(),
          // );
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
