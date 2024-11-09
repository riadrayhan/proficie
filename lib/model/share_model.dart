class ShareModel {
  String image;
  String firstName;
  String lastName;
  String icon;
  String text;

  ShareModel({
    required this.image,
    required this.firstName,
    required this.lastName,
    required this.icon,
    required this.text,
  });
}

List<ShareModel> share = [
  ShareModel(
    image: "assets/images/share_1.png",
    firstName: "Makenna",
    lastName: "Mango",
    icon: "assets/images/message_share_1.png",
    text: "Message",
  ),
  ShareModel(
    image: "assets/images/share_2.png",
    firstName: "Skylar",
    lastName: "Septimus",
    icon: "assets/images/mail_share_2.png",
    text: "Mail",
  ),
  ShareModel(
    image: "assets/images/share_3.png",
    firstName: "Cooper",
    lastName: "Philips",
    icon: "assets/images/whatsapp_share_3.png",
    text: "Whatsapp",
  ),
  ShareModel(
    image: "assets/images/share_4.png",
    firstName: "Carter",
    lastName: "Vetrovs",
    icon: "assets/images/instagram_share_4.png",
    text: "Instagram",
  ),
  ShareModel(
    image: "assets/images/share_1.png",
    firstName: "Makenna",
    lastName: "Mango",
    icon: "assets/images/message_share_1.png",
    text: "Message",
  ),
  ShareModel(
    image: "assets/images/share_3.png",
    firstName: "Cooper",
    lastName: "Philips",
    icon: "assets/images/whatsapp_share_3.png",
    text: "Whatsapp",
  ),

];
