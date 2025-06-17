// ------------Client--------------
import 'package:flutter_advanced_course/app/extensions.dart';
import 'package:flutter_advanced_course/data/response/responses.dart';
import 'package:flutter_advanced_course/domain/model/models.dart';
import 'package:flutter_advanced_course/app/constants.dart';

// login
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

// Register Service Provider Response Mapper
extension RegisterServiceProviderResponseMapper
    on ServiceProviderRegisterResponse? {
  RegisterServiceProvider toDomain() {
    return RegisterServiceProvider(
      type: this?.type?.orZero() ?? Constants.zero,
      certification: this?.certification?.orEmpty() ?? Constants.empty,
      hourPrice: this?.hourPrice?.orZero() ?? Constants.zero,
      id: this?.id.orEmpty() ?? Constants.empty,
      userNameId: this?.userNameId.orEmpty() ?? Constants.empty,
      userName: this?.userName.orEmpty() ?? Constants.empty,
      phoneNumber: this?.phoneNumber.orEmpty() ?? Constants.empty,
      email: this?.email.orEmpty() ?? Constants.empty,
      personalPhoto: this?.personalPhoto.orEmpty() ?? Constants.empty,
      idCardFrontPhoto: this?.idCardFrontPhoto.orEmpty() ?? Constants.empty,
      idCardBackPhoto: this?.idCardBackPhoto.orEmpty() ?? Constants.empty,
      city: this?.city.orEmpty() ?? Constants.empty,
      government: this?.government.orEmpty() ?? Constants.empty,
    );
  }
}

extension AuthenticationServiceProviderResponseMapper
    on AuthenticationServiceProviderResponse? {
  AuthenticationServiceProvider toDomain() {
    return AuthenticationServiceProvider(
      this?.data.toDomain(),
    );
  }
}

// Register Service Provider Response Mapper
extension ClientRegisterResponseMapper on ClientRegisterResponse? {
  RegisterClient toDomain() {
    return RegisterClient(
      location: this?.location.orEmpty() ?? Constants.empty,
      id: this?.id.orEmpty() ?? Constants.empty,
      userNameId: this?.userNameId.orEmpty() ?? Constants.empty,
      userName: this?.userName.orEmpty() ?? Constants.empty,
      phoneNumber: this?.phoneNumber.orEmpty() ?? Constants.empty,
      email: this?.email.orEmpty() ?? Constants.empty,
      personalPhoto: this?.personalPhoto.orEmpty() ?? Constants.empty,
      idCardFrontPhoto: this?.idCardFrontPhoto.orEmpty() ?? Constants.empty,
      idCardBackPhoto: this?.idCardBackPhoto.orEmpty() ?? Constants.empty,
      city: this?.city.orEmpty() ?? Constants.empty,
      government: this?.government.orEmpty() ?? Constants.empty,
    );
  }
}

extension AuthenticationClientResponseMapper on AuthenticationClientResponse? {
  AuthenticationClient toDomain() {
    return AuthenticationClient(
      this?.data.toDomain(),
    );
  }
}

// forget password
extension ForgotPasswordResponseMapper on ForgotPasswordResponse? {
  String toDomain() {
    return this?.token?.orEmpty() ?? Constants.empty;
  }
}

// reset password
extension ResetPasswordResponseMapper on ResetPasswordResponse? {
  String toDomain() {
    return this?.message?.orEmpty() ?? Constants.empty;
  }
}

// change password
extension ChangePasswordResponseMapper on ChangePasswordResponse? {
  String toDomain() {
    return this?.message?.orEmpty() ?? Constants.empty;
  }
}

// delete account
extension DeleteAccountResponseMapper on DeleteAccountResponse? {
  String toDomain() {
    return this?.message?.orEmpty() ?? Constants.empty;
  }
}

// report
extension ReportResponseMapper on ReportResponse? {
  String toDomain() {
    return this?.message?.orEmpty() ?? Constants.empty;
  }
}

// logout
extension LogoutResponseMapper on LogoutResponse? {
  String toDomain() {
    return this?.message?.orEmpty() ?? Constants.empty;
  }
}

// Governments list items
extension GovernmentMapper on Government? {
  GovernmentList toDomain() {
    return GovernmentList(
      this?.id.orZero() ?? Constants.zero,
      this?.name.orEmpty() ?? Constants.empty,
      this?.cities.orEmpty() ?? Constants.empty,
    );
  }
}

extension GovernmentResponseMapper on GovernmentResponse? {
  Governments toDomain() {
    return Governments(
      this?.data?.map((e) => e.toDomain()).toList() ?? [],
    );
  }
}

// Governments-cities list items

extension CityMapper on City? {
  CityList toDomain() {
    return CityList(
      this?.id.orZero() ?? Constants.zero,
      this?.name.orEmpty() ?? Constants.empty,
      this?.governorateId.orEmpty() ?? Constants.empty,
      this?.governorate.orEmpty() ?? Constants.empty,
      this?.users.orEmpty() ?? Constants.empty,
    );
  }
}

extension CityResponseMapper on CityResponse? {
  Cities toDomain() {
    return Cities(
      this?.data?.map((e) => e.toDomain()).toList() ?? [],
    );
  }
}



// shared get list data response

extension GetListUserResponseMapper on GetListUserResponse? {
  GetListUser toDomain() {
    return GetListUser(
      this?.bookingID.orZero() ?? Constants.zero,
      this?.clientId.orEmpty() ?? Constants.empty,
      this?.serviceProviderID.orEmpty() ?? Constants.empty,
      this?.day.orEmpty() ?? Constants.empty,
      this?.hours.orEmpty() ?? Constants.empty,
      this?.totalPrice.orZero() ?? Constants.zero,
      this?.status.orZero() ?? Constants.zero,
      this?.location.orEmpty() ?? Constants.empty,
      this?.clientName.orEmpty() ?? Constants.empty,
      this?.serviceProviderName.orEmpty() ?? Constants.empty,
      this?.serviceType.orZero() ?? Constants.zero,
    );
  }
}

// bending bookings
extension BendingBookingsResponseMapper on BendingBookingsResponse? {
  Booking toDomain() {
    return Booking(
      this?.data?.map((e) => e.toDomain()).toList() ?? [],
    );
  }
}

// confiremed bookings
extension ConfirmedBookingsResponseMapper on ConfirmedBookingsResponse? {
  Booking toDomain() {
    return Booking(
      this?.data?.map((e) => e.toDomain()).toList() ?? [],
    );
  }
}

// paid bookings
extension PaidBookingsResponseMapper on PaidBookingsResponse? {
  Booking toDomain() {
    return Booking(
      this?.data?.map((e) => e.toDomain()).toList() ?? [],
    );
  }
}

// cancel bookings
extension CancelBookingsResponseMapper on CancelBookingsResponse? {
  Booking toDomain() {
    return Booking(
      this?.data?.map((e) => e.toDomain()).toList() ?? [],
    );
  }
}

// complete bookings
extension CompleteBookingsResponseMapper on CompleteBookingsResponse? {
  Booking toDomain() {
    return Booking(
      this?.data?.map((e) => e.toDomain()).toList() ?? [],
    );
  }
}

// rejected bookings
extension RejectedBookingsResponseMapper on RejectedBookingsResponse? {
  Booking toDomain() {
    return Booking(
      this?.data?.map((e) => e.toDomain()).toList() ?? [],
    );
  }
}

// put cancel bookings data
extension PutCancelBookingsResponseMapper on PutCancelBookingsResponse? {
  String toDomain() {
    return this?.message?.orEmpty() ?? Constants.empty;
  }
}