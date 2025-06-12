import 'dart:async';
import 'dart:io';
import 'package:flutter_advanced_course/app/functions.dart';
import 'package:flutter_advanced_course/domain/usecase/city_use_case.dart';
import 'package:flutter_advanced_course/domain/usecase/government_use_case.dart';
import 'package:flutter_advanced_course/domain/usecase/register_service_provider_use_case.dart';
import 'package:flutter_advanced_course/presentation/base/base_view_model.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/shared/freezed_data_classes.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer_impl.dart';

class RegisterProviderViewModel extends BaseViewModel
    implements
        RegisterProviderViewModelInputs,
        RegisterProviderViewModelOutputs {
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();

  final StreamController _governIdStreamController =
      StreamController<String>.broadcast();

  final StreamController _emailStreamController =
      StreamController<String>.broadcast();

  final StreamController _hourPriceStreamController =
      StreamController<String>.broadcast();

  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  final StreamController _phoneNumberStreamController =
      StreamController<String>.broadcast();

//   final StreamController _typeStreamController =
//       StreamController<String>.broadcast();

  final StreamController _idCardBackPhotoStreamController =
      StreamController<File>.broadcast();

  final StreamController _idCardFrontPhotoStreamController =
      StreamController<File>.broadcast();

  final StreamController _personalPhotoStreamController =
      StreamController<File>.broadcast();

  final StreamController _personWithCardStreamController =
      StreamController<File>.broadcast();

  final StreamController _certificationStreamController =
      StreamController<File>.broadcast();

  final StreamController _areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  final StreamController isUserRegisterProviderSuccessfullyStreamController =
      StreamController<bool>();

  String _currentPassword = '';

  var registerProviderObject = RegisterProviderObject(
    0, // type
    0.0, // hourPrice
    "", // userName
    "", // phoneNumber
    "", // email
    "", // password
    1, // city
    File(''), // personalPhoto
    File(''), // personWithCard
    File(''), // idCardFrontPhoto
    File(''), // idCardBackPhoto
    null, // certification
  );

  final RegisterServiceProviderUseCase _registerServiceProviderUseCase;
  final GovernmentUseCase _governmentUseCase;
  final CityUseCase _cityUseCase;
  RegisterProviderViewModel(this._registerServiceProviderUseCase,
      this._cityUseCase, this._governmentUseCase);

  var currentGovernId = 1;
  List<String> governmentList = [];

  // inputs
  @override
  void start() {
    // getGovernment();
    // getCity();
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    super.dispose();
    _certificationStreamController.close();
    _idCardBackPhotoStreamController.close();
    _hourPriceStreamController.close();
    _idCardFrontPhotoStreamController.close();
    _personWithCardStreamController.close();
    _personalPhotoStreamController.close();
    _governIdStreamController.close();
    _emailStreamController.close();
    _passwordStreamController.close();
    _phoneNumberStreamController.close();
    // _typeStreamController.close();
    _userNameStreamController.close();
    _areAllInputsValidStreamController.close();
    isUserRegisterProviderSuccessfullyStreamController.close();
  }

  @override
  Sink get inputCertification => _certificationStreamController.sink;

  @override
  Sink get inputGovernId => _governIdStreamController.sink;

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputHourPrice => _hourPriceStreamController.sink;

  @override
  Sink get inputIdCardBackPhoto => _idCardBackPhotoStreamController.sink;

  @override
  Sink get inputIdCardFrontPhoto => _idCardFrontPhotoStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputPersonWithCard => _personWithCardStreamController.sink;

  @override
  Sink get inputPersonalPhoto => _personalPhotoStreamController.sink;

  @override
  Sink get inputPhoneNumber => _phoneNumberStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get inputAllInputsValid => _areAllInputsValidStreamController.sink;

  @override
  getCity() async {
    inputState.add(LoadingState(
      stateRendererType: StateRendererType.popUpLoadingState,
    ));
    (await _cityUseCase.execute(currentGovernId)).fold((failure) {
      inputState.add(ErrorState(
        StateRendererType.popUpErrorState,
        failure.message,
      ));
    }, (data) {
      inputState.add(ContentState());
      // navigate to main screen
      //   isUserLoggedInSuccessfullyStreamController.add(true);
    });
  }

  @override
  getGovernment() async {
    inputState.add(LoadingState(
      stateRendererType: StateRendererType.popUpLoadingState,
    ));
    (await _governmentUseCase.execute(null)).fold((failure) {
      inputState.add(ErrorState(
        StateRendererType.popUpErrorState,
        failure.message,
      ));
    }, (data) {
      inputState.add(ContentState());
      governmentList = data.governments!.map((gov) => gov.name).toList();
      // navigate to main screen
      //   isUserLoggedInSuccessfullyStreamController.add(true);
    });
  }

  @override
  registerProvider() async {
    inputState.add(LoadingState(
      stateRendererType: StateRendererType.popUpLoadingState,
    ));
    (await _registerServiceProviderUseCase
            .execute(RegisterServiceProviderUseCaseInput(
      type: registerProviderObject.type,
      hourPrice: registerProviderObject.hourPrice,
      userNameId: registerProviderObject.userName,
      phoneNumber: registerProviderObject.phoneNumber,
      email: registerProviderObject.email,
      password: registerProviderObject.password,
      city: registerProviderObject.city,
      personWithCard: registerProviderObject.personWithCard,
      personalPhoto: registerProviderObject.personalPhoto,
      idCardFrontPhoto: registerProviderObject.idCardFrontPhoto,
      idCardBackPhoto: registerProviderObject.idCardBackPhoto,
      certification: registerProviderObject.certification,
    )))
        .fold((failure) {
      inputState.add(ErrorState(
        StateRendererType.popUpErrorState,
        failure.message,
      ));
    }, (data) {
      inputState.add(ContentState());
      // navigate to waiting screen
      isUserRegisterProviderSuccessfullyStreamController.add(true);
    });
  }

  @override
  setCurrentGovernId(String? value) {
    currentGovernId = governmentList.indexOf(value!) + 1;
    validate();
  }

  @override
  List<String> getGovernmentList() {
    return governmentList;
  }

  @override
  setCityId(String? cityId) {
    final parsedCityId = int.tryParse(cityId!) ?? 0;
    registerProviderObject =
        registerProviderObject.copyWith(city: parsedCityId);
    validate();
  }

  @override
  setCertification(File? certification) {
    inputCertification.add(certification);
    if (certification != null && certification.path.isNotEmpty) {
      // update registerProviderObject
      registerProviderObject =
          registerProviderObject.copyWith(certification: certification);
    } else {
      // reset certification value in registerProviderObject
      registerProviderObject =
          registerProviderObject.copyWith(certification: null);
    }
    validate();
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    if (emailValid(email)) {
      // update registerProviderObject
      registerProviderObject = registerProviderObject.copyWith(email: email);
    } else {
      // reset email value in registerProviderObject
      registerProviderObject = registerProviderObject.copyWith(email: "");
    }
    validate();
  }

  @override
  setHourePrice(String hourePrice) {
    inputHourPrice.add(hourePrice);
    final parsedPrice = double.tryParse(hourePrice);
    if (parsedPrice != null && isHourPriceValid(parsedPrice)) {
      // update registerProviderObject
      registerProviderObject =
          registerProviderObject.copyWith(hourPrice: parsedPrice);
    } else {
      // reset houre price value in registerProviderObject
      registerProviderObject = registerProviderObject.copyWith(hourPrice: 0.0);
    }
    validate();
  }

  @override
  setIdCardBackPhoto(File idCardBackPhoto) {
    inputIdCardBackPhoto.add(idCardBackPhoto);
    if (idCardBackPhoto.path.isNotEmpty) {
      // update registerProviderObject
      registerProviderObject =
          registerProviderObject.copyWith(idCardBackPhoto: idCardBackPhoto);
    } else {
      // reset id card back photo value in registerProviderObject
      registerProviderObject =
          registerProviderObject.copyWith(idCardBackPhoto: File(""));
    }
    validate();
  }

  @override
  setIdCardFrontPhoto(File idCardFrontPhoto) {
    inputIdCardFrontPhoto.add(idCardFrontPhoto);
    if (idCardFrontPhoto.path.isNotEmpty) {
      // update registerProviderObject
      registerProviderObject =
          registerProviderObject.copyWith(idCardFrontPhoto: idCardFrontPhoto);
    } else {
      // reset id card front photo value in registerProviderObject
      registerProviderObject =
          registerProviderObject.copyWith(idCardFrontPhoto: File(""));
    }
    validate();
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    if (validatePassword(password) == null) {
      // update registerProviderObject
      registerProviderObject =
          registerProviderObject.copyWith(password: password);
    } else {
      // reset phone number value in registerProviderObject
      registerProviderObject = registerProviderObject.copyWith(password: "");
    }
    validate();
  }

  @override
  setPersonWithCard(File personWithCard) {
    inputPersonWithCard.add(personWithCard);
    if (personWithCard.path.isNotEmpty) {
      // update registerProviderObject
      registerProviderObject =
          registerProviderObject.copyWith(personWithCard: personWithCard);
    } else {
      // reset person with card value in registerProviderObject
      registerProviderObject =
          registerProviderObject.copyWith(personWithCard: File(""));
    }
    validate();
  }

  @override
  setPersonalPhoto(File personalPhoto) {
    inputPersonalPhoto.add(personalPhoto);
    if (personalPhoto.path.isNotEmpty) {
      // update registerProviderObject
      registerProviderObject =
          registerProviderObject.copyWith(personalPhoto: personalPhoto);
    } else {
      // reset personal photo value in registerProviderObject
      registerProviderObject =
          registerProviderObject.copyWith(personalPhoto: File(""));
    }
    validate();
  }

  @override
  setPhoneNumber(String phoneNumber) {
    inputPhoneNumber.add(phoneNumber);
    if (isPhoneNumberValid(phoneNumber)) {
      // update registerProviderObject
      registerProviderObject =
          registerProviderObject.copyWith(phoneNumber: phoneNumber);
    } else {
      // reset phone number value in registerProviderObject
      registerProviderObject = registerProviderObject.copyWith(phoneNumber: "");
    }
    validate();
  }

  @override
  setType(String type) {
    final parsedType = int.tryParse(type) ?? 0;
    // update registerProviderObject
    registerProviderObject = registerProviderObject.copyWith(type: parsedType);
    validate();
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    if (isUserNameValid(userName)) {
      // update registerProviderObject
      registerProviderObject =
          registerProviderObject.copyWith(userName: userName);
    } else {
      // reset user name value in registerProviderObject
      registerProviderObject = registerProviderObject.copyWith(userName: "");
    }
    validate();
  }

  // outputs
  @override
  Stream<File> get outCertification =>
      _certificationStreamController.stream.map((file) => file);

  @override
  Stream<File> get outPersonWithCard =>
      _personWithCardStreamController.stream.map((file) => file);

  @override
  Stream<File> get outPersonalPhoto =>
      _personalPhotoStreamController.stream.map((file) => file);

  @override
  Stream<File> get outIdCardBackPhoto =>
      _idCardBackPhotoStreamController.stream.map((file) => file);

  @override
  Stream<File> get outIdCardFrontPhoto =>
      _idCardFrontPhotoStreamController.stream.map((file) => file);

  @override
  Stream<bool> get outIsGovernIdValid =>
      _governIdStreamController.stream.map((governId) => governId);

  @override
  Stream<bool> get outIsEmailValid => _emailStreamController.stream.map(
        (email) => emailValid(email),
      );

  @override
  Stream<String?> get outIsErrorEmail => outIsEmailValid
      .map((isEmail) => isEmail ? null : AppStrings.usernameError);

  @override
  Stream<bool> get outIsHourPriceValid =>
      _hourPriceStreamController.stream.map((hourPriceStr) {
        // _isHourPriceValid(hourPrice),
        double? hourPrice = double.tryParse(hourPriceStr);
        if (hourPrice == null) return false;
        return isHourPriceValid(hourPrice);
      });

  @override
  Stream<String?> get outIsErrorHourPrice => outIsHourPriceValid
      .map((isHourePrice) => isHourePrice ? null : AppStrings.hourePriceValid);

  @override
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream.map(
        (password) {
          _currentPassword = password;
          return validatePassword(password) == null;
        },
      );

  @override
  Stream<String?> get outIsErrorPassword => outIsPasswordValid.map(
        (isPasswordValid) =>
            isPasswordValid ? null : validatePassword(_currentPassword),
      );

  @override
  Stream<bool> get outIsPhoneNumberValid =>
      _phoneNumberStreamController.stream.map(
        (phoneNumber) => isPhoneNumberValid(phoneNumber),
      );

  @override
  Stream<String?> get outIsErrorPhoneNumber => outIsPhoneNumberValid.map(
      (isPhoneNumber) => isPhoneNumber ? null : AppStrings.phoneNumberValid);

  @override
  Stream<bool> get outIsUserNameValid => _userNameStreamController.stream.map(
        (userName) => isUserNameValid(userName),
      );

  @override
  Stream<String?> get outIsErrorUserName => outIsUserNameValid
      .map((isUserName) => isUserName ? null : AppStrings.userNameInValid);

  @override
  Stream<bool> get outAreAllInputsValid =>
      _areAllInputsValidStreamController.stream
          .map((_) => _areAllInputsValid());

  // private functions
  bool _areAllInputsValid() {
    final isTypeTwo = registerProviderObject.type == 2;

    final isCertificationValid = !isTypeTwo ||
        (registerProviderObject.certification != null &&
            registerProviderObject.certification!.path.isNotEmpty);

    return registerProviderObject.hourPrice != 0.0 &&
        registerProviderObject.userName.isNotEmpty &&
        registerProviderObject.phoneNumber.isNotEmpty &&
        registerProviderObject.email.isNotEmpty &&
        registerProviderObject.password.isNotEmpty &&
        registerProviderObject.personalPhoto != File('') &&
        registerProviderObject.personWithCard != File('') &&
        registerProviderObject.idCardBackPhoto != File('') &&
        registerProviderObject.idCardFrontPhoto != File('') &&
        isCertificationValid;
  }

  validate() {
    inputAllInputsValid.add(null);
  }
}

