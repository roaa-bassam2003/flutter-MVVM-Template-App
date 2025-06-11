// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginObject {
  String get userName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Create a copy of LoginObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginObjectCopyWith<LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginObjectCopyWith<$Res> {
  factory $LoginObjectCopyWith(
          LoginObject value, $Res Function(LoginObject) then) =
      _$LoginObjectCopyWithImpl<$Res, LoginObject>;
  @useResult
  $Res call({String userName, String password});
}

/// @nodoc
class _$LoginObjectCopyWithImpl<$Res, $Val extends LoginObject>
    implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginObjectImplCopyWith<$Res>
    implements $LoginObjectCopyWith<$Res> {
  factory _$$LoginObjectImplCopyWith(
          _$LoginObjectImpl value, $Res Function(_$LoginObjectImpl) then) =
      __$$LoginObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userName, String password});
}

/// @nodoc
class __$$LoginObjectImplCopyWithImpl<$Res>
    extends _$LoginObjectCopyWithImpl<$Res, _$LoginObjectImpl>
    implements _$$LoginObjectImplCopyWith<$Res> {
  __$$LoginObjectImplCopyWithImpl(
      _$LoginObjectImpl _value, $Res Function(_$LoginObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? password = null,
  }) {
    return _then(_$LoginObjectImpl(
      null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginObjectImpl implements _LoginObject {
  _$LoginObjectImpl(this.userName, this.password);

  @override
  final String userName;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginObject(userName: $userName, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginObjectImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userName, password);

  /// Create a copy of LoginObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginObjectImplCopyWith<_$LoginObjectImpl> get copyWith =>
      __$$LoginObjectImplCopyWithImpl<_$LoginObjectImpl>(this, _$identity);
}

abstract class _LoginObject implements LoginObject {
  factory _LoginObject(final String userName, final String password) =
      _$LoginObjectImpl;

  @override
  String get userName;
  @override
  String get password;

  /// Create a copy of LoginObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginObjectImplCopyWith<_$LoginObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisterProviderObject {
  int get type => throw _privateConstructorUsedError;
  double get hourPrice => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  int get city => throw _privateConstructorUsedError;
  File get personalPhoto => throw _privateConstructorUsedError;
  File get personWithCard => throw _privateConstructorUsedError;
  File get idCardFrontPhoto => throw _privateConstructorUsedError;
  File get idCardBackPhoto => throw _privateConstructorUsedError;
  File? get certification => throw _privateConstructorUsedError;

  /// Create a copy of RegisterProviderObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterProviderObjectCopyWith<RegisterProviderObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterProviderObjectCopyWith<$Res> {
  factory $RegisterProviderObjectCopyWith(RegisterProviderObject value,
          $Res Function(RegisterProviderObject) then) =
      _$RegisterProviderObjectCopyWithImpl<$Res, RegisterProviderObject>;
  @useResult
  $Res call(
      {int type,
      double hourPrice,
      String userName,
      String phoneNumber,
      String email,
      String password,
      int city,
      File personalPhoto,
      File personWithCard,
      File idCardFrontPhoto,
      File idCardBackPhoto,
      File? certification});
}

/// @nodoc
class _$RegisterProviderObjectCopyWithImpl<$Res,
        $Val extends RegisterProviderObject>
    implements $RegisterProviderObjectCopyWith<$Res> {
  _$RegisterProviderObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterProviderObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? hourPrice = null,
    Object? userName = null,
    Object? phoneNumber = null,
    Object? email = null,
    Object? password = null,
    Object? city = null,
    Object? personalPhoto = null,
    Object? personWithCard = null,
    Object? idCardFrontPhoto = null,
    Object? idCardBackPhoto = null,
    Object? certification = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      hourPrice: null == hourPrice
          ? _value.hourPrice
          : hourPrice // ignore: cast_nullable_to_non_nullable
              as double,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as int,
      personalPhoto: null == personalPhoto
          ? _value.personalPhoto
          : personalPhoto // ignore: cast_nullable_to_non_nullable
              as File,
      personWithCard: null == personWithCard
          ? _value.personWithCard
          : personWithCard // ignore: cast_nullable_to_non_nullable
              as File,
      idCardFrontPhoto: null == idCardFrontPhoto
          ? _value.idCardFrontPhoto
          : idCardFrontPhoto // ignore: cast_nullable_to_non_nullable
              as File,
      idCardBackPhoto: null == idCardBackPhoto
          ? _value.idCardBackPhoto
          : idCardBackPhoto // ignore: cast_nullable_to_non_nullable
              as File,
      certification: freezed == certification
          ? _value.certification
          : certification // ignore: cast_nullable_to_non_nullable
              as File?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterProviderObjectImplCopyWith<$Res>
    implements $RegisterProviderObjectCopyWith<$Res> {
  factory _$$RegisterProviderObjectImplCopyWith(
          _$RegisterProviderObjectImpl value,
          $Res Function(_$RegisterProviderObjectImpl) then) =
      __$$RegisterProviderObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int type,
      double hourPrice,
      String userName,
      String phoneNumber,
      String email,
      String password,
      int city,
      File personalPhoto,
      File personWithCard,
      File idCardFrontPhoto,
      File idCardBackPhoto,
      File? certification});
}

/// @nodoc
class __$$RegisterProviderObjectImplCopyWithImpl<$Res>
    extends _$RegisterProviderObjectCopyWithImpl<$Res,
        _$RegisterProviderObjectImpl>
    implements _$$RegisterProviderObjectImplCopyWith<$Res> {
  __$$RegisterProviderObjectImplCopyWithImpl(
      _$RegisterProviderObjectImpl _value,
      $Res Function(_$RegisterProviderObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterProviderObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? hourPrice = null,
    Object? userName = null,
    Object? phoneNumber = null,
    Object? email = null,
    Object? password = null,
    Object? city = null,
    Object? personalPhoto = null,
    Object? personWithCard = null,
    Object? idCardFrontPhoto = null,
    Object? idCardBackPhoto = null,
    Object? certification = freezed,
  }) {
    return _then(_$RegisterProviderObjectImpl(
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      null == hourPrice
          ? _value.hourPrice
          : hourPrice // ignore: cast_nullable_to_non_nullable
              as double,
      null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as int,
      null == personalPhoto
          ? _value.personalPhoto
          : personalPhoto // ignore: cast_nullable_to_non_nullable
              as File,
      null == personWithCard
          ? _value.personWithCard
          : personWithCard // ignore: cast_nullable_to_non_nullable
              as File,
      null == idCardFrontPhoto
          ? _value.idCardFrontPhoto
          : idCardFrontPhoto // ignore: cast_nullable_to_non_nullable
              as File,
      null == idCardBackPhoto
          ? _value.idCardBackPhoto
          : idCardBackPhoto // ignore: cast_nullable_to_non_nullable
              as File,
      freezed == certification
          ? _value.certification
          : certification // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$RegisterProviderObjectImpl implements _RegisterProviderObject {
  _$RegisterProviderObjectImpl(
      this.type,
      this.hourPrice,
      this.userName,
      this.phoneNumber,
      this.email,
      this.password,
      this.city,
      this.personalPhoto,
      this.personWithCard,
      this.idCardFrontPhoto,
      this.idCardBackPhoto,
      this.certification);

  @override
  final int type;
  @override
  final double hourPrice;
  @override
  final String userName;
  @override
  final String phoneNumber;
  @override
  final String email;
  @override
  final String password;
  @override
  final int city;
  @override
  final File personalPhoto;
  @override
  final File personWithCard;
  @override
  final File idCardFrontPhoto;
  @override
  final File idCardBackPhoto;
  @override
  final File? certification;

  @override
  String toString() {
    return 'RegisterProviderObject(type: $type, hourPrice: $hourPrice, userName: $userName, phoneNumber: $phoneNumber, email: $email, password: $password, city: $city, personalPhoto: $personalPhoto, personWithCard: $personWithCard, idCardFrontPhoto: $idCardFrontPhoto, idCardBackPhoto: $idCardBackPhoto, certification: $certification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterProviderObjectImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.hourPrice, hourPrice) ||
                other.hourPrice == hourPrice) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.personalPhoto, personalPhoto) ||
                other.personalPhoto == personalPhoto) &&
            (identical(other.personWithCard, personWithCard) ||
                other.personWithCard == personWithCard) &&
            (identical(other.idCardFrontPhoto, idCardFrontPhoto) ||
                other.idCardFrontPhoto == idCardFrontPhoto) &&
            (identical(other.idCardBackPhoto, idCardBackPhoto) ||
                other.idCardBackPhoto == idCardBackPhoto) &&
            (identical(other.certification, certification) ||
                other.certification == certification));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      hourPrice,
      userName,
      phoneNumber,
      email,
      password,
      city,
      personalPhoto,
      personWithCard,
      idCardFrontPhoto,
      idCardBackPhoto,
      certification);

  /// Create a copy of RegisterProviderObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterProviderObjectImplCopyWith<_$RegisterProviderObjectImpl>
      get copyWith => __$$RegisterProviderObjectImplCopyWithImpl<
          _$RegisterProviderObjectImpl>(this, _$identity);
}

abstract class _RegisterProviderObject implements RegisterProviderObject {
  factory _RegisterProviderObject(
      final int type,
      final double hourPrice,
      final String userName,
      final String phoneNumber,
      final String email,
      final String password,
      final int city,
      final File personalPhoto,
      final File personWithCard,
      final File idCardFrontPhoto,
      final File idCardBackPhoto,
      final File? certification) = _$RegisterProviderObjectImpl;

  @override
  int get type;
  @override
  double get hourPrice;
  @override
  String get userName;
  @override
  String get phoneNumber;
  @override
  String get email;
  @override
  String get password;
  @override
  int get city;
  @override
  File get personalPhoto;
  @override
  File get personWithCard;
  @override
  File get idCardFrontPhoto;
  @override
  File get idCardBackPhoto;
  @override
  File? get certification;

  /// Create a copy of RegisterProviderObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterProviderObjectImplCopyWith<_$RegisterProviderObjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChangePasswordObject {
  String get passwordOne => throw _privateConstructorUsedError;
  String get passwordTwo => throw _privateConstructorUsedError;

  /// Create a copy of ChangePasswordObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChangePasswordObjectCopyWith<ChangePasswordObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePasswordObjectCopyWith<$Res> {
  factory $ChangePasswordObjectCopyWith(ChangePasswordObject value,
          $Res Function(ChangePasswordObject) then) =
      _$ChangePasswordObjectCopyWithImpl<$Res, ChangePasswordObject>;
  @useResult
  $Res call({String passwordOne, String passwordTwo});
}

/// @nodoc
class _$ChangePasswordObjectCopyWithImpl<$Res,
        $Val extends ChangePasswordObject>
    implements $ChangePasswordObjectCopyWith<$Res> {
  _$ChangePasswordObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChangePasswordObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passwordOne = null,
    Object? passwordTwo = null,
  }) {
    return _then(_value.copyWith(
      passwordOne: null == passwordOne
          ? _value.passwordOne
          : passwordOne // ignore: cast_nullable_to_non_nullable
              as String,
      passwordTwo: null == passwordTwo
          ? _value.passwordTwo
          : passwordTwo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangePasswordObjectImplCopyWith<$Res>
    implements $ChangePasswordObjectCopyWith<$Res> {
  factory _$$ChangePasswordObjectImplCopyWith(_$ChangePasswordObjectImpl value,
          $Res Function(_$ChangePasswordObjectImpl) then) =
      __$$ChangePasswordObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String passwordOne, String passwordTwo});
}

/// @nodoc
class __$$ChangePasswordObjectImplCopyWithImpl<$Res>
    extends _$ChangePasswordObjectCopyWithImpl<$Res, _$ChangePasswordObjectImpl>
    implements _$$ChangePasswordObjectImplCopyWith<$Res> {
  __$$ChangePasswordObjectImplCopyWithImpl(_$ChangePasswordObjectImpl _value,
      $Res Function(_$ChangePasswordObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChangePasswordObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passwordOne = null,
    Object? passwordTwo = null,
  }) {
    return _then(_$ChangePasswordObjectImpl(
      null == passwordOne
          ? _value.passwordOne
          : passwordOne // ignore: cast_nullable_to_non_nullable
              as String,
      null == passwordTwo
          ? _value.passwordTwo
          : passwordTwo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangePasswordObjectImpl implements _ChangePasswordObject {
  _$ChangePasswordObjectImpl(this.passwordOne, this.passwordTwo);

  @override
  final String passwordOne;
  @override
  final String passwordTwo;

  @override
  String toString() {
    return 'ChangePasswordObject(passwordOne: $passwordOne, passwordTwo: $passwordTwo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePasswordObjectImpl &&
            (identical(other.passwordOne, passwordOne) ||
                other.passwordOne == passwordOne) &&
            (identical(other.passwordTwo, passwordTwo) ||
                other.passwordTwo == passwordTwo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, passwordOne, passwordTwo);

  /// Create a copy of ChangePasswordObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePasswordObjectImplCopyWith<_$ChangePasswordObjectImpl>
      get copyWith =>
          __$$ChangePasswordObjectImplCopyWithImpl<_$ChangePasswordObjectImpl>(
              this, _$identity);
}

abstract class _ChangePasswordObject implements ChangePasswordObject {
  factory _ChangePasswordObject(
          final String passwordOne, final String passwordTwo) =
      _$ChangePasswordObjectImpl;

  @override
  String get passwordOne;
  @override
  String get passwordTwo;

  /// Create a copy of ChangePasswordObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangePasswordObjectImplCopyWith<_$ChangePasswordObjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReportObject {
  String get userName => throw _privateConstructorUsedError;
  String get reportMessage => throw _privateConstructorUsedError;

  /// Create a copy of ReportObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportObjectCopyWith<ReportObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportObjectCopyWith<$Res> {
  factory $ReportObjectCopyWith(
          ReportObject value, $Res Function(ReportObject) then) =
      _$ReportObjectCopyWithImpl<$Res, ReportObject>;
  @useResult
  $Res call({String userName, String reportMessage});
}

/// @nodoc
class _$ReportObjectCopyWithImpl<$Res, $Val extends ReportObject>
    implements $ReportObjectCopyWith<$Res> {
  _$ReportObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? reportMessage = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      reportMessage: null == reportMessage
          ? _value.reportMessage
          : reportMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportObjectImplCopyWith<$Res>
    implements $ReportObjectCopyWith<$Res> {
  factory _$$ReportObjectImplCopyWith(
          _$ReportObjectImpl value, $Res Function(_$ReportObjectImpl) then) =
      __$$ReportObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userName, String reportMessage});
}

/// @nodoc
class __$$ReportObjectImplCopyWithImpl<$Res>
    extends _$ReportObjectCopyWithImpl<$Res, _$ReportObjectImpl>
    implements _$$ReportObjectImplCopyWith<$Res> {
  __$$ReportObjectImplCopyWithImpl(
      _$ReportObjectImpl _value, $Res Function(_$ReportObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? reportMessage = null,
  }) {
    return _then(_$ReportObjectImpl(
      null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      null == reportMessage
          ? _value.reportMessage
          : reportMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ReportObjectImpl implements _ReportObject {
  _$ReportObjectImpl(this.userName, this.reportMessage);

  @override
  final String userName;
  @override
  final String reportMessage;

  @override
  String toString() {
    return 'ReportObject(userName: $userName, reportMessage: $reportMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportObjectImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.reportMessage, reportMessage) ||
                other.reportMessage == reportMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userName, reportMessage);

  /// Create a copy of ReportObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportObjectImplCopyWith<_$ReportObjectImpl> get copyWith =>
      __$$ReportObjectImplCopyWithImpl<_$ReportObjectImpl>(this, _$identity);
}

abstract class _ReportObject implements ReportObject {
  factory _ReportObject(final String userName, final String reportMessage) =
      _$ReportObjectImpl;

  @override
  String get userName;
  @override
  String get reportMessage;

  /// Create a copy of ReportObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportObjectImplCopyWith<_$ReportObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
