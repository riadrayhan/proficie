import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/theme_model.dart';
import '../../widget/button.dart';

class SelectPayment extends StatefulWidget {
  const SelectPayment({super.key});

  @override
  State<SelectPayment> createState() => _SelectPaymentState();
}

class _SelectPaymentState extends State<SelectPayment> {
  int value = 0;
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
              "Select Payment",
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
        padding: const EdgeInsets.only(right: 15, left: 15, top: 8, bottom: 15),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Credit Card",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: "Manrope_bold",
                  letterSpacing: 0.2,
                  color: notifier.textColor,
                ),
              ),
              SizedBox(height: height / 25),
              paymentButton(
                text: "Add Payment Method",
                onPress: () {},
              ),
              SizedBox(height: height / 25),
              GestureDetector(
                onTap: () {
                  setState(() {
                    value = 0;
                  });
                },
                child: Container(
                  height: height / 8.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: value == 0
                            ? const Color(0xff0056D2)
                            : notifier.textField,
                        width: 1),
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
                          child: Image.asset(
                            "assets/images/master_card.png",
                            scale: 1.8,
                          ),
                        ),
                        SizedBox(width: width / 40),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Master Card",
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
                        const Spacer(),
                        radioButton(0),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: height / 25),
              GestureDetector(
                onTap: () {
                  setState(() {
                    value = 1;
                  });
                },
                child: Container(
                  height: height / 8.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: value == 1
                            ? const Color(0xff0056D2)
                            : notifier.textField,
                        width: 1),
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
                        SizedBox(width: width / 40),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                        const Spacer(),
                        radioButton(1),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: height / 25),
              GestureDetector(
                onTap: () {
                  setState(() {
                    value = 2;
                  });
                },
                child: Container(
                  height: height / 8.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: value == 2
                            ? const Color(0xff0056D2)
                            : notifier.textField,
                        width: 1),
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
                            child: Image.asset("assets/images/visa.png",
                                scale: 1.8)),
                        SizedBox(width: width / 40),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              " Visa",
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
                        const Spacer(),
                        radioButton(2),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              button(
                  text: "Confirmation",
                  color: const Color(0xff0056D2),
                  onPress: () {
                    Navigator.of(context).pushNamed("voucher_page");
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget paymentButton({required String text, void Function()? onPress}) {
    return DottedBorder(
      color: notifier.textField,
      borderType: BorderType.RRect,
      borderPadding: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      radius: const Radius.circular(32),
      child: SizedBox(
        height: 56,
        width: double.infinity,
        child: OutlinedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide.none,
              ),
            ),
          ),
          onPressed: onPress,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  color: Color(0xff64748B),
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Manrope_bold',
                  color: notifier.textColor,
                  letterSpacing: 0.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget radioButton(int index) {
    return SizedBox(
      height: 25,
      width: 25,
      child: OutlinedButton(
        onPressed: () {
          value = index;
          setState(() {});
        },
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            color: (value == index)
                ? const Color(0xff0056D2)
                : const Color(0xffE2E8F0),
            width: (value == index) ? 7 : 2,
          ),
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(0),
        ),
        child: const Text(""),
      ),
    );
  }
}
