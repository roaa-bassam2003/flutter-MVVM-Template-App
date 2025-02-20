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