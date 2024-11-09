import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../globals/list_grid_view_global.dart';
import '../model/theme_model.dart';
import '../screens/home/home_page.dart';

class ActiveCourse extends StatefulWidget {
  const ActiveCourse({super.key});

  @override
  State<ActiveCourse> createState() => _ActiveCourseState();
}

class _ActiveCourseState extends State<ActiveCourse> {
  double sliderValue = 80;
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: notifier.background,
      body: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: gridItem.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed("detail_education");
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/active_course_image_1.jpg",
                        width: width / 2.8,
                        height: height / 7,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: width / 50),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Text(
                              gridItem[index]['desc'],
                              style:  TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.3,
                                color: notifier.textColor,
                                fontFamily: "Manrope_bold",
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(height: height / 30),
                          Row(
                            children: [
                              Image.asset(
                                gridItem[index]['profile'],
                                height: height / 22,
                              ),
                              SizedBox(width: width / 45),
                              Text(
                                gridItem[index]['name'],
                                style:  TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.3,
                                  color: notifier.textColor,
                                  fontFamily: "Manrope_bold",
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    size: 22,
                                    color: Color(0xffF9AA00),
                                  ),
                                  Text(
                                    gridItem[index]['rate'],
                                    style:  TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: notifier.textColor,
                                      letterSpacing: 0.3,
                                      fontFamily: "Manrope_bold",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              slider(),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  children: [
                     Text(
                      "4/5 Module",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: notifier.textColor,
                        fontFamily: "Manrope_bold",
                        letterSpacing: 0.2,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "${sliderValue.toInt()}%",
                      style:  TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: notifier.textColor,
                        fontFamily: "Manrope_bold",
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height / 35),
            ],
          );
        },
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
