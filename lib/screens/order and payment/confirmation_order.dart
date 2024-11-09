import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/theme_model.dart';
import '../../widget/button.dart';

class ConfirmationOrder extends StatefulWidget {
  const ConfirmationOrder({super.key});

  @override
  State<ConfirmationOrder> createState() => _ConfirmationOrderState();
}

class _ConfirmationOrderState extends State<ConfirmationOrder> {
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: notifier.background,
      appBar: AppBar(
        backgroundColor: notifier.background,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Image.asset(
                "assets/icons/close_icon.png",
                width: width / 7.5,
                color: notifier.isDark ? Colors.white : null,
              ),
            ),
            SizedBox(width: width / 5.5),
            Text(
              "Confirmation Order",
              style: TextStyle(
                fontFamily: "Manrope_bold",
                fontWeight: FontWeight.w700,
                fontSize: 16,
                letterSpacing: 0.4,
                color: notifier.textColor,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: Container(
                  height: height / 4.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: notifier.textField, width: 0.9),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 50),
                          child: Text(
                            "Prototyping and Testing: Perfecting Your UI/UX Design",
                            style: TextStyle(
                              fontFamily: "Manrope_bold",
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.3,
                              color: notifier.textColor,
                            ),
                          ),
                        ),
                        SizedBox(height: height / 60),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/avatar.png",
                              height: height / 15,
                            ),
                            SizedBox(width: width / 35),
                            Text(
                              "Kierra Torff",
                              style: TextStyle(
                                fontFamily: "Manrope_bold",
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.2,
                                color: notifier.textColor,
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              "\$354.0",
                              style: TextStyle(
                                fontFamily: "Manrope_bold",
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.2,
                                color: Color(0xff0056D2),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: height / 25),
              Container(
                height: 10,
                width: double.infinity,
                color: notifier.containerDividedColor,
              ),
              SizedBox(height: height / 30),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: Text(
                  "Payment Method",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    fontFamily: "Manrope_bold",
                    letterSpacing: 0.2,
                    color: notifier.textColor,
                  ),
                ),
              ),
              SizedBox(height: height / 50),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: Container(
                  height: height / 8.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: notifier.textField, width: 0.9),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: notifier.paymentCardColor,
                            ),
                            child: Image.asset("assets/images/paypal.png",
                                scale: 1.8)),
                        SizedBox(width: width / 25),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Paypal",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                fontFamily: "Manrope_bold",
                                letterSpacing: 0.3,
                                color: notifier.textColor,
                              ),
                            ),
                            SizedBox(height: height / 80),
                            Text(
                              "4756**** **** 9018",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: "Manrope_bold",
                                letterSpacing: 0.2,
                                color: notifier.textColorGrey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: height / 25),
              Container(
                height: 10,
                width: double.infinity,
                color: notifier.containerDividedColor,
              ),
              SizedBox(height: height / 35),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: Text(
                  "Payment Summary",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    fontFamily: "Manrope_bold",
                    letterSpacing: 0.2,
                    color: notifier.textColor,
                  ),
                ),
              ),
              SizedBox(height: height / 50),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: Container(
                  height: height / 5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: notifier.textField, width: 0.9),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Price",
                              style: TextStyle(
                                fontFamily: "Manrope_bold",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.2,
                                color: notifier.textColorGrey,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "\$354.0",
                              style: TextStyle(
                                fontFamily: "Manrope_bold",
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.3,
                                color: notifier.textColor,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Promo",
                              style: TextStyle(
                                fontFamily: "Manrope_bold",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.2,
                                color: notifier.textColorGrey,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "- \$20",
                              style: TextStyle(
                                fontFamily: "Manrope_bold",
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.3,
                                color: notifier.textColor,
                              ),
                            ),
                          ],
                        ),
                        Divider(thickness: 2, color: notifier.textField),
                        Row(
                          children: [
                            Text(
                              "Total Payment",
                              style: TextStyle(
                                fontFamily: "Manrope_bold",
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.3,
                                color: notifier.textColor,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "\$354.0",
                              style: TextStyle(
                                fontFamily: "Manrope_bold",
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.3,
                                color: notifier.textColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        height: height / 8.2,
        width: double.infinity,
        color: notifier.bottomNavigationColor,
        child: button(
          text: "Pay \$354.0",
          color: const Color(0xff0056D2),
          onPress: () {
            Navigator.of(context).pushNamed("buy_success");
          },
        ),
      ),
    );
  }
}
