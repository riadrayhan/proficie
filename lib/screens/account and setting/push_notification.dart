import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/theme_model.dart';

class PushNotification extends StatefulWidget {
  const PushNotification({super.key});

  @override
  State<PushNotification> createState() => _PushNotificationState();
}

class _PushNotificationState extends State<PushNotification> {
  bool isSwitch_1 = false;
  bool isSwitch_2 = false;
  bool isSwitch_3 = false;
  bool isSwitch_4 = false;
  bool isSwitch_5 = false;
  bool isSwitch_6 = false;
  bool isSwitch_7 = false;
  bool isSwitch_8 = false;
  bool isSwitch_9 = false;
  bool isSwitch_10 = false;
  bool isSwitch_11 = false;

  onChange1(bool value1) {
    setState(() {
      isSwitch_1 = value1;
    });
  }

  onChange2(bool value2) {
    setState(() {
      isSwitch_2 = value2;
    });
  }

  onChange3(bool value3) {
    setState(() {
      isSwitch_3 = value3;
    });
  }

  onChange4(bool value4) {
    setState(() {
      isSwitch_4 = value4;
    });
  }

  onChange5(bool value5) {
    setState(() {
      isSwitch_5 = value5;
    });
  }

  onChange6(bool value6) {
    setState(() {
      isSwitch_6 = value6;
    });
  }

  onChange7(bool value7) {
    setState(() {
      isSwitch_7 = value7;
    });
  }

  onChange8(bool value8) {
    setState(() {
      isSwitch_8 = value8;
    });
  }

  onChange9(bool value9) {
    setState(() {
      isSwitch_9 = value9;
    });
  }

  onChange10(bool value10) {
    setState(() {
      isSwitch_10 = value10;
    });
  }

  onChange11(bool value11) {
    setState(() {
      isSwitch_11 = value11;
    });
  }

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
            SizedBox(width: width / 6),
            Text(
              "Notification & Sound",
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
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "General",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Manrope_bold",
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                    color: notifier.textColor,
                  ),
                ),
              ),
              SizedBox(height: height / 35),
              widgetData("New Uploaded Course", isSwitch_1, onChange1),
              widgetData("Popular Course", isSwitch_2, onChange2),
              widgetData("Suggestion Course", isSwitch_3, onChange3),
              widgetData("Popular Mentor", isSwitch_4, onChange4),
              widgetData("New Message", isSwitch_5, onChange5),
              widgetData("Learning Reminders", isSwitch_6, onChange6),
              SizedBox(height: height / 40),
              Container(
                height: 10,
                width: double.infinity,
                color: notifier.containerDividedColor,
              ),
              SizedBox(height: height / 40),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: Text(
                  "Badge Counter",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Manrope_bold",
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                    color: notifier.textColor,
                  ),
                ),
              ),
              SizedBox(height: height / 35),
              widgetData("Show Badge Icon", isSwitch_7, onChange7),
              widgetData("Include Muted Chat", isSwitch_8, onChange8),
              widgetData("Count Unread Message", isSwitch_9, onChange9),
              SizedBox(height: height / 40),
              Container(
                height: 10,
                width: double.infinity,
                color: notifier.containerDividedColor,
              ),
              SizedBox(height: height / 40),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: Text(
                  "Email Notification",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Manrope_bold",
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                    color: notifier.textColor,
                  ),
                ),
              ),
              SizedBox(height: height / 35),
              widgetData("Promotions, Course Recommendations", isSwitch_10,
                  onChange10),
              widgetData(
                  "Announcements From Instructor", isSwitch_11, onChange11),
            ],
          ),
        ),
      ),
    );
  }

  Widget widgetData(String text, bool isSwitch, Function onChangedMethod) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5,right: 15,left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: "Manrope_bold",
                fontSize: 14,
                letterSpacing: 0.3,
                color: notifier.textColor,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          CupertinoSwitch(
            trackColor: notifier.isDark ? const Color(0xff334155) : const Color(0xffE2E8F0),
            activeColor: const Color(0xff0056D2),
            thumbColor: Colors.white,
            value: isSwitch,
            onChanged: (value) {
              onChangedMethod(value);
            },
          ),
        ],
      ),
    );
  }
}
