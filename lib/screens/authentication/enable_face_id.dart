import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/theme_model.dart';
import '../../widget/button.dart';
import '../../widget/linear_progress_indicator.dart';

class EnableFace extends StatefulWidget {
  const EnableFace({super.key});

  @override
  State<EnableFace> createState() => _EnableFaceState();
}

class _EnableFaceState extends State<EnableFace> {
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
        automaticallyImplyLeading: false,
        elevation: 0,
        title:  Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Image.asset(
                "assets/icons/close_icon_1.png",
                color: notifier.isDark ? Colors.white : null,
                width: width / 7.5,
              ),
            ),
            const Spacer(),
            const Text(
              "Skip For Now",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: "Manrope_bold",
                letterSpacing: 0.3,
                color: Color(0xff0056D2),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height / 6),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Image.asset(
                  "assets/images/face_id.png",
                  scale: 3,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "Enable Face ID",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Manrope_bold",
                    letterSpacing: 0.3,
                    color: notifier.textColor,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "This help us check that you,re really you. Identity verification is one of the ways we keep secure.",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Manrope_semibold",
                    letterSpacing: 0.3,
                    color: notifier.textColorGrey,
                  ),
                ),
              ),
              const Spacer(),
              linearIndicator(0.5),
              SizedBox(height: height / 35),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Center(
                  child: button(
                    text: 'Enable Face ID',
                    color: const Color(0xff0056D2),
                    onPress: () {
                      Navigator.of(context).pushNamed("finger_print");
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
