import 'dart:async';
import 'dart:io';
import 'package:flutter_advanced_course/app/functions.dart';
import 'package:flutter_advanced_course/domain/usecase/city_use_case.dart';
import 'package:flutter_advanced_course/domain/usecase/government_use_case.dart';
import 'package:flutter_advanced_course/domain/usecase/register_client_use_case.dart';
import 'package:flutter_advanced_course/presentation/base/base_view_model.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/shared/freezed_data_classes.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer_impl.dart';

class RegisterClientViewModel extends BaseViewModel
    implements RegisterClientViewModelInputs, RegisterClientViewModelOutputs {
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _governIdStreamController =
      StreamController<String>.broadcast();
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();
  final StreamController _locationStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  final StreamController _phoneNumberStreamController =
      StreamController<String>.broadcast();
  final StreamController _idCardBackPhotoStreamController =
      StreamController<File>.broadcast();
  final StreamController _idCardFrontPhotoStreamController =
      StreamController<File>.broadcast();
  final StreamController _personalPhotoStreamController =
      StreamController<File>.broadcast();
  final StreamController _personWithCardStreamController =
      StreamController<File>.broadcast();
  final StreamController _areAllInputsValidStreamController =
      StreamController<void>.broadcast();
  final StreamController<bool>
      isUserRegisterProviderSuccessfullyStreamController =
      StreamController<bool>.broadcast();

  String _currentPassword = '';
  var registerClientObject = RegisterClientObject(
    "", // location
    "", // userName
    "", // phoneNumber
    "", // email
    "", // password
    1, // city
    1, // government
    File(''), // personalPhoto
    File(''), // personWithCard
    File(''), // idCardFrontPhoto
    File(''), // idCardBackPhoto
  );

  final RegisterClientUseCase _registerClientUseCase;
  final GovernmentUseCase _governmentUseCase;
  final CityUseCase _cityUseCase;
  RegisterClientViewModel(
      this._registerClientUseCase, this._cityUseCase, this._governmentUseCase);

  var currentGovernId = 1;
  List<String> governmentList = [];

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    _idCardBackPhotoStreamController.close();
    _locationStreamController.close();
    _idCardFrontPhotoStreamController.close();
    _personWithCardStreamController.close();
    _personalPhotoStreamController.close();
    _governIdStreamController.close();
    _emailStreamController.close();
    _passwordStreamController.close();
    _phoneNumberStreamController.close();
    _userNameStreamController.close();
    _areAllInputsValidStreamController.close();
    isUserRegisterProviderSuccessfullyStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputLocation => _locationStreamController.sink;
  @override
  Sink get inputEmail => _emailStreamController.sink;
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
    });
  }

  @override
  registerClient() async {
    inputState.add(LoadingState(
      stateRendererType: StateRendererType.popUpLoadingState,
    ));
    (await _registerClientUseCase.execute(RegisterClientUseCaseInput(
      location: registerClientObject.location,
      userNameId: registerClientObject.userName,
      phoneNumber: registerClientObject.phoneNumber,
      email: registerClientObject.email,
      password: registerClientObject.password,
      city: registerClientObject.city,
      government: registerClientObject.government,
      personWithCard: registerClientObject.personWithCard,
      personalPhoto: registerClientObject.personalPhoto,
      idCardBackPhoto: registerClientObject.idCardBackPhoto,
      idCardFrontPhoto: registerClientObject.idCardFrontPhoto,
    )))
        .fold((failure) {
      inputState.add(ErrorState(
        StateRendererType.popUpErrorState,
        failure.message,
      ));
    }, (data) {
      inputState.add(ContentState());
      isUserRegisterProviderSuccessfullyStreamController.add(true);
    });
  }

  @override
  setCurrentGovernId(String? value) {
    if (value != null) {
      currentGovernId = governmentList.indexOf(value) + 1;
      registerClientObject =
          registerClientObject.copyWith(government: currentGovernId);
      validate();
    }
  }

  @override
  List<String> getGovernmentList() {
    return governmentList;
  }

  @override
  setCityId(String? cityId) {
    if (cityId != null) {
      final parsedCityId = int.tryParse(cityId) ?? 0;
      registerClientObject = registerClientObject.copyWith(city: parsedCityId);
      validate();
    }
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    if (emailValid(email)) {
      registerClientObject = registerClientObject.copyWith(email: email);
    } else {
      registerClientObject = registerClientObject.copyWith(email: "");
    }
    validate();
  }

  @override
  setIdCardBackPhoto(File idCardBackPhoto) {
    inputIdCardBackPhoto.add(idCardBackPhoto);
    if (idCardBackPhoto.path.isNotEmpty) {
      registerClientObject =
          registerClientObject.copyWith(idCardBackPhoto: idCardBackPhoto);
    } else {
      registerClientObject =
          registerClientObject.copyWith(idCardBackPhoto: File(""));
    }
    validate();
  }

  @override
  setIdCardFrontPhoto(File idCardFrontPhoto) {
    inputIdCardFrontPhoto.add(idCardFrontPhoto);
    if (idCardFrontPhoto.path.isNotEmpty) {
      registerClientObject =
          registerClientObject.copyWith(idCardFrontPhoto: idCardFrontPhoto);
    } else {
      registerClientObject =
          registerClientObject.copyWith(idCardFrontPhoto: File(""));
    }
    validate();
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    if (validatePassword(password) == null) {
      registerClientObject = registerClientObject.copyWith(password: password);
    } else {
      registerClientObject = registerClientObject.copyWith(password: "");
    }
    validate();
  }

  @override
  setPersonWithCard(File personWithCard) {
    inputPersonWithCard.add(personWithCard);
    if (personWithCard.path.isNotEmpty) {
      registerClientObject =
          registerClientObject.copyWith(personWithCard: personWithCard);
    } else {
      registerClientObject =
          registerClientObject.copyWith(personWithCard: File(""));
    }
    validate();
  }

  @override
  setPersonalPhoto(File personalPhoto) {
    inputPersonalPhoto.add(personalPhoto);
    if (personalPhoto.path.isNotEmpty) {
      registerClientObject =
          registerClientObject.copyWith(personalPhoto: personalPhoto);
    } else {
      registerClientObject =
          registerClientObject.copyWith(personalPhoto: File(""));
    }
    validate();
  }

  @override
  setPhoneNumber(String phoneNumber) {
    inputPhoneNumber.add(phoneNumber);
    if (isPhoneNumberValid(phoneNumber)) {
      registerClientObject =
          registerClientObject.copyWith(phoneNumber: phoneNumber);
    } else {
      registerClientObject = registerClientObject.copyWith(phoneNumber: "");
    }
    validate();
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    if (isUserNameValid(userName)) {
      registerClientObject = registerClientObject.copyWith(userName: userName);
    } else {
      registerClientObject = registerClientObject.copyWith(userName: "");
    }
    validate();
  }

  @override
  setLocation(String location) {
    inputLocation.add(location);
    if (isUserNameValid(location)) {
      registerClientObject = registerClientObject.copyWith(location: location);
    } else {
      registerClientObject = registerClientObject.copyWith(location: "");
    }
    validate();
  }

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
      _governIdStreamController.stream.map((governId) => governId.isNotEmpty);

  @override
  Stream<bool> get outIsEmailValid =>
      _emailStreamController.stream.map((email) => emailValid(email));

  @override
  Stream<String?> get outIsErrorEmail => outIsEmailValid
      .map((isEmail) => isEmail ? null : AppStrings.usernameError);

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
        (isPhoneNumber) => isPhoneNumber ? null : AppStrings.phoneNumberValid,
      );

  @override
  Stream<bool> get outIsUserNameValid => _userNameStreamController.stream.map(
        (userName) => isUserNameValid(userName),
      );

  @override
  Stream<String?> get outIsErrorUserName => outIsUserNameValid
      .map((isUserName) => isUserName ? null : AppStrings.userNameInValid);

  @override
  Stream<bool> get outIsLocationValid => _locationStreamController.stream.map(
        (location) => isUserNameValid(location),
      );

  @override
  Stream<String?> get outIsErrorLocation => outIsLocationValid
      .map((isLocation) => isLocation ? null : AppStrings.locationValid);

  @override
  Stream<bool> get outAreAllInputsValid =>
      _areAllInputsValidStreamController.stream
          .map((_) => _areAllInputsValid());

  bool _areAllInputsValid() {
    return registerClientObject.userName.isNotEmpty &&
        registerClientObject.phoneNumber.isNotEmpty &&
        registerClientObject.location.isNotEmpty &&
        registerClientObject.email.isNotEmpty &&
        registerClientObject.password.isNotEmpty &&
        registerClientObject.personalPhoto.path.isNotEmpty &&
        registerClientObject.personWithCard.path.isNotEmpty &&
        registerClientObject.idCardBackPhoto.path.isNotEmpty &&
        registerClientObject.idCardFrontPhoto.path.isNotEmpty;
  }

  validate() {
    inputAllInputsValid.add(null);
  }
}

