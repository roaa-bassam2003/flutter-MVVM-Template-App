// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

// common
@JsonSerializable()
class BaseResponse {
  // api name
  @JsonKey(name: "status")
  // my prj name
  int? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "errors")
  List<String>? errors;
}

// -----------------------Clent--------------------------
// Login
@JsonSerializable()
class ClientResponse {
  @JsonKey(name: "userId")
  String? id;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "tokenExpire")
  String? tokenExpire;
  @JsonKey(name: "userType")
  List<String>? userType;
  @JsonKey(name: "userName")
  String? userName;
  ClientResponse(
    this.id,
    this.token,
    this.tokenExpire,
    this.userName,
    this.userType,
  );

  // from json
  factory ClientResponse.fromJson(Map<String, dynamic> json) =>
      _$ClientResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$ClientResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: "data")
  ClientResponse? data;
  AuthenticationResponse(
    this.data,
  );

  // from json
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}

// register service provider
@JsonSerializable()
class ServiceProviderRegisterResponse {
  @JsonKey(name: "type")
  int? type;
  @JsonKey(name: "certification")
  String? certification;
  @JsonKey(name: "hourPrice")
  int? hourPrice;
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "userName")
  String? userName;
  @JsonKey(name: "userNameId")
  String? userNameId;
  @JsonKey(name: "phoneNumber")
  String? phoneNumber;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "personalPhoto")
  String? personalPhoto;
  @JsonKey(name: "idCardFrontPhoto")
  String? idCardFrontPhoto;
  @JsonKey(name: "idCardBackPhoto")
  String? idCardBackPhoto;
  @JsonKey(name: "city")
  String? city;
  @JsonKey(name: "government")
  String? government;
  ServiceProviderRegisterResponse(
    this.type,
    this.certification,
    this.hourPrice,
    this.id,
    this.userName,
    this.userNameId,
    this.phoneNumber,
    this.email,
    this.personalPhoto,
    this.idCardBackPhoto,
    this.idCardFrontPhoto,
    this.city,
    this.government,
  );

  // from json
  factory ServiceProviderRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$ServiceProviderRegisterResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() =>
      _$ServiceProviderRegisterResponseToJson(this);
}

@JsonSerializable()
class AuthenticationServiceProviderResponse extends BaseResponse {
  @JsonKey(name: "data")
  ServiceProviderRegisterResponse? data;
  AuthenticationServiceProviderResponse(
    this.data,
  );

  // from json
  factory AuthenticationServiceProviderResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AuthenticationServiceProviderResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() =>
      _$AuthenticationServiceProviderResponseToJson(this);
}

// register client
@JsonSerializable()
class ClientRegisterResponse {
  @JsonKey(name: "location")
  String? location;
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "userName")
  String? userName;
  @JsonKey(name: "userNameId")
  String? userNameId;
  @JsonKey(name: "phoneNumber")
  String? phoneNumber;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "personalPhoto")
  String? personalPhoto;
  @JsonKey(name: "idCardFrontPhoto")
  String? idCardFrontPhoto;
  @JsonKey(name: "idCardBackPhoto")
  String? idCardBackPhoto;
  @JsonKey(name: "city")
  String? city;
  @JsonKey(name: "government")
  String? government;
  ClientRegisterResponse(
    this.location,
    this.id,
    this.userName,
    this.userNameId,
    this.phoneNumber,
    this.email,
    this.personalPhoto,
    this.idCardBackPhoto,
    this.idCardFrontPhoto,
    this.city,
    this.government,
  );

  // from json
  factory ClientRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$ClientRegisterResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$ClientRegisterResponseToJson(this);
}

@JsonSerializable()
class AuthenticationClientResponse extends BaseResponse {
  @JsonKey(name: "data")
  ClientRegisterResponse? data;
  AuthenticationClientResponse(
    this.data,
  );

  // from json
  factory AuthenticationClientResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationClientResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$AuthenticationClientResponseToJson(this);
}

// forget password
@JsonSerializable()
class ForgotPasswordResponse extends BaseResponse {
  @JsonKey(name: "data")
  String? data;
  ForgotPasswordResponse(
    this.data,
  );

  // from json
  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);
}

// reset password
@JsonSerializable()
class ResetPasswordResponse extends BaseResponse {
  @JsonKey(name: "data")
  String? data;
  ResetPasswordResponse(
    this.data,
  );

  // from json
  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$ResetPasswordResponseToJson(this);
}

// change password
@JsonSerializable()
class ChangePasswordResponse extends BaseResponse {
  @JsonKey(name: "data")
  String? support;
  ChangePasswordResponse(
    this.support,
  );

  // from json
  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$ChangePasswordResponseToJson(this);
}

// report
@JsonSerializable()
class ReportResponse extends BaseResponse {
  @JsonKey(name: "data")
  String? data;
  ReportResponse(
    this.data,
  );

  // from json
  factory ReportResponse.fromJson(Map<String, dynamic> json) =>
      _$ReportResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$ReportResponseToJson(this);
}

// logout
@JsonSerializable()
class LogoutResponse extends BaseResponse {
  @JsonKey(name: "data")
  String? data;
  LogoutResponse(
    this.data,
  );

  // from json
  factory LogoutResponse.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$LogoutResponseToJson(this);
}

// delete account
@JsonSerializable()
class DeleteAccountResponse extends BaseResponse {
  @JsonKey(name: "data")
  String? data;
  DeleteAccountResponse(
    this.data,
  );

  // from json
  factory DeleteAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAccountResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$DeleteAccountResponseToJson(this);
}

