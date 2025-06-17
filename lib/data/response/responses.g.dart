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

ClientRegisterResponse _$ClientRegisterResponseFromJson(
        Map<String, dynamic> json) =>
    ClientRegisterResponse(
      json['location'] as String?,
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

Map<String, dynamic> _$ClientRegisterResponseToJson(
        ClientRegisterResponse instance) =>
    <String, dynamic>{
      'location': instance.location,
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

AuthenticationClientResponse _$AuthenticationClientResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticationClientResponse(
      json['data'] == null
          ? null
          : ClientRegisterResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..token = json['token'] as String?
      ..errors =
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$AuthenticationClientResponseToJson(
        AuthenticationClientResponse instance) =>
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
      json['data'] as String?,
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
      'data': instance.data,
    };

ResetPasswordResponse _$ResetPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordResponse(
      json['data'] as String?,
    )
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..token = json['token'] as String?
      ..errors =
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$ResetPasswordResponseToJson(
        ResetPasswordResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'errors': instance.errors,
      'data': instance.data,
    };

ChangePasswordResponse _$ChangePasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordResponse(
      json['data'] as String?,
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
      'data': instance.support,
    };

ReportResponse _$ReportResponseFromJson(Map<String, dynamic> json) =>
    ReportResponse(
      json['data'] as String?,
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
      'data': instance.data,
    };

LogoutResponse _$LogoutResponseFromJson(Map<String, dynamic> json) =>
    LogoutResponse(
      json['data'] as String?,
    )
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..token = json['token'] as String?
      ..errors =
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$LogoutResponseToJson(LogoutResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'errors': instance.errors,
      'data': instance.data,
    };

DeleteAccountResponse _$DeleteAccountResponseFromJson(
        Map<String, dynamic> json) =>
    DeleteAccountResponse(
      json['data'] as String?,
    )
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..token = json['token'] as String?
      ..errors =
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$DeleteAccountResponseToJson(
        DeleteAccountResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'errors': instance.errors,
      'data': instance.data,
    };

Government _$GovernmentFromJson(Map<String, dynamic> json) => Government(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['cities'] as String?,
    );

Map<String, dynamic> _$GovernmentToJson(Government instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cities': instance.cities,
    };

GovernmentResponse _$GovernmentResponseFromJson(Map<String, dynamic> json) =>
    GovernmentResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => Government.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..token = json['token'] as String?
      ..errors =
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$GovernmentResponseToJson(GovernmentResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'errors': instance.errors,
      'data': instance.data,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['governorateId'] as String?,
      json['governorate'] as String?,
      json['users'] as String?,
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'governorateId': instance.governorateId,
      'governorate': instance.governorate,
      'users': instance.users,
    };

CityResponse _$CityResponseFromJson(Map<String, dynamic> json) => CityResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => City.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..token = json['token'] as String?
      ..errors =
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$CityResponseToJson(CityResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'errors': instance.errors,
      'data': instance.data,
    };

GetListUserResponse _$GetListUserResponseFromJson(Map<String, dynamic> json) =>
    GetListUserResponse(
      (json['bookingID'] as num?)?.toInt(),
      json['clientId'] as String?,
      json['serviceProviderID'] as String?,
      json['day'] as String?,
      json['hours'] as String?,
      (json['totalPrice'] as num?)?.toInt(),
      (json['status'] as num?)?.toInt(),
      json['location'] as String?,
      json['clientName'] as String?,
      json['serviceProviderName'] as String?,
      (json['serviceType'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetListUserResponseToJson(
        GetListUserResponse instance) =>
    <String, dynamic>{
      'bookingID': instance.bookingID,
      'clientId': instance.clientId,
      'serviceProviderID': instance.serviceProviderID,
      'day': instance.day,
      'hours': instance.hours,
      'totalPrice': instance.totalPrice,
      'status': instance.status,
      'location': instance.location,
      'clientName': instance.clientName,
      'serviceProviderName': instance.serviceProviderName,
      'serviceType': instance.serviceType,
    };

BendingBookingsResponse _$BendingBookingsResponseFromJson(
        Map<String, dynamic> json) =>
    BendingBookingsResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => GetListUserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..token = json['token'] as String?
      ..errors =
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$BendingBookingsResponseToJson(
        BendingBookingsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'errors': instance.errors,
      'data': instance.data,
    };

ConfirmedBookingsResponse _$ConfirmedBookingsResponseFromJson(
        Map<String, dynamic> json) =>
    ConfirmedBookingsResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => GetListUserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..token = json['token'] as String?
      ..errors =
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$ConfirmedBookingsResponseToJson(
        ConfirmedBookingsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'errors': instance.errors,
      'data': instance.data,
    };

PaidBookingsResponse _$PaidBookingsResponseFromJson(
        Map<String, dynamic> json) =>
    PaidBookingsResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => GetListUserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..token = json['token'] as String?
      ..errors =
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$PaidBookingsResponseToJson(
        PaidBookingsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'errors': instance.errors,
      'data': instance.data,
    };

CancelBookingsResponse _$CancelBookingsResponseFromJson(
        Map<String, dynamic> json) =>
    CancelBookingsResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => GetListUserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..token = json['token'] as String?
      ..errors =
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$CancelBookingsResponseToJson(
        CancelBookingsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'errors': instance.errors,
      'data': instance.data,
    };

CompleteBookingsResponse _$CompleteBookingsResponseFromJson(
        Map<String, dynamic> json) =>
    CompleteBookingsResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => GetListUserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..token = json['token'] as String?
      ..errors =
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$CompleteBookingsResponseToJson(
        CompleteBookingsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'errors': instance.errors,
      'data': instance.data,
    };

RejectedBookingsResponse _$RejectedBookingsResponseFromJson(
        Map<String, dynamic> json) =>
    RejectedBookingsResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => GetListUserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..token = json['token'] as String?
      ..errors =
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$RejectedBookingsResponseToJson(
        RejectedBookingsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'errors': instance.errors,
      'data': instance.data,
    };

PutCancelBookingsDataResponse _$PutCancelBookingsDataResponseFromJson(
        Map<String, dynamic> json) =>
    PutCancelBookingsDataResponse(
      (json['bookingId'] as num?)?.toInt(),
      (json['newStatus'] as num?)?.toInt(),
      json['cancelledBy'] as String?,
    )
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..token = json['token'] as String?
      ..errors =
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$PutCancelBookingsDataResponseToJson(
        PutCancelBookingsDataResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'errors': instance.errors,
      'bookingId': instance.bookingId,
      'newStatus': instance.newStatus,
      'cancelledBy': instance.cancelledBy,
    };

PutCancelBookingsResponse _$PutCancelBookingsResponseFromJson(
        Map<String, dynamic> json) =>
    PutCancelBookingsResponse(
      json['data'] == null
          ? null
          : PutCancelBookingsDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..token = json['token'] as String?
      ..errors =
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$PutCancelBookingsResponseToJson(
        PutCancelBookingsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'errors': instance.errors,
      'data': instance.data,
    };
