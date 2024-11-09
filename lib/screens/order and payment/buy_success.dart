import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/theme_model.dart';
import '../../widget/button.dart';

class BuySuccess extends StatefulWidget {
  const BuySuccess({super.key});

  @override
  State<BuySuccess> createState() => _BuySuccessState();
}

class _BuySuccessState extends State<BuySuccess> {
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        backgroundColor: notifier.background,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Image.asset(
            "assets/icons/close_icon.png",
            color: notifier.isDark ? Colors.white : null,
            width: width / 7.5,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height: height / 20),
              Image.asset("assets/images/enroll_successfull.png", scale: 3),
              Text(
                "Enroll Successful",
                style: TextStyle(
                  fontFamily: "Manrope_bold",
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: notifier.textColor,
                ),
              ),
              SizedBox(
                height: height / 120,
              ),
              Text(
                "You were successfully enrolled in the course.",
                style: TextStyle(
                  fontFamily: "Manrope_semibold",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.3,
                  color: notifier.textColorGrey,
                ),
              ),
              SizedBox(height: height / 45),
              Container(
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
                      SizedBox(height: height / 45),
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
                          Text(
                            "6 FEb 2023",
                            style: TextStyle(
                              fontFamily: "Manrope_bold",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
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
              const Spacer(),
              button(
                text: "Start Learning",
                color: const Color(0xff0056D2),
                onPress: () {
                  Navigator.of(context).pushNamed("my_learning");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
