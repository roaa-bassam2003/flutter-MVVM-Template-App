import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/common/about_app/about_app_view.dart';
import 'package:flutter_advanced_course/presentation/common/auth/change_password/change_password_view.dart';
import 'package:flutter_advanced_course/presentation/common/auth/forgot_password/forgot_password_view.dart';
import 'package:flutter_advanced_course/presentation/common/auth/login/login_view.dart';
import 'package:flutter_advanced_course/presentation/common/auth/pending_approval/pending_approval_view.dart';
import 'package:flutter_advanced_course/presentation/common/auth/register/register_provider_view.dart';
import 'package:flutter_advanced_course/presentation/common/auth/service_type/service_type_view.dart';
import 'package:flutter_advanced_course/presentation/common/auth/user_type/user_type_view.dart';
import 'package:flutter_advanced_course/presentation/common/delete_account/delete_account_view.dart';
import 'package:flutter_advanced_course/presentation/common/edit_profile/edit_profile_view.dart';
import 'package:flutter_advanced_course/presentation/common/logout/logout_view.dart';
import 'package:flutter_advanced_course/presentation/common/onboarding/view/onboarding_view.dart';
import 'package:flutter_advanced_course/presentation/common/auth/register/register_user_view.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/service_provider/day_specification/day_specification.dart';
import 'package:flutter_advanced_course/presentation/service_provider/main/main_view.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/address_details/address_details_view.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/book_hours_provider/book_hours_provider_view.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/cancelled_bookings/cancelled_bookings_view.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/completed_bookings/completed_bookings_view.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/current_bookings/current_bookings_view.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/home/home_view.dart';
import 'package:flutter_advanced_course/presentation/common/splash/splash_view.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/my_info/my_info_view.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/payment/payment_view.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/provider_profile/provider_profile_view.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/rate_provider/rate_provider_view.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/report_provider/report_provider_view.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/requested_bookings/requested_bookings_view.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/search/search_view.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/service_providers/service_providers_view.dart';

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
  static const String searchRoute = "/search";
  static const String providerProfileRoute = "/providerProfile";
  static const String rateProviderRoute = "/rateProvider";
  static const String reportProviderRoute = "/reportProvider";
  static const String bookHoursProviderRoute = "/bookHoursProvider";
  static const String paymentRoute = "/payment";

  // Profile routes
  static const String myInfoRoute = "/myInfo";
  static const String requestedBookingsRoute = "/requestedBookings";
  static const String currentBookingsRoute = "/currentBookings";
  static const String cancelledBookingsRoute = "/cancelledBookings";
  static const String completedBookingsRoute = "/completedBookings";

  // Account management routes
  static const String logoutRoute = "/logout";
  static const String deleteAccountRoute = "/deleteAccount";
  static const String changePasswordRoute = "/changePassword";
  static const String editProfileRoute = "/editProfile";
  // About & Information routes
  static const String aboutMagicParentsRoute = "/aboutMagicParents";
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

      case Routes.searchRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SearchView(),
        );

      case Routes.providerProfileRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ProviderProfileView(),
        );
      case Routes.rateProviderRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RateProviderView(),
        );
      case Routes.reportProviderRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ReportProviderView(),
        );
      case Routes.bookHoursProviderRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const BookHoursProviderView(),
        );
      case Routes.paymentRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const PaymentView(),
        );
      // Profile routes
      case Routes.myInfoRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MyInfoView(),
        );
      case Routes.requestedBookingsRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RequestedBookingsView(),
        );
      case Routes.currentBookingsRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const CurrentBookingsView(),
        );
      case Routes.cancelledBookingsRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const CancelledBookingsView(),
        );
      case Routes.completedBookingsRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const CompletedBookingsView(),
        );

      // Account management routes
      case Routes.logoutRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LogoutView(),
        );
      case Routes.deleteAccountRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const DeleteAccountView(),
        );
      case Routes.changePasswordRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ChangePasswordView(),
        );
      case Routes.editProfileRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const EditProfileView(),
        );
      // About & Information routes
      case Routes.aboutMagicParentsRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AboutAppView(),
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
          builder: (_) => const DaySpecification(
            selectedDay: '',
          ),
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
