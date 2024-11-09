import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/theme_model.dart';

class DownloadedOption extends StatefulWidget {
  const DownloadedOption({super.key});

  @override
  State<DownloadedOption> createState() => _DownloadedOptionState();
}

class _DownloadedOptionState extends State<DownloadedOption> {
  bool state = false;
  bool isSwitch = false;
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
            SizedBox(width: width / 5),
            Text(
              "Download Option",
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
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
               padding: const EdgeInsets.only(right: 15,left: 15),
               child: Text(
                "Disk & Network Usage",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: "Manrope_bold",
                  fontSize: 20,
                  color: notifier.textColor,
                ),
            ),
             ),
            SizedBox(height: height / 35),
            accountDetails(
              image: "assets/icons/storage_icon.png",
              name: "Storage Usage",
              desc: "642.9 MB",
              onPress: () {},
            ),
            accountDetails(
              image: "assets/icons/data_usage_icon.png",
              name: "Data Usage",
              desc: "20 MB",
              onPress: () {},
            ),
            Container(
              height: 10,
              width: double.infinity,
              color: notifier.containerDividedColor,
            ),
            SizedBox(height: height / 30),
             Padding(
               padding: const EdgeInsets.only(right: 15,left: 15),
               child: Text(
                "Video Option",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: "Manrope_bold",
                  fontSize: 20,
                  color: notifier.textColor,
                ),
            ),
             ),
            SizedBox(height: height / 35),
            accountDetails(
              image: "assets/icons/video_play_icon.png",
              name: "Video Playback Option",
              desc: "720p",
              onPress: () {},
            ),
            Container(
              height: 10,
              width: double.infinity,
              color: notifier.containerDividedColor,
            ),
            SizedBox(height: height / 30),
             Padding(
               padding: const EdgeInsets.only(right: 15,left: 15),
               child: Text(
                "Automatic Media Download",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: "Manrope_bold",
                  fontSize: 20,
                  color: notifier.textColor,
                ),
            ),
             ),
            SizedBox(height: height / 35),
            Padding(
              padding: const EdgeInsets.only(right: 15,left: 15),
              child: download(text: "When using mobile data"),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15,left: 15),
              child: Row(
                children: [
                   Text(
                    "When connected to Wi-Fi",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "Manrope_bold",
                      fontSize: 14,
                      letterSpacing: 0.3,
                      color: notifier.textColor,
                    ),
                  ),
                  const Spacer(),
                  CupertinoSwitch(
                    activeColor: const Color(0xff0056D2),
                    thumbColor: Colors.white,
                    trackColor: notifier.isDark ? const Color(0xff334155) : const Color(0xffE2E8F0),
                    value: isSwitch,
                    onChanged: (value) {
                      isSwitch = value;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget download({required String text}) {
    return Row(
      children: [
        Text(
          text,
          style:  TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "Manrope_bold",
            fontSize: 14,
            letterSpacing: 0.3,
            color: notifier.textColor,
          ),
        ),
        const Spacer(),
        CupertinoSwitch(
          activeColor: const Color(0xff0056D2),
          thumbColor: Colors.white,
          value: state,
          onChanged: (value) {
            state = value;
            setState(() {});
          },
        ),
      ],
    );
  }
  Widget accountDetails(
      {required String image,
        required String name,
        required String desc,
        required void Function()? onPress}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20,right: 15,left: 15),
      child: Row(
        children: [
          Image.asset(image, scale: 3),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style:   TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: "Manrope_bold",
                  fontSize: 14,
                  letterSpacing: 0.3,
                  color: notifier.textColor,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                desc,
                style:  TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: "Manrope_bold",
                  fontSize: 12,
                  letterSpacing: 0.2,
                  color: notifier.textColorGrey,
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: onPress,
            icon:  Icon(
              Icons.arrow_forward_ios_rounded,
              color: notifier.iconColor,
            ),
          ),
        ],
      ),
    );
  }

}
