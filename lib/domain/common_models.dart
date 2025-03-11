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
