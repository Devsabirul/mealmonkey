class OnboardingModel {
  String? title;
  String? description;
  String? image;

  OnboardingModel({this.title, this.description, this.image});
}

List<OnboardingModel> onboardingcontent = [
  OnboardingModel(
    title: "Find Food You Love",
    description:
        "Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep",
    image: "assets/images/1.png",
  ),
  OnboardingModel(
    title: "Fast Delivery",
    description: "Fast food delivery to your home, office wherever you are",
    image: "assets/images/2.png",
  ),
  OnboardingModel(
    title: "Live Tracking",
    description:
        "Real time tracking of your food on the app once you placed the order",
    image: "assets/images/3.png",
  ),
];
