// ------------------Common----------------------
// onboarding models
class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

// carry data from view model(communicate with common_model) to view
class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SliderViewObject(
    this.sliderObject,
    this.numOfSlides,
    this.currentIndex,
  );
}

// Example in Dart-like syntax
class NotificationModel {
  final String title;
  final String message;
  final String category;
  final String name;
  final String? timer; // Optional, e.g., "60:00"
  final bool isApproved;
  final int cancelCount; // For tracking cancellations

  NotificationModel({
    required this.title,
    required this.message,
    required this.category,
    required this.name,
    this.timer,
    required this.isApproved,
    this.cancelCount = 0,
  });

  // Factory method to create from JSON (if needed)
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json['title'],
      message: json['message'],
      category: json['category'],
      name: json['name'],
      timer: json['timer'],
      isApproved: json['isApproved'],
      cancelCount: json['cancelCount'] ?? 0,
    );
  }
}

// ------------------Client----------------------
// login models
class Client {
  String id;
  String token;
  String tokenExpire;
  String userName;
  List<String> userType;

  Client(
    this.id,
    this.token,
    this.tokenExpire,
    this.userName,
    this.userType,
  );
}

class Authentication {
  Client? user;

  Authentication(
    this.user,
  );
}

// Register Service Provider
class RegisterServiceProvider {
  final int type;
  final String? certification;
  final int hourPrice;
  final String id;
  final String userNameId;
  final String userName;
  final String phoneNumber;
  final String email;
  final String personalPhoto;
  final String idCardFrontPhoto;
  final String idCardBackPhoto;
  final String city;
  final String government;

  RegisterServiceProvider({
    required this.type,
    required this.certification,
    required this.hourPrice,
    required this.id,
    required this.userNameId,
    required this.userName,
    required this.phoneNumber,
    required this.email,
    required this.personalPhoto,
    required this.idCardFrontPhoto,
    required this.idCardBackPhoto,
    required this.city,
    required this.government,
  });
}

class AuthenticationServiceProvider {
  RegisterServiceProvider? serviceProvider;

  AuthenticationServiceProvider(
    this.serviceProvider,
  );
}


// Register client
class RegisterClient {
  final String location;
  final String id;
  final String userNameId;
  final String userName;
  final String phoneNumber;
  final String email;
  final String personalPhoto;
  final String idCardFrontPhoto;
  final String idCardBackPhoto;
  final String city;
  final String government;

  RegisterClient({
    required this.location,
    required this.id,
    required this.userNameId,
    required this.userName,
    required this.phoneNumber,
    required this.email,
    required this.personalPhoto,
    required this.idCardFrontPhoto,
    required this.idCardBackPhoto,
    required this.city,
    required this.government,
  });
}

class AuthenticationClient {
  RegisterClient? client;

  AuthenticationClient(
    this.client,
  );
}


// governments
class GovernmentList {
  int id;
  String name;
  String cities;

  GovernmentList(
    this.id,
    this.name,
    this.cities,
  );
}

class Governments {
  List<GovernmentList>? governments;

  Governments(
    this.governments,
  );
}


// governments-cities
class CityList {
  int id;
  String name;
  String governorateId;
  String governorate;
  String users;

  CityList(
    this.id,
    this.name,
    this.governorateId,
    this.governorate,
    this.users,
  );
}

class Cities {
  List<CityList>? governmentsCities;

  Cities(
    this.governmentsCities,
  );
}


// ------------------Service Provider------------

class Service {
  final String name;
  final String imagePath;
  final List<Provider> providers;

  Service({
    required this.name,
    required this.imagePath,
    required this.providers,
  });
}

class Provider {
  final String providerId;
  final String name;
  final double rating;
  final double price;
  final String imagePath;
  final String role;
  final String location;
  final String? certification;
  final List<String> availableDays;
  final Map<String, List<String>> availableHours;
  Provider({
    this.certification,
    required this.availableHours,
    required this.providerId,
    required this.role,
    required this.location,
    required this.availableDays,
    required this.name,
    required this.rating,
    required this.price,
    required this.imagePath,
  });
}
