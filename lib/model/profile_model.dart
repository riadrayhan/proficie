class ProfileDetails {
  String icon;
  String name;
  String desc;

  ProfileDetails({
    required this.icon,
    required this.name,
    required this.desc,
  });
}

List<ProfileDetails> profileDetails = [
  ProfileDetails(
    icon: "assets/icons/profile_1.png",
    name: "Detail Profile",
    desc: "Information account",
  ),
  ProfileDetails(
    icon: "assets/icons/profile_2.png",
    name: "Identify",
    desc: "Verification status setting",
  ),
  ProfileDetails(
    icon: "assets/icons/profile_3.png",
    name: "Transaction History",
    desc: "Your transaction history",
  ),
  ProfileDetails(
    icon: "assets/icons/profile_4.png",
    name: "Payment Account",
    desc: "Manage your payment",
  ),
];
