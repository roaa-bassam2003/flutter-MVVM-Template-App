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
      this?.name.orEmpty() ?? Constants.empty,
      this?.userName.orEmpty() ?? Constants.empty,
    );
  }
}

extension AddressResponseMapper on AddressResponse? {
  Address toDomain() {
    return Address(
      this?.country.orEmpty() ?? Constants.empty,
      this?.government.orEmpty() ?? Constants.empty,
      this?.city.orEmpty() ?? Constants.empty,
      this?.currentAddress.orEmpty() ?? Constants.empty,
    );
  }
}

extension InformationResponseMapper on InformationResponse? {
  Information toDomain() {
    return Information(
      this?.address.toDomain(),
      this?.email.orEmpty() ?? Constants.empty,
      this?.phone.orEmpty() ?? Constants.empty,
      this?.photo.orEmpty() ?? Constants.empty,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      this?.user.toDomain(),
      this?.information.toDomain(),
    );
  }
}