abstract class RegisterClientViewModelInputs {
  Sink get inputUserName;
  Sink get inputEmail;
  Sink get inputLocation;
  Sink get inputPassword;
  Sink get inputPhoneNumber;
  Sink get inputIdCardBackPhoto;
  Sink get inputIdCardFrontPhoto;
  Sink get inputPersonalPhoto;
  Sink get inputPersonWithCard;
  Sink get inputAllInputsValid;

  setUserName(String userName);
  setCityId(String? cityId);
  setLocation(String location);
  setEmail(String email);
  setPassword(String password);
  setPhoneNumber(String phoneNumber);
  setIdCardBackPhoto(File idCardBackPhoto);
  setIdCardFrontPhoto(File idCardFrontPhoto);
  setPersonalPhoto(File personalPhoto);
  setPersonWithCard(File personWithCard);
  registerClient();
  getCity();
  getGovernment();
  setCurrentGovernId(String? value);
  getGovernmentList();
}

abstract class RegisterClientViewModelOutputs {
  Stream<bool> get outIsUserNameValid;
  Stream<String?> get outIsErrorUserName;
  Stream<bool> get outIsGovernIdValid;
  Stream<bool> get outIsEmailValid;
  Stream<String?> get outIsErrorEmail;
  Stream<bool> get outIsLocationValid;
  Stream<String?> get outIsErrorLocation;
  Stream<bool> get outIsPasswordValid;
  Stream<String?> get outIsErrorPassword;
  Stream<bool> get outIsPhoneNumberValid;
  Stream<String?> get outIsErrorPhoneNumber;
  Stream<File> get outIdCardBackPhoto;
  Stream<File> get outIdCardFrontPhoto;
  Stream<File> get outPersonalPhoto;
  Stream<File> get outPersonWithCard;
  Stream<bool> get outAreAllInputsValid;
}
