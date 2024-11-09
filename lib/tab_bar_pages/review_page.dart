import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/theme_model.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  ColorNotifire notifier = ColorNotifire();
  int selectIndex = 0;
  List text = [
    "All Stars",
    "5 Stars",
    "4 Stars",
    "3 Stars",
    "2 Stars",
    "1 Stars",
  ];

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: notifier.background,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reviews",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: "Manrope_bold",
                fontSize: 24,
                color: notifier.textColor,
              ),
            ),
            SizedBox(height: height / 40),
            Text(
              "⭐ 4,5 (1.200 Reviews)",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: "Manrope_bold",
                fontSize: 18,
                color: notifier.textColor,
              ),
            ),
            SizedBox(height: height / 40),
            SizedBox(
              height: 45,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: text.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectIndex = index;
                      });
                    },
                    child: Container(
                      width: index == 0
                          ? 90
                          : index == 1
                              ? 90
                              : index == 2
                                  ? 90
                                  : index == 3
                                      ? 90
                                      : 101,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: notifier.tabBorder,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(25),
                        color: selectIndex == index
                            ? const Color(0xff0056D2)
                            : notifier.background,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            text[index],
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Manrope_bold",
                              color: selectIndex == index
                              ? Colors.white
                              : notifier.textColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            contain(
              name: "Terry Press",
              star: "⭐⭐⭐⭐⭐",
              date: "20 Feb 2022",
              desc:
                  "This course was comprehensive and covered everything I needed to know about animation.",
            ),
            contain(
              name: "Haylie Curtis",
              star: "⭐⭐⭐⭐",
              date: "20 Feb 2022",
              desc:
                  "The instructor's real-world examples and hands-on approach made it a valuable learning experience.",
            ),
            contain(
              name: "Lydia Carder",
              star: "⭐⭐⭐⭐",
              date: "20 Feb 2022",
              desc:
                  "I highly recommend this course for anyone interested in animation. The instructor's engaging teaching style made the material easy to understand and apply.",
            ),
            contain(
              name: "Madelyn Korsgaard",
              star: "⭐⭐⭐",
              date: "20 Feb 2022",
              desc:
                  "This course exceeded my expectations. The instructor's real-world examples and critiques of my work helped me improve my skills and deepen my understanding of animation.",
            ),
          ],
        ),
      ),
    );
  }

  Widget contain(
      {required String name,
      required String star,
      required String date,
      required String desc}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        height: 110,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: notifier.dividedColor,
              width: 1.5,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    letterSpacing: 0.3,
                    fontFamily: "Manrope_bold",
                    color: notifier.textColor,
                  ),
                ),
                Text(star),
              ],
            ),
            Text(
              date,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                letterSpacing: 0.2,
                fontFamily: "Manrope_semibold",
                color: notifier.textColorGrey,
              ),
            ),
            Text(
              desc,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                letterSpacing: 0.2,
                fontFamily: "Manrope_mediumbold",
                color: notifier.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
