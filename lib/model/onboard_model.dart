class OnBoarding {
  final String title;
  final String image;
  final String desc;

  OnBoarding({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnBoarding> contents = [
  OnBoarding(
    title: "Best online courses in the world",
    image: "assets/images/onboarding 1.png",
    desc: "Now you can learn anywhere, anytime, even if there is no internet access!",
  ),
  OnBoarding(
    title: "Meet the professional mentor",
    image: "assets/images/onboarding 2.png",
    desc:
    "With our mentors, you will able to learn from real-world experience",
  ),
  OnBoarding(
    title: "Explore your new skill today",
    image: "assets/images/onboarding 3.png",
    desc:
    "Our platform is designed to help you explore new skills. Let's learn & grow with SkillMaster!",
  ),
];