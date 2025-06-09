// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..status = (json['status'] as num?)?.toInt()
  ..message = json['message'] as String?
  ..token = json['token'] as String?
  ..errors =
      (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'errors': instance.errors,
    };

ClientResponse _$ClientResponseFromJson(Map<String, dynamic> json) =>
    ClientResponse(
      json['userId'] as String?,
      json['token'] as String?,
      json['tokenExpire'] as String?,
      json['userName'] as String?,
      (json['userType'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ClientResponseToJson(ClientResponse instance) =>
    <String, dynamic>{
      'userId': instance.id,
      'token': instance.token,
      'tokenExpire': instance.tokenExpire,
      'userType': instance.userType,
      'userName': instance.userName,
    };

AuthenticationResponse _$AuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponse(
      json['data'] == null
          ? null
          : ClientResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..token = json['token'] as String?
      ..errors =
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'errors': instance.errors,
      'data': instance.data,
    };

ServiceProviderRegisterResponse _$ServiceProviderRegisterResponseFromJson(
        Map<String, dynamic> json) =>
    ServiceProviderRegisterResponse(
      (json['type'] as num?)?.toInt(),
      json['certification'] as String?,
      (json['hourPrice'] as num?)?.toInt(),
      json['id'] as String?,
      json['userName'] as String?,
      json['userNameId'] as String?,
      json['phoneNumber'] as String?,
      json['email'] as String?,
      json['personalPhoto'] as String?,
      json['idCardBackPhoto'] as String?,
      json['idCardFrontPhoto'] as String?,
      json['city'] as String?,
      json['government'] as String?,
    );

Map<String, dynamic> _$ServiceProviderRegisterResponseToJson(
        ServiceProviderRegisterResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'certification': instance.certification,
      'hourPrice': instance.hourPrice,
      'id': instance.id,
      'userName': instance.userName,
      'userNameId': instance.userNameId,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'personalPhoto': instance.personalPhoto,
      'idCardFrontPhoto': instance.idCardFrontPhoto,
      'idCardBackPhoto': instance.idCardBackPhoto,
      'city': instance.city,
      'government': instance.government,
    };

AuthenticationServiceProviderResponse
    _$AuthenticationServiceProviderResponseFromJson(
            Map<String, dynamic> json) =>
        AuthenticationServiceProviderResponse(
          json['data'] == null
              ? null
              : ServiceProviderRegisterResponse.fromJson(
                  json['data'] as Map<String, dynamic>),
        )
          ..status = (json['status'] as num?)?.toInt()
          ..message = json['message'] as String?
          ..token = json['token'] as String?
          ..errors = (json['errors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList();

Map<String, dynamic> _$AuthenticationServiceProviderResponseToJson(
        AuthenticationServiceProviderResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'errors': instance.errors,
      'data': instance.data,
    };

ForgotPasswordResponse _$ForgotPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ForgotPasswordResponse(
      json['support'] as String?,
    )
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..token = json['token'] as String?
      ..errors =
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$ForgotPasswordResponseToJson(
        ForgotPasswordResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'errors': instance.errors,
      'support': instance.support,
    };

ChangePasswordResponse _$ChangePasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordResponse(
      json['support'] as String?,
    )
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..token = json['token'] as String?
      ..errors =
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$ChangePasswordResponseToJson(
        ChangePasswordResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'errors': instance.errors,
      'support': instance.support,
    };

ReportResponse _$ReportResponseFromJson(Map<String, dynamic> json) =>
    ReportResponse(
      json['support'] as String?,
    )
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..token = json['token'] as String?
      ..errors =
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$ReportResponseToJson(ReportResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'errors': instance.errors,
      'support': instance.support,
    };

GovernmentCityResponse _$GovernmentCityResponseFromJson(
        Map<String, dynamic> json) =>
    GovernmentCityResponse(
      (json['id'] as num?)?.toInt(),
      json['governorate'] as String?,
      (json['cities'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$GovernmentCityResponseToJson(
        GovernmentCityResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'governorate': instance.governorate,
      'cities': instance.cities,
    };

GovernmentCityBaseResponse _$GovernmentCityBaseResponseFromJson(
        Map<String, dynamic> json) =>
    GovernmentCityBaseResponse(
      (json['governments_cities'] as List<dynamic>?)
          ?.map(
              (e) => GovernmentCityResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..token = json['token'] as String?
      ..errors =
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$GovernmentCityBaseResponseToJson(
        GovernmentCityBaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'errors': instance.errors,
      'governments_cities': instance.governmentsCities,
    };
