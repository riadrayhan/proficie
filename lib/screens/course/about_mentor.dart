import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/theme_model.dart';

class AboutMentor extends StatefulWidget {
  const AboutMentor({super.key});

  @override
  State<AboutMentor> createState() => _AboutMentorState();
}

class _AboutMentorState extends State<AboutMentor> {
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
        title: Row(
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
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                "assets/images/more_vert_icon.png",
                width: width / 7.5,
                color: notifier.isDark ? Colors.white : null,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/course_detail_avtar.png"),
                SizedBox(height: height / 50),
                Text(
                  "Emerson Siphron",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: notifier.textColor,
                    fontFamily: "Manrope_bold",
                    fontSize: 32,
                    letterSpacing: -1,
                  ),
                ),
                SizedBox(height: height / 50),
                Text(
                  "Senior Product Designer in Unpixel Studio",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: notifier.mentorDetailTextColor,
                    fontFamily: "Manrope_medium",
                    fontSize: 14,
                    letterSpacing: 0.3,
                  ),
                ),
                SizedBox(height: height / 35),
                const Divider(
                  thickness: 1,
                  color: Color(0xffE2E8F0),
                ),
                SizedBox(height: height / 35),
                Text(
                  "A mentor for a course in product design typically provides guidance and support to students learning about the process of designing and developing products.",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: notifier.mentorDetailTextColor,
                    fontFamily: "Manrope_medium",
                    fontSize: 14,
                    letterSpacing: 0.3,
                  ),
                ),
                SizedBox(height: height / 25),
                Text(
                  "They offer expertise and experience in the field, and help students understand the concepts, tools, and techniques needed to design successful products.",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: notifier.mentorDetailTextColor,
                    fontFamily: "Manrope_medium",
                    fontSize: 14,
                    letterSpacing: 0.3,
                  ),
                ),
                SizedBox(height: height / 25),
                Text(
                  "They may also provide feedback on students' design projects, help with problem-solving, and offer advice on industry trends and best practices. ",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: notifier.mentorDetailTextColor,
                    fontFamily: "Manrope_medium",
                    fontSize: 14,
                    letterSpacing: 0.3,
                  ),
                ),
                SizedBox(height: height / 25),
                Text(
                  "The goal of a product design mentor is to assist students in gaining the knowledge and skills needed to pursue a career in product design or to improve their current product design skills.",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: notifier.mentorDetailTextColor,
                    fontFamily: "Manrope_medium",
                    fontSize: 14,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
