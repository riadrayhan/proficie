import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/theme_model.dart';

class AboutSkillmaster extends StatefulWidget {
  const AboutSkillmaster({super.key});

  @override
  State<AboutSkillmaster> createState() => _AboutSkillmasterState();
}

class _AboutSkillmasterState extends State<AboutSkillmaster> {
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
              "About SkillMaster",
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
          padding: const EdgeInsets.only(bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/help_center.png",
              ),
              Padding(
                padding: const EdgeInsets.only(left:15, right: 40),
                child: Text(
                  "Lorem ipsum dolor sit amet.",
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: "Manrope_bold",
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1,
                    color: notifier.textColor,
                  ),
                ),
              ),
              SizedBox(height: height / 140),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 40),
                child: Text(
                  "Now you can learn anywhere, anytime, even if there is no internet access!",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Manrope_semibold",
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.3,
                    color: notifier.textColorGrey,
                  ),
                ),
              ),
              SizedBox(height: height / 35),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 50),
                child: Text(
                  "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Manrope_semibold",
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.3,
                    color: notifier.textColorGrey,
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
