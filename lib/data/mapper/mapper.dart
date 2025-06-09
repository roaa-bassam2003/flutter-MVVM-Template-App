// ------------Client--------------
// login
import 'package:flutter_advanced_course/app/extensions.dart';
import 'package:flutter_advanced_course/data/response/responses.dart';
import 'package:flutter_advanced_course/domain/model/models.dart';
import 'package:flutter_advanced_course/app/constants.dart';

extension ClientResponseMapper on ClientResponse? {
  Client toDomain() {
    return Client(
      this?.id.orEmpty() ?? Constants.empty,
      this?.token.orEmpty() ?? Constants.empty,
      this?.tokenExpire.orEmpty() ?? Constants.empty,
      this?.userName.orEmpty() ?? Constants.empty,
      this?.userType ?? [],
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      this?.data.toDomain(),
    );
  }
}

// forget password
extension ForgotPasswordResponseMapper on ForgotPasswordResponse? {
  String toDomain() {
    return this?.support?.orEmpty() ?? Constants.empty;
  }
}

// change password
extension ChangePasswordResponseMapper on ChangePasswordResponse? {
  String toDomain() {
    return this?.support?.orEmpty() ?? Constants.empty;
  }
}

// report
extension ReportResponseMapper on ReportResponse? {
  String toDomain() {
    return this?.support?.orEmpty() ?? Constants.empty;
  }
}

// Governments-cities list items
extension GovernmentCityResponseMapper on GovernmentCityResponse? {
  GovernmentList toDomain() {
    return GovernmentList(
      this?.id.orZero() ?? Constants.zero,
      this?.governorate.orEmpty() ?? Constants.empty,
      this!.cities.orEmpty(),
    );
  }
}

// Governments-cities base
extension GovernmentCityBaseResponseMapper on GovernmentCityBaseResponse? {
  Governments toDomain() {
    return Governments(
      (this?.governmentsCities?.map((e) => e.toDomain()).toList() ?? [])
          as GovernmentList?,
    );
  }
}
