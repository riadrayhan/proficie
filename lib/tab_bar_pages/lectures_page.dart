import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/theme_model.dart';

class LectureScreen extends StatefulWidget {
  const LectureScreen({super.key});

  @override
  State<LectureScreen> createState() => _LectureScreenState();
}

class _LectureScreenState extends State<LectureScreen> {
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifier.background,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Theme(
              data: Theme.of(context)
                  .copyWith(dividerColor: notifier.dividedColor),
              child: ExpansionTile(
                childrenPadding: const EdgeInsets.only(bottom: 10),
                initiallyExpanded: true,
                iconColor: notifier.iconColor,
                leading: const Text(
                  "WEEK 1",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: "Manrope_bold",
                    fontSize: 10,
                    color: Color(0xff64748B),
                    letterSpacing: 0.2,
                  ),
                ),
                trailing: Image.asset(
                  "assets/icons/download_icon.png",
                  scale: 2,
                  color: notifier.textColor,
                ),
                title: Text(
                  "Introduction to UI/UX design and animation",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: "Manrope_bold",
                    fontSize: 16,
                    color: notifier.textColor,
                    letterSpacing: 0.3,
                  ),
                ),
                collapsedIconColor: notifier.iconColor,
                tilePadding: EdgeInsets.zero,
                children: [
                  const Text(
                    "Introduction to UI/UX design and animation provides an overview of the concepts, principles and techniques of UI/UX design and animation. The course is designed for those who are new to the field and want to understand the basics of user interface and user experience",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Manrope_semibold",
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.2,
                      color: Color(0xff64748B),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Image.asset(
                        "assets/icons/clock.png",
                        scale: 4,
                        color: const Color(0xff94A3B8),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "5 Hours to complete",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Manrope_semibold",
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.2,
                          color: notifier.textColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset(
                        "assets/icons/video-circle.png",
                        scale: 4,
                        color: const Color(0xff94A3B8),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "4 Videos",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Manrope_semibold",
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.2,
                          color: notifier.textColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            expansionList(
                leading: "WEEK 2",
                title: "Principles of animation in UI/UX design"),
            expansionList(
                leading: "WEEK 3",
                title:
                    "Design tools for animation (e.g. Adobe After Effects, Figma)"),
            expansionList(
                leading: "WEEK 4",
                title: "User experience design and user interface animation"),
            expansionList(
                leading: "WEEK 5",
                title: "Interactive design and prototyping with animations"),
          ],
        ),
      ),
    );
  }

  Widget expansionList({
    required String leading,
    required String title,
  }) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: notifier.dividedColor),
      child: ExpansionTile(
        childrenPadding: const EdgeInsets.only(bottom: 10),
        iconColor: notifier.iconColor,
        leading: Text(
          leading,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: "Manrope_bold",
            fontSize: 10,
            color: Color(0xff64748B),
            letterSpacing: 0.2,
          ),
        ),
        trailing: Image.asset(
          "assets/icons/download_icon.png",
          scale: 2,
          color: notifier.textColor,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: "Manrope_bold",
            fontSize: 16,
            color: notifier.textColor,
            letterSpacing: 0.3,
          ),
        ),
        collapsedIconColor: notifier.iconColor,
        tilePadding: EdgeInsets.zero,
        children: [
          const Text(
            "Introduction to UI/UX design and animation provides an overview of the concepts, principles and techniques of UI/UX design and animation. The course is designed for those who are new to the field and want to understand the basics of user interface and user experience",
            style: TextStyle(
              fontSize: 12,
              fontFamily: "Manrope_semibold",
              fontWeight: FontWeight.w400,
              letterSpacing: 0.2,
              color: Color(0xff64748B),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Image.asset(
                "assets/icons/clock.png",
                scale: 4,
                color: const Color(0xff94A3B8),
              ),
              const SizedBox(width: 10),
              Text(
                "5 Hours to complete",
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Manrope_semibold",
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.2,
                  color: notifier.textColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Image.asset(
                "assets/icons/video-circle.png",
                scale: 4,
                color: const Color(0xff94A3B8),
              ),
              const SizedBox(width: 10),
              Text(
                "4 Videos",
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Manrope_semibold",
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.2,
                  color: notifier.textColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
