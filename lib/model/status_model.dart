class StatusModel {
  String image;
  String name;
  String time;
  String request;

  StatusModel({
    required this.image,
    required this.name,
    required this.time,
    required this.request
  });
}

List<StatusModel> model = [
  StatusModel(
    image: "assets/images/message_4.png",
    name: "Corey Curtis",
    time: "Sent on 26 Jan 2023",
    request: "Accepted",
  ),
  StatusModel(
    image: "assets/images/message_3.png",
    name: "Craig Mango",
    time: "Sent on 26 Jan 2023",
    request: "Waiting",
  ),
  StatusModel(
    image: "assets/images/message_4.png",
    name: "Phillip Herwitz",
    time: "Sent on 26 Jan 2023",
    request: "Accepted",
  ),
  StatusModel(
    image: "assets/images/message_3.png",
    name: "Miracle George",
    time: "Sent on 26 Jan 2023",
    request: "Waiting",
  ),
  StatusModel(
    image: "assets/images/message_4.png",
    name: "Giana Baptista",
    time: "Sent on 26 Jan 2023",
    request: "Accepted",
  ),
  StatusModel(
    image: "assets/images/message_3.png",
    name: "Carla Franci",
    time: "Sent on 26 Jan 2023",
    request: "Waiting",
  ),
  StatusModel(
    image: "assets/images/message_4.png",
    name: "Davis Kenter",
    time: "Sent on 26 Jan 2023",
    request: "Accepted",
  ),
];
