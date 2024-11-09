class OverviewModel {
  String image;
  String desc;

  OverviewModel({
    required this.image,
    required this.desc,
  });
}

List<OverviewModel> overview = [
  OverviewModel(
    image: "assets/icons/video-circle.png",
    desc: "1h 30m on-demand video",
  ),
  OverviewModel(
    image: "assets/icons/document-text.png",
    desc: "5 Curriculum",
  ),
  OverviewModel(
    image: "assets/icons/download.png",
    desc: "10 Downloadable resources",
  ),
  OverviewModel(
    image: "assets/icons/clock.png",
    desc: "Full lifetime access",
  ),
  OverviewModel(
    image: "assets/icons/medal-star.png",
    desc: "Certificate of completion",
  ),
  OverviewModel(
    image: "assets/icons/users.png",
    desc: "500+ Students",
  ),
];

class KeypointModel {
  String desc;

  KeypointModel({
    required this.desc,
  });
}

List<KeypointModel> keypoint = [
  KeypointModel(desc: "Understand the basics of Prototype & Animation"),
  KeypointModel(desc: "Understand the basics of MicroInteraction"),
  KeypointModel(desc: "Creating Animation (20 case studies) for mobile apps"),
  KeypointModel(desc: "Presenting designs using Animation"),
];
