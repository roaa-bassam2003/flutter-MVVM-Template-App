import 'package:dartz/dartz.dart';
import 'package:flutter_advanced_course/data/network/failure.dart';
import 'package:flutter_advanced_course/data/network/requests.dart';
import 'package:flutter_advanced_course/domain/model/models.dart';
import 'package:flutter_advanced_course/domain/repository/repository.dart';
import 'package:flutter_advanced_course/domain/usecase/base_use_case.dart';
import 'dart:io';

class RegisterClientUseCase
    implements
        BaseUseCase<RegisterClientUseCaseInput,
            AuthenticationClient> {
  final Repository _repository;
  RegisterClientUseCase(this._repository);

  @override
  Future<Either<Failure, AuthenticationClient>> execute(
      RegisterClientUseCaseInput input) async {
    return await _repository.registerClient(
      ClientRegisterRequest(
        city: input.city,
        government: input.government,
        location: input.location,
        userNameId: input.userNameId,
        phoneNumber: input.phoneNumber,
        email: input.email,
        password: input.password,
        idCardBackPhoto: input.idCardBackPhoto,
        idCardFrontPhoto: input.idCardFrontPhoto,
        personalPhoto: input.personalPhoto,
        personWithCard: input.personWithCard,
      ),
    );
  }
}

class RegisterClientUseCaseInput {
  String location;
  String userNameId;
  String phoneNumber;
  String email;
  String password;
  int city;
  int government;
  File personalPhoto;
  File personWithCard;
  File idCardFrontPhoto;
  File idCardBackPhoto;

  RegisterClientUseCaseInput({
    required this.location,
    required this.userNameId,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.city,
    required this.government,
    required this.personWithCard,
    required this.personalPhoto,
    required this.idCardFrontPhoto,
    required this.idCardBackPhoto,
  });
}
