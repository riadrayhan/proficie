import 'package:flutter/material.dart';

import '../../widget/button.dart';
import '../../widget/share_button_contain.dart';
import '../home/home_page.dart';

class EducationDetail extends StatefulWidget {
  const EducationDetail({super.key});

  @override
  State<EducationDetail> createState() => _EducationDetailState();
}

class _EducationDetailState extends State<EducationDetail> {
  double sliderValue = 80;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/learning_detail.png"),
                fit: BoxFit.cover,
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
                      Container(
                        alignment: Alignment.center,
                        width: width / 7.5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 0.7),
                        ),
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 25,
                          ),
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
                        child: Container(
                          width: width / 7.5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 0.7),
                          ),
                          child: Image.asset(
                            "assets/icons/mentor_backarrow.png",
                            scale: 3.5,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width / 30,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: width / 7.5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 0.7),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.bookmark_outline_rounded,
                            color: Colors.white,
                            size: 27,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  alignment: Alignment.center,
                  height: height / 20,
                  width: width / 4,
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
                          "Beginner",
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: "Manrope_bold",
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.2,
                          ),
                        ),
                        Image.asset(
                          "assets/icons/range.png",
                          scale: 2,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height / 45),
                const Text(
                  "User-Centered Design Process: Research to Launch",
                  style: TextStyle(
                    fontFamily: "Manrope_bold",
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1,
                  ),
                ),
                SizedBox(height: height / 120),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/course_detail_avtar.png",
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
                        "Emerson Siphron",
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
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: width / 60,
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
                SizedBox(height: height / 300),
                const Divider(color: Colors.grey, thickness: 1),
                SizedBox(height: height / 120),
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
                slider(),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    children: [
                      const Text(
                        "4/5 Module",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Colors.white,
                          fontFamily: "Manrope_bold",
                          letterSpacing: 0.2,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "${sliderValue.toInt()}%",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Colors.white,
                          fontFamily: "Manrope_bold",
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height / 40),
                button(
                  text: "Continue Learning",
                  color: const Color(0xff0056D2),
                  onPress: () {
                    Navigator.of(context).pushNamed("my_learning_lecture");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget slider() {
    return SliderTheme(
      data: SliderThemeData(
        activeTrackColor: const Color(0xff23AA26),
        inactiveTrackColor: const Color(0xffF1F5F9),
        trackHeight: 6,
        thumbShape: const RoundSliderOverlayShape(),
        rangeThumbShape: const RoundRangeSliderThumbShape(),
        trackShape: CustomTrackShape(),
      ),
      child: Slider(
        min: 0,
        max: 100,
        value: sliderValue,
        onChanged: (double val) {
          setState(() {
            sliderValue = val;
          });
        },
      ),
    );
  }
}
