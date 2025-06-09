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


// governments-cities
class GovernmentList {
  int id;
  String governorate;
  List<String> cities;

  GovernmentList(
    this.id,
    this.governorate,
    this.cities,
  );
}

class Governments {
  GovernmentList? governmentsCities;

  Governments(
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
