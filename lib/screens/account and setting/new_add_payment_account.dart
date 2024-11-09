import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/theme_model.dart';
import '../../widget/button.dart';

class NewAddPayment extends StatefulWidget {
  const NewAddPayment({super.key});

  @override
  State<NewAddPayment> createState() => _NewAddPaymentState();
}

class _NewAddPaymentState extends State<NewAddPayment> {

  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
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
              "Add Payment Account",
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset("assets/images/card.png"),
                  Positioned(
                    left: 55,
                    top: 55,
                    bottom: 55,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Elon Musk",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Manrope_bold",
                            fontSize: 14,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          "Master Card",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Manrope_bold",
                            letterSpacing: 0.3,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: height / 90),
                        const Text(
                          "4756 **** **** 9018",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Manrope_bold",
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: height / 90),
                        Row(
                          children: [
                            const Text(
                              "\$3.469.52",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Manrope_bold",
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(width: width / 2.9),
                            Image.asset(
                              "assets/images/MASTERCARD - WHITE LOGO - STYLE 1.png",
                              scale: 3,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
               Text(
                "Full Name",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Manrope_semibold",
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.3,
                  color: notifier.textColor,
                ),
              ),
              SizedBox(height: height / 60),
              Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: notifier.textField,
                    width: 1,
                  ),
                ),
                child: TextField(
                  style: TextStyle(
                    fontFamily: 'Manrope_bold',
                    fontSize: 14,
                    color: notifier.textColor,
                    fontWeight: FontWeight.w500,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(18),
                    hintText: "Pristia Candra",
                    hintStyle: TextStyle(
                      fontFamily: 'Manrope_mediumbold',
                      fontSize: 14,
                      color: notifier.textColor,
                      fontWeight: FontWeight.w500,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: height / 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                        "Expiration",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Manrope_semibold",
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.3,
                          color: notifier.textColor,
                        ),
                      ),
                      SizedBox(height: height / 60),
                      textFieldExpiration(
                        text: "12/23",
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "CCV",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Manrope_semibold",
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.3,
                          color: Color(0xff0F172A),
                        ),
                      ),
                      SizedBox(height: height / 60),
                      textFieldExpiration(
                        text: "8974",
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: height / 60),
               Text(
                "Card Number",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Manrope_semibold",
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.3,
                  color: notifier.textColor,
                ),
              ),
              SizedBox(height: height / 60),
              Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: notifier.textField,
                    width: 1,
                  ),
                ),
                child: TextField(
                  style: TextStyle(
                    fontFamily: 'Manrope_bold',
                    fontSize: 14,
                    color: notifier.textColor,
                    fontWeight: FontWeight.w500,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(18),
                    hintText: "4756 9018",
                    hintStyle: TextStyle(
                      fontFamily: 'Manrope_mediumbold',
                      fontSize: 14,
                      color: notifier.textColor,
                      fontWeight: FontWeight.w500,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: height / 10),
              button(
                text: "Save",
                color: const Color(0xff0056D2),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textFieldExpiration({required String text}) {
    return Container(
      height: 57,
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: notifier.textField,
          width: 1,
        ),
      ),
      child: TextField(
        style: TextStyle(
          fontFamily: 'Manrope_bold',
          fontSize: 14,
          color: notifier.textColor,
          fontWeight: FontWeight.w500,
        ),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(18),
          hintText: text,
          hintStyle: TextStyle(
            fontFamily: 'Manrope_mediumbold',
            fontSize: 14,
            color: notifier.textColor,
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
