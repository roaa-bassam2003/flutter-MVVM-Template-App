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
}

// -----------------------Clent--------------------------
// Login
@JsonSerializable()
class ClientResponse {
  @JsonKey(name: "user_id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "user_name")
  String? userName;
  ClientResponse(
    this.id,
    this.name,
    this.userName,
  );

  // from json
  factory ClientResponse.fromJson(Map<String, dynamic> json) =>
      _$ClientResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$ClientResponseToJson(this);
}

@JsonSerializable()
class AddressResponse {
  @JsonKey(name: "country")
  String? country;
  @JsonKey(name: "government")
  String? government;
  @JsonKey(name: "city")
  String? city;
  @JsonKey(name: "current_address")
  String? currentAddress;
  AddressResponse(
    this.country,
    this.government,
    this.city,
    this.currentAddress,
  );

  // from json
  factory AddressResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$AddressResponseToJson(this);
}

@JsonSerializable()
class InformationResponse {
  @JsonKey(name: "address")
  AddressResponse? address;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "photo")
  String? photo;
  InformationResponse(
    this.address,
    this.email,
    this.phone,
    this.photo,
  );

  // from json
  factory InformationResponse.fromJson(Map<String, dynamic> json) =>
      _$InformationResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$InformationResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: "user")
  ClientResponse? user;
  @JsonKey(name: "information")
  InformationResponse? information;
  AuthenticationResponse(
    this.user,
    this.information,
  );

  // from json
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
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
