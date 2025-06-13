import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/app/di.dart';
import 'package:flutter_advanced_course/data/dummy_data/government_city.dart';
import 'package:flutter_advanced_course/presentation/common/auth/register/service_provider/view_model/register_provider_view_model.dart';
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

class RegisterProviderView extends StatefulWidget {
  const RegisterProviderView({super.key});

  @override
  State<RegisterProviderView> createState() => _RegisterProviderViewState();
}

class _RegisterProviderViewState extends State<RegisterProviderView> {
  final RegisterProviderViewModel _viewModel =
      instance<RegisterProviderViewModel>();
  final ImagePicker _imagePicker = instance<ImagePicker>();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _userNameEditingController =
      TextEditingController();
  final TextEditingController _hourPriceEditingController =
      TextEditingController();
  final TextEditingController _phoneNumberEditingController =
      TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  // نقل المتغيرات إلى مستوى الكلاس
  String? selectedGovernorate;
  String? selectedCity;
  bool _navigationInProgress = false;

  _bind() {
    _viewModel.start();
    _userNameEditingController.addListener(() {
      _viewModel.setUserName(_userNameEditingController.text);
    });
    _hourPriceEditingController.addListener(() {
      _viewModel.setHourePrice(_hourPriceEditingController.text);
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
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _userNameEditingController.dispose();
    _hourPriceEditingController.dispose();
    _phoneNumberEditingController.dispose();
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final rawArguments = ModalRoute.of(context)?.settings.arguments;

    // take args with null safety
    final arguments = ModalRoute.of(context)?.settings.arguments;
    final Map<String, dynamic> args = arguments != null
        ? arguments as Map<String, dynamic>
        : <String, dynamic>{};

    // serviceType as int with null safety - try both possible keys
    final int? serviceType = args['serviceType'] ?? args['service_type'];

    // the service type list
    final List<String> serviceTypes = [
      'Babysitter',
      'Petsitter',
      'Nurse',
      'HouseKeeper',
    ];

    // name of selected service with better debugging
    String selectedServiceName;
    if (serviceType != null &&
        serviceType >= 0 &&
        serviceType < serviceTypes.length) {
      selectedServiceName = serviceTypes[serviceType];
    } else {
      selectedServiceName = 'Service Provider';
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        title: 'Register as $selectedServiceName',
      ),
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data is ErrorState) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text((snapshot.data as ErrorState).message),
                    backgroundColor: ColorManager.error,
                  ),
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
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p20,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              //Logo
              Center(
                child: Image.asset(
                  ImageAssets.splashLogo,
                  width: 200,
                  height: 200,
                ),
              ),

              const SizedBox(height: 16),

              //name
              StreamBuilder<String?>(
                stream: _viewModel.outIsErrorUserName,
                builder: (context, snapshot) {
                  return CustomTextFormField(
                      hintText: AppStrings.name,
                      labelText: AppStrings.name,
                      textInputType: TextInputType.text,
                      controller: _userNameEditingController,
                      errorText: snapshot.data);
                },
              ),
              //Space
              const SizedBox(height: 8),
              // Mobile Number
              StreamBuilder<String?>(
                stream: _viewModel.outIsErrorPhoneNumber,
                builder: (context, snapshot) {
                  return CustomTextFormField(
                      hintText: AppStrings.mobileNumber,
                      labelText: AppStrings.mobileNumber,
                      textInputType: TextInputType.phone,
                      controller: _phoneNumberEditingController,
                      errorText: snapshot.data);
                },
              ),
              //Space
              const SizedBox(height: 8),
              //Email
              StreamBuilder<String?>(
                stream: _viewModel.outIsErrorEmail,
                builder: (context, snapshot) {
                  return CustomTextFormField(
                      hintText: AppStrings.email,
                      labelText: AppStrings.email,
                      textInputType: TextInputType.text,
                      controller: _emailEditingController,
                      errorText: snapshot.data);
                },
              ),
              //Space
              const SizedBox(height: 8),
              // Password
              StreamBuilder<String?>(
                stream: _viewModel.outIsErrorPassword,
                builder: (context, snapshot) {
                  return CustomTextFormField(
                      hintText: AppStrings.password,
                      labelText: AppStrings.password,
                      textInputType: TextInputType.text,
                      controller: _passwordEditingController,
                      errorText: snapshot.data);
                },
              ),
              //Space
              const SizedBox(height: 8),
              //Profile Picture
              _buildImagePickerContainer(
                AppStrings.profilePicture,
                _viewModel.outPersonalPhoto,
                () => _showPicker(context, "setPersonalPhoto"),
              ),

              //Space
              const SizedBox(height: 8),

              // person with card
              _buildImagePickerContainer(
                AppStrings.personWithCardPicture,
                _viewModel.outPersonWithCard,
                () => _showPicker(context, "setPersonWithCard"),
              ),

              const SizedBox(height: 8),
              //Front ID Picture
              _buildImagePickerContainer(
                AppStrings.frontIdPicture,
                _viewModel.outIdCardFrontPhoto,
                () => _showPicker(context, "setIdCardFrontPhoto"),
              ),
              //Space
              const SizedBox(height: 8),
              //Back ID Picture
              _buildImagePickerContainer(
                AppStrings.backIdPicture,
                _viewModel.outIdCardBackPhoto,
                () => _showPicker(context, "setIdCardBackPhoto"),
              ),
              //Space
              const SizedBox(height: 8),

              //Certification
              _buildImagePickerContainer(
                AppStrings.certification,
                _viewModel.outCertification,
                () => _showPicker(context, "setCertification"),
              ),

              //Space
              const SizedBox(height: 8),
              //Governorate
              // static for country
              const CustomStaticField(
                label: "Egypt",
              ),
              const SizedBox(height: 10),
              // Dropdown للمحافظة
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
              //Space
              const SizedBox(height: 8),
              //city
              // Dropdown للمدينة
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
              //Space
              const SizedBox(height: 8),
              //Price Per Hour
              StreamBuilder<String?>(
                stream: _viewModel.outIsErrorHourPrice,
                builder: (context, snapshot) {
                  return CustomTextFormField(
                      hintText: AppStrings.pricePerHour,
                      labelText: AppStrings.pricePerHour,
                      textInputType: TextInputType.text,
                      controller: _hourPriceEditingController,
                      errorText: snapshot.data);
                },
              ),
              //Space
              const SizedBox(height: 18),
              // button Register
              StreamBuilder<bool>(
                stream: _viewModel.outAreAllInputsValid,
                builder: (context, snapshot) {
                  return CustomButton(
                    onPressed: (snapshot.data ?? false)
                        ? () => _viewModel.registerProvider()
                        : null,
                    text: AppStrings.register,
                    backgroundColor: ColorManager.primary,
                  );
                },
              ),
              //space
              const SizedBox(height: 5),
              //Already have an account? Login
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
                  )
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
      padding:
          const EdgeInsets.only(left: AppPadding.p18, right: AppPadding.p18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              hint,
              style: TextStyle(
                color: ColorManager.grey1,
                fontSize: AppSize.s14,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.visible,
            ),
          ),
          Flexible(
            child: StreamBuilder<File>(
              stream: stream,
              builder: (context, snapshot) {
                final file = snapshot.data;
                if (file == null) {
                  return const Text("");
                } else {
                  final ext = file.path.split('.').last.toLowerCase();
                  if (['jpg', 'jpeg', 'png'].contains(ext)) {
                    return Image.file(file, fit: BoxFit.cover);
                  } else {
                    return const Row(
                      children: [
                        Icon(Icons.picture_as_pdf, color: Colors.red),
                        SizedBox(width: 8),
                        Text('PDF'),
                      ],
                    );
                  }
                }
              },
            ),
          ),
          Flexible(
            child: SvgPicture.asset(ImageAssets.photoCameraImage),
          ),
        ],
      ),
    );
  }

  _showPicker(BuildContext context, String typePicker) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              if (typePicker != "setCertification")
                ListTile(
                  trailing: const Icon(Icons.arrow_forward),
                  leading: const Icon(Icons.camera),
                  title: const Text(AppStrings.photoGallery),
                  onTap: () {
                    _imageFromGallery(typePicker);
                    Navigator.of(context).pop();
                  },
                ),
              if (typePicker != "setCertification")
                ListTile(
                  trailing: const Icon(Icons.arrow_forward),
                  leading: const Icon(Icons.camera_alt_outlined),
                  title: const Text(AppStrings.photoCamera),
                  onTap: () {
                    _imageFromCamera(typePicker);
                    Navigator.of(context).pop();
                  },
                ),
              if (typePicker == "setCertification")
                ListTile(
                  trailing: const Icon(Icons.arrow_forward),
                  leading: const Icon(Icons.folder),
                  title: const Text(AppStrings.file),
                  onTap: () {
                    _fileFromDevice(typePicker);
                    Navigator.of(context).pop();
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

  _fileFromDevice(String typePicker) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: false,
      );

      if (result != null &&
          result.files.single.path != null &&
          typePicker == "setCertification") {
        File selectedFile = File(result.files.single.path!);
        _viewModel.setCertification(selectedFile);
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("No file selected or wrong picker type"),
            backgroundColor: ColorManager.error,
          ),
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("erro selecting file: $e"),
          backgroundColor: ColorManager.error,
        ),
      );
    }
  }
}
