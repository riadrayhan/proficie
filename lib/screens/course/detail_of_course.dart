import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/theme_model.dart';
import '../../widget/share_button_contain.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: notifier.background,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/detail_course_cover.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/mentor_image_overlay.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Image.asset(
                          "assets/icons/close_icon_white.png",
                          width: width / 7.5,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25),
                              ),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return const ShareButton();
                            },
                          );
                        },
                        child: Image.asset(
                          "assets/icons/share_icon.png",
                          width: width / 7.5,
                        ),
                      ),
                      SizedBox(
                        width: width / 30,
                      ),
                      GestureDetector(
                        onTap: () {
                        },
                        child: Image.asset(
                          "assets/icons/bookmark_icon.png",
                          width: width / 7.3,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  alignment: Alignment.center,
                  height: height / 16,
                  width: width / 3.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Master",
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: "Manrope_bold",
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.2,
                          ),
                        ),
                        Image.asset(
                          "assets/icons/range.png",
                          scale: 2.5,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height / 35),
                const Padding(
                  padding: EdgeInsets.only(right: 25),
                  child: Text(
                    "Animation has become a means of advertising.",
                    style: TextStyle(
                      fontFamily: "Manrope_bold",
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1,
                    ),
                  ),
                ),
                SizedBox(height: height / 40),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/message_1.png",
                      height: height / 17,
                    ),
                    SizedBox(
                      width: width / 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed("about_mentor");
                      },
                      child: const Text(
                        "Brook Leon",
                        style: TextStyle(
                          fontFamily: "Manrope_bold",
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                    const VerticalDivider(
                      width: 2,
                      thickness: 20,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: width / 40,
                    ),
                    const Text(
                      "UI/UX Design",
                      style: TextStyle(
                        fontFamily: "Manrope_bold",
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height / 150),
                const Divider(color: Colors.grey),
                SizedBox(height: height / 40),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person_outline_outlined,
                          color: Colors.grey,
                          size: 16,
                        ),
                        Text(
                          " 500 Students",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: "Manrope_bold",
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.person_outline_outlined,
                          color: Colors.grey,
                          size: 16,
                        ),
                        Text(
                          " 5 Module",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: "Manrope_bold",
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timer_sharp,
                          color: Colors.grey,
                          size: 16,
                        ),
                        Text(
                          " 1h 30m",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: "Manrope_bold",
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: height / 40),
                customContainer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customContainer() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("about_course");
      },
      child: Container(
        padding: const EdgeInsets.only(right: 10, left: 20),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
          border: Border.all(color: Colors.white30, width: 1.5),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Detail Course",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontFamily: 'Manrope_bold',
                letterSpacing: 0.3,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_outlined,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
