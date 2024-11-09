class Payment {
  String image;
  String card;
  String number;

  Payment({
    required this.card,
    required this.number,
    required this.image,
  });
}

List<Payment> payment = [
  Payment(
    image: "assets/images/master_card.png",
    card: "Master Card",
    number: "4756 **** **** 9018",
  ),
  Payment(
    image: "assets/images/paypal.png",
    card: "Paypal",
    number: "4756 **** **** 9018",
  ),
];
