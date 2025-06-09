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
  Map<String, dynamic> toJson() => _$ServiceProviderRegisterResponseToJson(this);
}

@JsonSerializable()
class AuthenticationServiceProviderResponse extends BaseResponse {
  @JsonKey(name: "data")
  ServiceProviderRegisterResponse? data;
  AuthenticationServiceProviderResponse(
    this.data,
  );

  // from json
  factory AuthenticationServiceProviderResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationServiceProviderResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$AuthenticationServiceProviderResponseToJson(this);
}

// forget password
@JsonSerializable()
class ForgotPasswordResponse extends BaseResponse {
  @JsonKey(name: "support")
  String? support;
  ForgotPasswordResponse(
    this.support,
  );

  // from json
  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);
}

// change password
@JsonSerializable()
class ChangePasswordResponse extends BaseResponse {
  @JsonKey(name: "support")
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
  @JsonKey(name: "support")
  String? support;
  ReportResponse(
    this.support,
  );

  // from json
  factory ReportResponse.fromJson(Map<String, dynamic> json) =>
      _$ReportResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$ReportResponseToJson(this);
}


// Governments-cities list items
@JsonSerializable()
class GovernmentCityResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "governorate")
  String? governorate;
  @JsonKey(name: "cities")
  List<String>? cities;

  GovernmentCityResponse(
    this.id,
     this.governorate,
     this.cities,
  );

  factory GovernmentCityResponse.fromJson(Map<String, dynamic> json) =>
      _$GovernmentCityResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GovernmentCityResponseToJson(this);
}

// Governments-cities base
@JsonSerializable()
class GovernmentCityBaseResponse extends BaseResponse {
  @JsonKey(name: "governments_cities")
  List<GovernmentCityResponse>? governmentsCities;

  GovernmentCityBaseResponse(
    this.governmentsCities,
  );

  factory GovernmentCityBaseResponse.fromJson(Map<String, dynamic> json) =>
      _$GovernmentCityBaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GovernmentCityBaseResponseToJson(this);
}


// address
