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
        .listen((isLoggedIn) {
      if (isLoggedIn) {
        // navigate to main screen
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context)
              .pushReplacementNamed(Routes.pendingApprovalRoute);
        });
      }
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
    setState(() {});
  }

  @override
  void dispose() {
    _viewModel.dispose();
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
            return snapshot.data?.getScreenWidget(
                  context,
                  _getContentWidget(),
                  () {
                    _viewModel.registerProvider();
                  },
                ) ??
                _getContentWidget();
          }),
    );
  }

  Widget _getContentWidget() {
    List<String> cities = [];

    if (selectedGovernorate != null) {
      final governorateData = governoratesWithCities
          .firstWhere((item) => item['governorate'] == selectedGovernorate);
      cities = List<String>.from(governorateData['cities']);
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
              Container(
                height: AppSize.s40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppPadding.p8),
                  border: Border.all(color: ColorManager.lightGrey, width: 1.5),
                ),
                child: GestureDetector(
                  child: _getMediaWidget(
                      AppStrings.profilePicture, _viewModel.outPersonalPhoto),
                  onTap: () {
                    _showPicker(context, "setPersonalPhoto");
                  },
                ),
              ),

              //Space
              const SizedBox(height: 8),

              // person with card
              Container(
                height: AppSize.s40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppPadding.p8),
                  border: Border.all(color: ColorManager.lightGrey),
                ),
                child: GestureDetector(
                  child: _getMediaWidget(AppStrings.personWithCardPicture,
                      _viewModel.outPersonWithCard),
                  onTap: () {
                    _showPicker(context, "setPersonWithCard");
                  },
                ),
              ),

              const SizedBox(height: 8),
              //Front ID Picture
              Container(
                height: AppSize.s40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppPadding.p8),
                  border: Border.all(color: ColorManager.lightGrey),
                ),
                child: GestureDetector(
                  child: _getMediaWidget(AppStrings.frontIdPicture,
                      _viewModel.outIdCardFrontPhoto),
                  onTap: () {
                    _showPicker(context, "setIdCardFrontPhoto");
                  },
                ),
              ),
              //Space
              const SizedBox(height: 8),
              //Back ID Picture
              Container(
                height: AppSize.s40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppPadding.p8),
                  border: Border.all(color: ColorManager.lightGrey),
                ),
                child: GestureDetector(
                  child: _getMediaWidget(
                      AppStrings.backIdPicture, _viewModel.outIdCardBackPhoto),
                  onTap: () {
                    _showPicker(context, "setIdCardBackPhoto");
                  },
                ),
              ),
              //Space
              const SizedBox(height: 8),
              //Certification
              Container(
                height: AppSize.s40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppPadding.p8),
                  border: Border.all(color: ColorManager.lightGrey),
                ),
                child: GestureDetector(
                  child: _getMediaWidget(
                      AppStrings.certification, _viewModel.outCertification),
                  onTap: () {
                    _showPicker(context, "setCertification");
                  },
                ),
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
                    _viewModel.setCurrentGovernId(selectedGovernorate);
                  });
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
                          _viewModel.setCityId(selectedCity);
                        });
                      }
                    : null, // تعطيل المدينة إذا لم يتم اختيار محافظة
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
                          ? () {
                              _viewModel.registerProvider();
                            }
                          : null,
                      text: AppStrings.register,
                      backgroundColor: ColorManager.primary,
                    );
                  }),
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

  _imageFromGallery(String typePicker) async {
    var image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (typePicker == "setPersonalPhoto") {
      _viewModel.setPersonalPhoto(File(image?.path ?? ""));
    } else if (typePicker == "setPersonWithCard") {
      _viewModel.setPersonWithCard(File(image?.path ?? ""));
    } else if (typePicker == "setIdCardBackPhoto") {
      _viewModel.setIdCardBackPhoto(File(image?.path ?? ""));
    } else if (typePicker == "setIdCardFrontPhoto") {
      _viewModel.setIdCardFrontPhoto(File(image?.path ?? ""));
    }
  }

  _imageFromCamera(String typePicker) async {
    var image = await _imagePicker.pickImage(source: ImageSource.camera);

    if (typePicker == "setPersonalPhoto") {
      _viewModel.setPersonalPhoto(File(image?.path ?? ""));
    } else if (typePicker == "setPersonWithCard") {
      _viewModel.setPersonWithCard(File(image?.path ?? ""));
    } else if (typePicker == "setIdCardBackPhoto") {
      _viewModel.setIdCardBackPhoto(File(image?.path ?? ""));
    } else if (typePicker == "setIdCardFrontPhoto") {
      _viewModel.setIdCardFrontPhoto(File(image?.path ?? ""));
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
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text("No file selected or wrong picker type")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("erro selecting file: $e")),
      );
    }
  }
}
