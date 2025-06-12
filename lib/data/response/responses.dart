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

  factory City.fromJson(Map<String, dynamic> json) =>
      _$CityFromJson(json);

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