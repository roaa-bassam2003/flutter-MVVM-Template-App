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
  String name;
  String userName;

  Client(
    this.id,
    this.name,
    this.userName,
  );
}

class Address {
  String country;
  String government;
  String city;
  String currentAddress;

  Address(
    this.country,
    this.government,
    this.city,
    this.currentAddress,
  );
}

class Information {
  Address? address;
  String email;
  String phone;
  String photo;

  Information(
    this.address,
    this.email,
    this.phone,
    this.photo,
  );
}

class Authentication {
  Client? user;
  Information? information;

  Authentication(
    this.user,
    this.information,
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
  final String name;
  final double rating;
  final double price;
  final String imagePath;

  Provider({
    required this.name,
    required this.rating,
    required this.price,
    required this.imagePath,
  });
}
