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
    final arguments = ModalRoute.of(context)?.settings.arguments;
    final Map<String, dynamic> args = arguments != null
        ? arguments as Map<String, dynamic>
        : <String, dynamic>{};

    final int? serviceType = args['serviceType'] ?? args['service_type'];

    final List<String> serviceTypes = [
      'Babysitter',
      'Petsitter',
      'Nurse',
      'HouseKeeper',
    ];

    String selectedServiceName;
    if (serviceType != null &&
        serviceType >= 0 &&
        serviceType < serviceTypes.length) {
      selectedServiceName = serviceTypes[serviceType];
      _viewModel.setType(serviceType);
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
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p20,
      ),
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
                      errorText: snapshot.data);
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
                      errorText: snapshot.data);
                },
              ),
              const SizedBox(height: 8),
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
              const SizedBox(height: 8),
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
              _buildImagePickerContainer(
                AppStrings.certification,
                _viewModel.outCertification,
                () => _showPicker(context, "setCertification"),
              ),
              const SizedBox(height: 8),
              const CustomStaticField(
                label: "Egypt",
              ),
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
                    selectedCity = null; // Reset city when governorate changes
                  });
                  if (value != null) {
                    try {
                      final governIndex = governoratesWithCities.indexWhere(
                          (element) => element['governorate'] == value);
                      if (governIndex != -1) {
                        _viewModel.setCurrentGovernId(governIndex.toString());
                      } else {
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  const Text("Invalid governorate selected"),
                              backgroundColor: ColorManager.error,
                            ),
                          );
                        }
                      }
                    } catch (e) {
                      debugPrint('Error setting governorate: $e');
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Error setting governorate: $e"),
                            backgroundColor: ColorManager.error,
                          ),
                        );
                      }
                    }
                  }
                },
              ),
              const SizedBox(height: 8),
              CustomDropdownButton(
                textColor: ColorManager.grey,
                backgroundColor: ColorManager.white,
                borderColor: ColorManager.lightGrey,
                hint: AppStrings.city,
                items: _getCitiesForSelectedGovernorate(),
                selectedValue: selectedCity,
                onChanged: selectedGovernorate != null
                    ? (value) {
                        setState(() {
                          selectedCity = value;
                        });
                        if (value != null) {
                          try {
                            // Find the selected governorate
                            Map<String, dynamic>? selectedGov;
                            for (var item in governoratesWithCities) {
                              if (item['governorate'] == selectedGovernorate) {
                                selectedGov = item;
                                break;
                              }
                            }

                            if (selectedGov != null) {
                              final cities =
                                  selectedGov['cities'] as List<dynamic>;
                              Map<String, dynamic>? cityObj;

                              // Find the selected city
                              for (var c in cities) {
                                if (c is Map<String, dynamic> &&
                                    c['name'] == value) {
                                  cityObj = c;
                                  break;
                                }
                              }

                              if (cityObj != null) {
                                final cityId = cityObj['id'] as int;
                                debugPrint('Selected city ID: $cityId');
                                _viewModel.setCityID(cityId);
                              } else {
                                if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          const Text("Invalid city selected"),
                                      backgroundColor: ColorManager.error,
                                    ),
                                  );
                                }
                              }
                            } else {
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text(
                                        "Invalid governorate selected"),
                                    backgroundColor: ColorManager.error,
                                  ),
                                );
                              }
                            }
                          } catch (e) {
                            debugPrint('Error setting city: $e');
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Error setting city: $e"),
                                  backgroundColor: ColorManager.error,
                                ),
                              );
                            }
                          }
                        }
                      }
                    : null,
              ),
              const SizedBox(height: 8),
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
              const SizedBox(height: 18),
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

  List<String> _getCitiesForSelectedGovernorate() {
    if (selectedGovernorate == null) return [];

    try {
      Map<String, dynamic>? governorateData;
      for (var item in governoratesWithCities) {
        if (item['governorate'] == selectedGovernorate) {
          governorateData = item;
          break;
        }
      }

      if (governorateData != null) {
        final cities = governorateData['cities'] as List<dynamic>;
        return cities
            .where((city) => city is Map<String, dynamic>)
            .map<String>((city) => city['name'] as String)
            .toList();
      }

      return [];
    } catch (e) {
      debugPrint('Error getting cities: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error getting cities: $e"),
            backgroundColor: ColorManager.error,
          ),
        );
      }
      return [];
    }
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
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error picking image: $e"),
            backgroundColor: ColorManager.error,
          ),
        );
      }
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
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error picking image: $e"),
            backgroundColor: ColorManager.error,
          ),
        );
      }
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

  Future<void> _fileFromDevice(String typePicker) async {
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
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("No file selected or wrong picker type"),
              backgroundColor: ColorManager.error,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error selecting file: $e"),
            backgroundColor: ColorManager.error,
          ),
        );
      }
    }
  }
}