abstract class RegisterProviderViewModelInputs {
  Sink get inputUserName;
  Sink get inputGovernId;
  Sink get inputEmail;
  Sink get inputHourPrice;
  Sink get inputPassword;
  Sink get inputPhoneNumber;
//   Sink get inputType;
  Sink get inputIdCardBackPhoto;
  Sink get inputIdCardFrontPhoto;
  Sink get inputPersonalPhoto;
  Sink get inputPersonWithCard;
  Sink get inputCertification;

  Sink get inputAllInputsValid;

  setUserName(String userName);
  setCityId(String? cityId);
  setEmail(String email);
  setHourePrice(String hourePrice);
  setPassword(String password);
  setPhoneNumber(String phoneNumber);

// type from the service type args
  setType(String type);

//   files
  setIdCardBackPhoto(File idCardBackPhoto);
  setIdCardFrontPhoto(File idCardFrontPhoto);
  setPersonalPhoto(File personalPhoto);
  setPersonWithCard(File personWithCard);
  setCertification(File? certification); // optional

  registerProvider();
  getCity();
  getGovernment();
  setCurrentGovernId(String? value);
  getGovernmentList();
}

abstract class RegisterProviderViewModelOutputs {
  Stream<bool> get outIsUserNameValid;
  Stream<String?> get outIsErrorUserName;

  Stream<bool> get outIsGovernIdValid;
//   Stream<String?> get outIsErrorCityId;

  Stream<bool> get outIsEmailValid;
  Stream<String?> get outIsErrorEmail;

  Stream<bool> get outIsHourPriceValid;
  Stream<String?> get outIsErrorHourPrice;

  Stream<bool> get outIsPasswordValid;
  Stream<String?> get outIsErrorPassword;

  Stream<bool> get outIsPhoneNumberValid;
  Stream<String?> get outIsErrorPhoneNumber;

//   Stream<bool> get outIsTypeValid;
//   Stream<String?> get outIsErrorType;

  Stream<File> get outIdCardBackPhoto;
  Stream<File> get outIdCardFrontPhoto;
  Stream<File> get outPersonalPhoto;
  Stream<File> get outPersonWithCard;
  Stream<File> get outCertification;

  Stream<bool> get outAreAllInputsValid;
}
