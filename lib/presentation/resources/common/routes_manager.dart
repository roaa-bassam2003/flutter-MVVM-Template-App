import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/common/auth/forgot_password/forgot_password_view.dart';
import 'package:flutter_advanced_course/presentation/common/auth/login/login_view.dart';
import 'package:flutter_advanced_course/presentation/common/auth/pending_approval/pending_approval_view.dart';
import 'package:flutter_advanced_course/presentation/common/auth/register/register_provider_view.dart';
import 'package:flutter_advanced_course/presentation/common/auth/service_type/service_type_view.dart';
import 'package:flutter_advanced_course/presentation/common/auth/user_type/user_type_view.dart';
import 'package:flutter_advanced_course/presentation/common/onboarding/view/onboarding_view.dart';
import 'package:flutter_advanced_course/presentation/common/auth/register/register_user_view.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/home/home_view.dart';
import 'package:flutter_advanced_course/presentation/resources/common/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/common/splash/splash_view.dart';
import 'package:flutter_advanced_course/presentation/service_provider/main/main_view.dart';

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
}

class ProviderRoutes {
  static const String mainRoute = "/ProviderMainView";
}

class SeekerRoutes {
  static const String mainRoute = "/SeekerMainView";
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

      // seeker
      case SeekerRoutes.mainRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );

      // provider
      case ProviderRoutes.mainRoute:
        return MaterialPageRoute(
          builder: (_) => const ProviderMainView(),
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
