import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/app/di.dart';
import 'package:flutter_advanced_course/data/dummy_data/government_city.dart';
import 'package:flutter_advanced_course/presentation/common/auth/register/client/view_model/register_client_view_model.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/report_provider/widgets/custom_static_field.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer_impl.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_drop_down_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_text_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter_advanced_course/presentation/resources/assets_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/scheduler.dart';

class RegisterUserView extends StatefulWidget {
  const RegisterUserView({super.key});

  @override
  State<RegisterUserView> createState() => _RegisterUserViewState();
}

class _RegisterUserViewState extends State<RegisterUserView> {
  final RegisterClientViewModel _viewModel =
      instance<RegisterClientViewModel>();
  final ImagePicker _imagePicker = instance<ImagePicker>();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _userNameEditingController =
      TextEditingController();
  final TextEditingController _locationEditingController =
      TextEditingController();
  final TextEditingController _phoneNumberEditingController =
      TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  String? selectedGovernorate;
  String? selectedCity;
  bool _navigationInProgress = false;

  void _bind() {
    _viewModel.start();

    _userNameEditingController.addListener(() {
      _viewModel.setUserName(_userNameEditingController.text);
    });

    _locationEditingController.addListener(() {
      _viewModel.setLocation(_locationEditingController.text);
    });

    _phoneNumberEditingController.addListener(() {
      _viewModel.setPhoneNumber(_phoneNumberEditingController.text);
    });

    _emailEditingController.addListener(() {
      _viewModel.setEmail(_emailEditingController.text);
    });

    _passwordEditingController.addListener(() {
      _viewModel.setPassword(_passwordEditingController.text);
    });

    _viewModel.isUserRegisterProviderSuccessfullyStreamController.stream
        .listen((isSuccess) {
      if (isSuccess && mounted && !_navigationInProgress) {
        _navigationInProgress = true;
        SchedulerBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            Navigator.of(context)
                .pushReplacementNamed(Routes.pendingApprovalRoute)
                .then((_) {
              _navigationInProgress = false;
            });
          }
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _userNameEditingController.dispose();
    _locationEditingController.dispose();
    _phoneNumberEditingController.dispose();
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        title: 'Register as Client',
      ),
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data is ErrorState) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text((snapshot.data as ErrorState).message)),
                );
              }
            });
          }
          return _getContentWidget();
        },
      ),
    );
  }

  Widget _getContentWidget() {
    List<String> cities = [];
    if (selectedGovernorate != null) {
      try {
        final governorateData = governoratesWithCities.firstWhere(
          (item) => item['governorate'] == selectedGovernorate,
        );
        cities = List<String>.from(governorateData['cities']);
      } catch (e) {
        cities = [];
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  ImageAssets.splashLogo,
                  width: 200,
                  height: 200,
                ),
              ),
              const SizedBox(height: 16),
              StreamBuilder<String?>(
                stream: _viewModel.outIsErrorUserName,
                builder: (context, snapshot) {
                  return CustomTextFormField(
                    hintText: AppStrings.name,
                    labelText: AppStrings.name,
                    textInputType: TextInputType.text,
                    controller: _userNameEditingController,
                    errorText: snapshot.data,
                  );
                },
              ),
              const SizedBox(height: 8),
              StreamBuilder<String?>(
                stream: _viewModel.outIsErrorPhoneNumber,
                builder: (context, snapshot) {
                  return CustomTextFormField(
                    hintText: AppStrings.mobileNumber,
                    labelText: AppStrings.mobileNumber,
                    textInputType: TextInputType.phone,
                    controller: _phoneNumberEditingController,
                    errorText: snapshot.data,
                  );
                },
              ),
              const SizedBox(height: 8),
              StreamBuilder<String?>(
                stream: _viewModel.outIsErrorEmail,
                builder: (context, snapshot) {
                  return CustomTextFormField(
                    hintText: AppStrings.email,
                    labelText: AppStrings.email,
                    textInputType: TextInputType.emailAddress,
                    controller: _emailEditingController,
                    errorText: snapshot.data,
                  );
                },
              ),
              const SizedBox(height: 8),
              StreamBuilder<String?>(
                stream: _viewModel.outIsErrorPassword,
                builder: (context, snapshot) {
                  return CustomTextFormField(
                    hintText: AppStrings.password,
                    labelText: AppStrings.password,
                    textInputType: TextInputType.visiblePassword,
                    controller: _passwordEditingController,
                    errorText: snapshot.data,
                  );
                },
              ),
              const SizedBox(height: 8),
              _buildImagePickerContainer(
                AppStrings.profilePicture,
                _viewModel.outPersonalPhoto,
                () => _showPicker(context, "setPersonalPhoto"),
              ),
              const SizedBox(height: 8),
              _buildImagePickerContainer(
                AppStrings.personWithCardPicture,
                _viewModel.outPersonWithCard,
                () => _showPicker(context, "setPersonWithCard"),
              ),
              const SizedBox(height: 8),
              _buildImagePickerContainer(
                AppStrings.frontIdPicture,
                _viewModel.outIdCardFrontPhoto,
                () => _showPicker(context, "setIdCardFrontPhoto"),
              ),
              const SizedBox(height: 8),
              _buildImagePickerContainer(
                AppStrings.backIdPicture,
                _viewModel.outIdCardBackPhoto,
                () => _showPicker(context, "setIdCardBackPhoto"),
              ),
              const SizedBox(height: 8),
              const CustomStaticField(label: "Egypt"),
              const SizedBox(height: 10),
              CustomDropdownButton(
                textColor: ColorManager.grey,
                backgroundColor: ColorManager.white,
                borderColor: ColorManager.lightGrey,
                hint: AppStrings.governorate,
                items: governoratesWithCities
                    .map((item) => item['governorate'] as String)
                    .toList(),
                selectedValue: selectedGovernorate,
                onChanged: (value) {
                  setState(() {
                    selectedGovernorate = value;
                    selectedCity = null;
                  });
                  if (value != null) {
                    _viewModel.setCurrentGovernId(value);
                  }
                },
              ),
              const SizedBox(height: 8),
              CustomDropdownButton(
                textColor: ColorManager.grey,
                backgroundColor: ColorManager.white,
                borderColor: ColorManager.lightGrey,
                hint: AppStrings.city,
                items: cities,
                selectedValue: selectedCity,
                onChanged: selectedGovernorate != null
                    ? (value) {
                        setState(() {
                          selectedCity = value;
                        });
                        if (value != null && cities.isNotEmpty) {
                          final cityIndex = cities.indexOf(value) + 1;
                          _viewModel.setCityId(cityIndex.toString());
                        }
                      }
                    : null,
              ),
              const SizedBox(height: 8),
              StreamBuilder<String?>(
                stream: _viewModel.outIsErrorLocation,
                builder: (context, snapshot) {
                  return CustomTextFormField(
                    hintText: AppStrings.location,
                    labelText: AppStrings.location,
                    textInputType: TextInputType.text,
                    controller: _locationEditingController,
                    errorText: snapshot.data,
                  );
                },
              ),
              const SizedBox(height: 18),
              StreamBuilder<bool>(
                stream: _viewModel.outAreAllInputsValid,
                builder: (context, snapshot) {
                  return CustomButton(
                    onPressed: (snapshot.data ?? false)
                        ? () => _viewModel.registerClient()
                        : null,
                    text: AppStrings.register,
                    backgroundColor: ColorManager.primary,
                  );
                },
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(AppStrings.alreadyHaveAccount),
                  CustomTextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.loginRoute);
                    },
                    text: AppStrings.login,
                    textColor: ColorManager.primary,
                  ),
                ],
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagePickerContainer(
      String hint, Stream<File> stream, VoidCallback onTap) {
    return Container(
      height: AppSize.s40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppPadding.p8),
        border: Border.all(color: ColorManager.lightGrey, width: 1.5),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: _getMediaWidget(hint, stream),
      ),
    );
  }

  Widget _getMediaWidget(String hint, Stream<File> stream) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              hint,
              style: TextStyle(
                color: ColorManager.grey1,
                fontSize: AppSize.s14,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 2,
            child: StreamBuilder<File>(
              stream: stream,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.path.isNotEmpty) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.file(
                      snapshot.data!,
                      height: 30,
                      width: 30,
                      fit: BoxFit.cover,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
          SvgPicture.asset(
            ImageAssets.photoCameraImage,
            height: 24,
            width: 24,
          ),
        ],
      ),
    );
  }

  void _showPicker(BuildContext context, String typePicker) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text(AppStrings.photoGallery),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.of(context).pop();
                  _imageFromGallery(typePicker);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text(AppStrings.photoCamera),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.of(context).pop();
                  _imageFromCamera(typePicker);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _imageFromGallery(String typePicker) async {
    try {
      final XFile? image =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null && mounted) {
        _handleImageSelection(typePicker, File(image.path));
      }
    } catch (e) {
      debugPrint('Error picking image from gallery: $e');
    }
  }

  Future<void> _imageFromCamera(String typePicker) async {
    try {
      final XFile? image =
          await _imagePicker.pickImage(source: ImageSource.camera);
      if (image != null && mounted) {
        _handleImageSelection(typePicker, File(image.path));
      }
    } catch (e) {
      debugPrint('Error picking image from camera: $e');
    }
  }

  void _handleImageSelection(String typePicker, File imageFile) {
    switch (typePicker) {
      case "setPersonalPhoto":
        _viewModel.setPersonalPhoto(imageFile);
        break;
      case "setPersonWithCard":
        _viewModel.setPersonWithCard(imageFile);
        break;
      case "setIdCardBackPhoto":
        _viewModel.setIdCardBackPhoto(imageFile);
        break;
      case "setIdCardFrontPhoto":
        _viewModel.setIdCardFrontPhoto(imageFile);
        break;
      default:
        debugPrint('Unknown picker type: $typePicker');
    }
  }
}
