// form of the request from me to the api
// --------------Common----------------
// login Request
import 'dart:io';

import 'package:dio/dio.dart';

class LoginRequest {
  String email;
  String password;

  LoginRequest(
    this.email,
    this.password,
  );
}

// change Password
class ChangePasswordRequest {
  String passwordOne;
  String passwordTwo;

  ChangePasswordRequest(
    this.passwordOne,
    this.passwordTwo,
  );
}

// report
class ReportRequest {
  String userName;
  String reportMessage;

  ReportRequest(
    this.userName,
    this.reportMessage,
  );
}
// ------------------Client----------------------
// ------------------Service Provider------------
// register service provider

class ServiceProviderRegisterRequest {
  final int cityId;
  final String email;
  final double hourPrice;
  final String password;
  final String phoneNumber;
  final String userNameId;
  final int type;
  final File idCardBackPhoto;
  final File idCardFrontPhoto;
  final File personalPhoto;
  final File personWithCard;
  final File? certification; // 👈 تعديل هنا

  ServiceProviderRegisterRequest({
    required this.cityId,
    required this.email,
    required this.hourPrice,
    required this.password,
    required this.phoneNumber,
    required this.userNameId,
    required this.type,
    required this.idCardBackPhoto,
    required this.idCardFrontPhoto,
    required this.personalPhoto,
    required this.personWithCard,
    this.certification, // 👈 تعديل هنا
  });

  Future<FormData> toFormData() async {
    final Map<String, dynamic> map = {
      'CityId': cityId,
      'Email': email,
      'HourPrice': hourPrice,
      'Password': password,
      'PhoneNumber': phoneNumber,
      'UserNameId': userNameId,
      'Type': type,
      'IdCardBackPhoto': await MultipartFile.fromFile(idCardBackPhoto.path),
      'IdCardFrontPhoto': await MultipartFile.fromFile(idCardFrontPhoto.path),
      'PersonalPhoto': await MultipartFile.fromFile(personalPhoto.path),
      'PersonWithCard': await MultipartFile.fromFile(personWithCard.path),
    };

    if (certification?.existsSync() == true) {
      print("Certification file exists: ${certification!.path}");
      map['Certification'] = await MultipartFile.fromFile(certification!.path);
    }
    else {
  print("Certification file is missing or doesn't exist");
}

    return FormData.fromMap(map);
  }
}
