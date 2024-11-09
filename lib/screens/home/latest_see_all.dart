import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../globals/list_grid_view_global.dart';
import '../../model/theme_model.dart';
import 'home_page.dart';


class LatestSeeAll extends StatefulWidget {
  const LatestSeeAll({super.key});

  @override
  State<LatestSeeAll> createState() => _LatestSeeAllState();
}

class _LatestSeeAllState extends State<LatestSeeAll> {
  ColorNotifire notifier = ColorNotifire();
  double sliderValue = 1;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: notifier.background,
      resizeToAvoidBottomInset: false,
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
            SizedBox(width: width / 5.5),
            Text(
              "Latest Course",
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
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15,),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: gridItem.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.only(bottom: 25),
              width: double.infinity,
              color: notifier.background,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height / 4.8,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/latest_image_1.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: Text(
                      gridItem[index]['desc'],
                      style: TextStyle(
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
                  SizedBox(height: height / 120),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          gridItem[index]['profile'],
                          height: height / 22,
                        ),
                        SizedBox(width: width / 32),
                        Text(
                          gridItem[index]['name'],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: notifier.textColor,
                            letterSpacing: 0.3,
                            fontFamily: "Manrope_bold",
                          ),
                        ),
                        const Spacer(),
                        Text(
                          gridItem[index]['rate'],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: notifier.textColor,
                            letterSpacing: 0.3,
                            fontFamily: "Manrope_bold",
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: slider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
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
                          style: TextStyle(
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
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10, top: 4),
                    child: Row(
                      children: [
                        Image.asset("assets/icons/download_icon.png",
                            width: width / 25),
                        SizedBox(width: width / 35),
                        Text(
                          "5 Module Downloaded",
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
                          "551.0 MB",
                          style: TextStyle(
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget slider() {
    return SliderTheme(
      data: SliderThemeData(
        activeTrackColor: const Color(0xffF9AA00),
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
