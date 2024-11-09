import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../globals/list_grid_view_global.dart';
import '../model/theme_model.dart';

class DownloadedCourse extends StatefulWidget {
  const DownloadedCourse({super.key});

  @override
  State<DownloadedCourse> createState() => _DownloadedCourseState();
}

class _DownloadedCourseState extends State<DownloadedCourse> {
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
                onTap: () {
                  Navigator.of(context).pushNamed("detail_education");
                },
                child: Container(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/active_course_image_1.jpg",
                          fit: BoxFit.cover,
                          height: height / 7.5,
                        ),
                      ),
                      SizedBox(
                        width: width / 45,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
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
                                SizedBox(width: width / 80),
                                Text(
                                  gridItem[index]['name'],
                                  style: TextStyle(
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
                                        letterSpacing: 0.3,
                                        color: notifier.textColor,
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
              ),
               Row(
                children: [
                  const Icon(
                    Icons.file_download_outlined,
                    color: Colors.grey,
                    size: 16,
                  ),
                  Text(
                    "   5 Module Downloaded",
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
              SizedBox(height: height / 35),
            ],
          );
        },
      ),
    );
  }
}
