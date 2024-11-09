class NotificationModel {
  String image;
  String name;
  String desc;
  String status;

  NotificationModel({
    required this.image,
    required this.name,
    required this.desc,
    required this.status,
  });
}

List<NotificationModel> notification = [
  NotificationModel(
    image: "assets/icons/business.png",
    name: "New Course",
    desc: "Brian tylor added new course. Check this ...",
    status: "Now",
  ),
  NotificationModel(
    image: "assets/images/message_1.png",
    name: "Emery Korsgard",
    desc: "You have new message from emery",
    status: "13:00 PM",
  ),
  NotificationModel(
    image: "assets/images/message_2.png",
    name: "Marilyn George",
    desc: "You have new message from marilyn",
    status: "13:00 PM",
  ),
  NotificationModel(
    image: "assets/icons/business.png",
    name: "My Course",
    desc: "Come on other course modules have been wa...",
    status: "12:50 PM",
  ),
  NotificationModel(
    image: "assets/images/message_4.png",
    name: "Jaylon Dias",
    desc: "You have new message from emery",
    status: "Jan 20",
  ),
  NotificationModel(
    image: "assets/icons/business.png",
    name: "My Course",
    desc: "Come on other course modules have been wa...",
    status: "12:50 PM",
  ),
  NotificationModel(
    image: "assets/images/message_1.png",
    name: "My Course",
    desc: "Come on other course modules have been wa...",
    status: "Jan 29",
  ),
  NotificationModel(
    image: "assets/images/message_2.png",
    name: "Marilyn George",
    desc: "You have new message from marilyn",
    status: "Jan 23",
  ),
  NotificationModel(
    image: "assets/images/message_3.png",
    name: "James Geidt",
    desc: "You have new message from emery",
    status: "Jan 11",
  ),
  NotificationModel(
    image: "assets/images/message_4.png",
    name: "Jaylon Dias",
    desc: "You have new message from emery",
    status: "Jan 20",
  ),
  // NotificationModel(image: "image", name: "name", desc: "desc", status: "status"),
];
