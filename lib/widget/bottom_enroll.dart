import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/theme_model.dart';
import 'button.dart';

class BottomEnroll extends StatefulWidget {
  const BottomEnroll({super.key});

  @override
  State<BottomEnroll> createState() => _BottomEnrollState();
}

class _BottomEnrollState extends State<BottomEnroll> {
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height / 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //  Text(
                //   "Enroll Your Course",
                //   style: TextStyle(
                //     fontSize: 20,
                //     color: notifier.textColor,
                //     fontFamily: "Manrope_bold",
                //     fontWeight: FontWeight.w700,
                //   ),
                // ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/splash_logo.png",
                      height: height / 6,
                      width: width / 6,
                    ),
                    SizedBox(width: width / 25),
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Enroll your Course",
                          style: TextStyle(
                            fontSize: 14,
                            color: notifier.textColor,
                            fontFamily: "Manrope_bold",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Proficie App",
                          style: TextStyle(
                            fontSize: 10,
                            color: notifier.textColorGrey,
                            fontFamily: "Manrope_bold",
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.2,
                          ),
                        ),
                        Text(
                          "Multi Payment Gateway",
                          style: TextStyle(
                            fontSize: 10,
                            color: notifier.textColorGrey,
                            fontFamily: "Manrope_bold",
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                 Divider(
                  height: 1,
                  thickness: 2,
                  color: notifier.dividedColor,
                ),
                SizedBox(height: height / 50),
                Row(
                  children: [
                     Text(
                      "ACCOUNT",
                      style: TextStyle(
                        fontSize: 12,
                        color: notifier.textColorGrey,
                        fontFamily: "Manrope_bold",
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(width: width / 50),
                     Text(
                      "elon@gmail.com",
                      style: TextStyle(
                        fontSize: 12,
                        color: notifier.textColor,
                        fontFamily: "Manrope_bold",
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height / 40),
                 Divider(
                  height: 1,
                  thickness: 2,
                  color: notifier.textField,
                ),
                SizedBox(height: height / 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     Text(
                      "PRICE",
                      style: TextStyle(
                        fontSize: 12,
                        color: notifier.textColorGrey,
                        fontFamily: "Manrope_bold",
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(width: width / 50),
                     Text(
                      "\$ 354",
                      style: TextStyle(
                        fontSize: 18,
                        color: notifier.textColor,
                        fontFamily: "Manrope_bold",
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height / 40),
                button(
                  text: "Confirmation",
                  color: const Color(0xff0056D2),
                  onPress: (){
                    Navigator.of(context).pushNamed("buy_course_detail");
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
