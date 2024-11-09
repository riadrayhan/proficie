import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/theme_model.dart';
import '../../widget/button.dart';

class BuyCourseDetail extends StatefulWidget {
  const BuyCourseDetail({super.key});

  @override
  State<BuyCourseDetail> createState() => _BuyCourseDetailState();
}

class _BuyCourseDetailState extends State<BuyCourseDetail> {
  bool isSwitch = false;
  int value = 0;
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: notifier.background,
      resizeToAvoidBottomInset: false,
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
              "Enroll Course",
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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 15),
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
                      border: Border.all(color: notifier.textField, width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 50),
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
                SizedBox(height: height / 15),
                Container(
                  height: 10,
                  width: double.infinity,
                  color: notifier.containerDividedColor,
                ),
                SizedBox(height: height / 25),
                Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("voucher_page");
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/voucher_icon.png",
                          scale: 2.4,
                        ),
                        SizedBox(width: width / 25),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Voucher",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: notifier.textColor,
                                fontFamily: "Manrope_bold",
                                letterSpacing: 0.3,
                              ),
                            ),
                            SizedBox(height: height / 100),
                            Text(
                              "Choose voucher",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: notifier.textColorGrey,
                                fontFamily: "Manrope_semibold",
                                letterSpacing: 0.2,
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: notifier.textColorGrey,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height / 35),
                Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/reedem_icon.png",
                        scale: 2.4,
                      ),
                      SizedBox(width: width / 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Redeem Eduline Coin",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: notifier.textColor,
                              fontFamily: "Manrope_bold",
                              letterSpacing: 0.3,
                            ),
                          ),
                          SizedBox(height: height / 100),
                          Text(
                            "1200 Coin",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: notifier.textColorGrey,
                              fontFamily: "Manrope_semibold",
                              letterSpacing: 0.2,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      CupertinoSwitch(
                        activeColor: const Color(0xff0056D2),
                        value: isSwitch,
                        onChanged: (val) {
                          isSwitch = val;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height / 25),
                Container(
                  height: 10,
                  width: double.infinity,
                  color: notifier.containerDividedColor,
                ),
                SizedBox(height: height / 25),
                Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15),
                  child: Text(
                    "Select an Option",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: notifier.textColor,
                      fontFamily: "Manrope_bold",
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
                SizedBox(height: height / 50),
                Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        value = 0;
                      });
                    },
                    child: Container(
                      height: height / 5,
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
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Purchase Course",
                              style: TextStyle(
                                fontFamily: "Manrope_bold",
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.3,
                                color: notifier.textColor,
                              ),
                            ),
                            SizedBox(height: height / 60),
                            Row(
                              children: [
                                Text(
                                  "Pay for this course only, and get a shareable\ncertificate after you’ve completed the\ncourse.",
                                  style: TextStyle(
                                    fontFamily: "Manrope_bold",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.2,
                                    color: notifier.textColorGrey,
                                  ),
                                ),
                                const Spacer(),
                                radioButton(0),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height / 50),
                Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        value = 1;
                      });
                    },
                    child: Container(
                      height: height / 5,
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
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Enroll without certificate",
                              style: TextStyle(
                                fontFamily: "Manrope_bold",
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.3,
                                color: notifier.textColor,
                              ),
                            ),
                            SizedBox(height: height / 60),
                            Row(
                              children: [
                                Text(
                                  "Pay for this course only, and get a shareable\ncertificate after you’ve completed the\ncourse.",
                                  style: TextStyle(
                                    fontFamily: "Manrope_bold",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.2,
                                    color: notifier.textColorGrey,
                                  ),
                                ),
                                const Spacer(),
                                radioButton(1),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
            Navigator.of(context).pushNamed("select_payment");
          },
        ),
      ),
    );
  }

  Widget radioButton(int index) {
    return SizedBox(
      height: 20,
      width: 20,
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
            width: (value == index) ? 6 : 2,
          ),
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(0),
        ),
        child: const Text(""),
      ),
    );
  }
}
