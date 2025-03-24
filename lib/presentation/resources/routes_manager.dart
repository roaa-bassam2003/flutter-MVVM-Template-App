import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/common/auth/forgot_password/forgot_password_view.dart';
import 'package:flutter_advanced_course/presentation/common/auth/login/login_view.dart';
import 'package:flutter_advanced_course/presentation/common/auth/pending_approval/pending_approval_view.dart';
import 'package:flutter_advanced_course/presentation/common/auth/register/register_provider_view.dart';
import 'package:flutter_advanced_course/presentation/common/auth/service_type/service_type_view.dart';
import 'package:flutter_advanced_course/presentation/common/auth/user_type/user_type_view.dart';
import 'package:flutter_advanced_course/presentation/common/onboarding/view/onboarding_view.dart';
import 'package:flutter_advanced_course/presentation/common/auth/register/register_user_view.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/service_provider/main/main_view.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/address_details/address_details_view.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/home/home_view.dart';
import 'package:flutter_advanced_course/presentation/common/splash/splash_view.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/service_providers/service_providers_view.dart';

import '../service_provider/day_specification/day_specification.dart';


class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerUserRoute = "/registerUser";
  static const String registerProviderRoute = "/registerProvider";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String onBoardingRoute = "/onBoarding";
  static const String userTypeRoute = "/userType";
  static const String serviceTypeRoute = "/serviceType";
  static const String pendingApprovalRoute = "/pendingApproval";
  static const String homeRoute = "/home";
  static const String addressDetailsRoute = "/addressDetails";
  static const String serviceProvidersRoute = "/serviceProviders";
}

class ProviderRoutes {
  static const String mainRoute = "/ProviderMainView";
  static const String daySpecification = "/daySpecification";
}

class SeekerRoutes {
  static const String mainRoute = "/HomeView";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      // common
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );
      case Routes.registerUserRoute:
        return MaterialPageRoute(
          builder: (_) => const RegisterUserView(),
        );
      case Routes.registerProviderRoute:
        return MaterialPageRoute(
          builder: (_) => const RegisterProviderView(),
        );
      case Routes.onBoardingRoute:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingView(),
        );
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordView(),
        );
      case Routes.userTypeRoute:
        return MaterialPageRoute(
          builder: (_) => const UserTypeView(),
        );
      case Routes.serviceTypeRoute:
        return MaterialPageRoute(
          builder: (_) => const ServiceTypeView(),
        );
      case Routes.pendingApprovalRoute:
        return MaterialPageRoute(
          builder: (_) => const PendingApprovalView(),
        );
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );

      case Routes.addressDetailsRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AddressDetailsView(),
        );

      case Routes.serviceProvidersRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ServiceProvidersView(),
        );

      // seeker
      case SeekerRoutes.mainRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );

      // provider
      case ProviderRoutes.mainRoute:
        return MaterialPageRoute(
          builder: (_) => const MainView(),
        );

        case ProviderRoutes.daySpecification:
        return MaterialPageRoute(
          builder: (_) => const DaySpecification(selectedDay: '',),
        );

      // default
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.noRouteFound,
          ),
        ),
        body: const Center(
          child: Text(
            AppStrings.noRouteFound,
          ),
        ),
      ),
    );
  }
}
