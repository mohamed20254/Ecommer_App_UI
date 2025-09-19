class OnbordingModel {
  final String title, description, image;

  OnbordingModel({
    required this.title,
    required this.description,
    required this.image,
  });
}

List<OnbordingModel> onbordingList = [
  OnbordingModel(
    title: "Welcome to ShopEasy",
    description: "Discover thousands of products at the best prices.",
    image: "assets/images/intro.png",
  ),
  OnbordingModel(
    title: "Fast & Secure Payment",
    description: "Pay easily with credit card, wallet, or cash on delivery.",
    image: "assets/images/intro1.png",
  ),
  OnbordingModel(
    title: "Quick Delivery",
    description: "Get your orders delivered at your doorstep within hours.",
    image: "assets/images/intro2.png",
  ),
];