// government
@JsonSerializable()
class Government {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "cities")
  String? cities;
  Government(
    this.id,
    this.name,
    this.cities,
  );

  factory Government.fromJson(Map<String, dynamic> json) =>
      _$GovernmentFromJson(json);

  Map<String, dynamic> toJson() => _$GovernmentToJson(this);
}

@JsonSerializable()
class GovernmentResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<Government>? data;

  GovernmentResponse(this.data);

  factory GovernmentResponse.fromJson(Map<String, dynamic> json) =>
      _$GovernmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GovernmentResponseToJson(this);
}

// city
@JsonSerializable()
class City {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "governorateId")
  String? governorateId;
  @JsonKey(name: "governorate")
  String? governorate;
  @JsonKey(name: "users")
  String? users;
  City(
    this.id,
    this.name,
    this.governorateId,
    this.governorate,
    this.users,
  );

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}

@JsonSerializable()
class CityResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<City>? data;

  CityResponse(this.data);

  factory CityResponse.fromJson(Map<String, dynamic> json) =>
      _$CityResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CityResponseToJson(this);
}







// shared get list data response
@JsonSerializable()
class GetListUserResponse {
  @JsonKey(name: "bookingID")
  int? bookingID;
  @JsonKey(name: "clientId")
  String? clientId;
  @JsonKey(name: "serviceProviderID")
  String? serviceProviderID;
  @JsonKey(name: "day")
  String? day;
  @JsonKey(name: "hours")
  String? hours;
  @JsonKey(name: "totalPrice")
  int? totalPrice;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "location")
  String? location;
  @JsonKey(name: "clientName")
  String? clientName;
  @JsonKey(name: "serviceProviderName")
  String? serviceProviderName;
  @JsonKey(name: "serviceType")
  int? serviceType;
  GetListUserResponse(
    this.bookingID,
    this.clientId,
    this.serviceProviderID,
    this.day,
    this.hours,
    this.totalPrice,
    this.status,
    this.location,
    this.clientName,
    this.serviceProviderName,
    this.serviceType,
  );

  // from json
  factory GetListUserResponse.fromJson(Map<String, dynamic> json) =>
      _$GetListUserResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$GetListUserResponseToJson(this);
}



// get pending bookings
@JsonSerializable()
class BendingBookingsResponse extends BaseResponse {
 @JsonKey(name: "data")
  List<GetListUserResponse>? data;
  BendingBookingsResponse(
    this.data,
  );

  // from json
  factory BendingBookingsResponse.fromJson(Map<String, dynamic> json) =>
      _$BendingBookingsResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$BendingBookingsResponseToJson(this);
}


// get confirmed bookings
@JsonSerializable()
class ConfirmedBookingsResponse extends BaseResponse {
 @JsonKey(name: "data")
  List<GetListUserResponse>? data;
  ConfirmedBookingsResponse(
    this.data,
  );

  // from json
  factory ConfirmedBookingsResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfirmedBookingsResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$ConfirmedBookingsResponseToJson(this);
}


// get paid bookings
@JsonSerializable()
class PaidBookingsResponse extends BaseResponse {
 @JsonKey(name: "data")
  List<GetListUserResponse>? data;
  PaidBookingsResponse(
    this.data,
  );

  // from json
  factory PaidBookingsResponse.fromJson(Map<String, dynamic> json) =>
      _$PaidBookingsResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$PaidBookingsResponseToJson(this);
}


// get cancel bookings
@JsonSerializable()
class CancelBookingsResponse extends BaseResponse {
 @JsonKey(name: "data")
  List<GetListUserResponse>? data;
  CancelBookingsResponse(
    this.data,
  );

  // from json
  factory CancelBookingsResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelBookingsResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$CancelBookingsResponseToJson(this);
}


// get complete bookings
@JsonSerializable()
class CompleteBookingsResponse extends BaseResponse {
 @JsonKey(name: "data")
  List<GetListUserResponse>? data;
  CompleteBookingsResponse(
    this.data,
  );

  // from json
  factory CompleteBookingsResponse.fromJson(Map<String, dynamic> json) =>
      _$CompleteBookingsResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$CompleteBookingsResponseToJson(this);
}


// get rejected bookings
@JsonSerializable()
class RejectedBookingsResponse extends BaseResponse {
 @JsonKey(name: "data")
  List<GetListUserResponse>? data;
  RejectedBookingsResponse(
    this.data,
  );

  // from json
  factory RejectedBookingsResponse.fromJson(Map<String, dynamic> json) =>
      _$RejectedBookingsResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$RejectedBookingsResponseToJson(this);
}


// put cancel bookings data
@JsonSerializable()
class PutCancelBookingsDataResponse extends BaseResponse {
 @JsonKey(name: "bookingId")
  int? bookingId;
  @JsonKey(name: "newStatus")
  int? newStatus;
  @JsonKey(name: "cancelledBy")
  String? cancelledBy;
  PutCancelBookingsDataResponse(
    this.bookingId,
    this.newStatus,
    this.cancelledBy,
  );

  // from json
  factory PutCancelBookingsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$PutCancelBookingsDataResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$PutCancelBookingsDataResponseToJson(this);
}



@JsonSerializable()
class PutCancelBookingsResponse extends BaseResponse {
 @JsonKey(name: "data")
  PutCancelBookingsDataResponse? data;
  PutCancelBookingsResponse(
    this.data,
  );

  // from json
  factory PutCancelBookingsResponse.fromJson(Map<String, dynamic> json) =>
      _$PutCancelBookingsResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$PutCancelBookingsResponseToJson(this);
}