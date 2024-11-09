import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../globals/list_grid_view_global.dart';
import '../../model/theme_model.dart';
import '../../widget/button.dart';
import '../../widget/sliver_appbar.dart';

class DetailScreen extends StatefulWidget {
  final String name;
  final String rate;
  final String course;
  final String image;

  const DetailScreen(
      {super.key,
      required this.name,
      required this.rate,
      required this.course,
      required this.image});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  ColorNotifire notifier = ColorNotifire();
  int selectIndex = 0;
  bool switchState = false;
  String selectedFilter = "All Level";

  dynamic isVisible;
  late ScrollController hideButtonController;

  @override
  void initState() {
    super.initState();
    isVisible = true;
    hideButtonController = ScrollController();
    hideButtonController.addListener(() {
      if (hideButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (isVisible == true) {
          setState(() {
            isVisible = false;
          });
        }
      } else {
        if (hideButtonController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (isVisible == false) {
            setState(() {
              isVisible = true;
            });
          }
        }
      }
    });
  }

  int value = 0;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: CustomScrollView(
          shrinkWrap: true,
          controller: hideButtonController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: MySliverAppBar(expandedHeight: 130),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children: [
                      // Stack(
                      //   clipBehavior: Clip.none,
                      //   children: [
                      //     Container(
                      //       height: 192,
                      //       width: 415,
                      //       decoration: const BoxDecoration(
                      //         image: DecorationImage(
                      //           image: AssetImage(
                      //               "assets/images/detail_mentor_cover.png"),
                      //           fit: BoxFit.cover,
                      //         ),
                      //       ),
                      //     ),
                      //     Positioned(
                      //       left: 0,
                      //       right: 0,
                      //       top: 150,
                      //       child: Container(
                      //         height: 90,
                      //         width: 90,
                      //         decoration:  BoxDecoration(
                      //           border: Border.all(color: Colors.white,width: 4.5),
                      //           shape: BoxShape.circle,
                      //           image: const DecorationImage(
                      //               image: AssetImage(
                      //                 "assets/images/list_mentor_1.jpg",
                      //               ),
                      //               fit: BoxFit.cover
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(height: height / 11),
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontFamily: "Manrope_bold",
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.2,
                          color: notifier.textColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.course,
                            style: TextStyle(
                              fontFamily: "Manrope_bold",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.2,
                              color: notifier.textColorGrey,
                            ),
                          ),
                          SizedBox(
                            height: height / 32,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 20,
                                color: Color(0xffF9AA00),
                              ),
                              Text(
                                "4,5",
                                style: TextStyle(
                                  fontFamily: "Manrope_bold",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.2,
                                  color: notifier.textColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: height / 35),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "25.5K",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Manrope_bold",
                                  color: notifier.textColor,
                                  letterSpacing: 0.2,
                                ),
                              ),
                              Text(
                                "Followers",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Manrope_bold",
                                  letterSpacing: 0.3,
                                  color: notifier.textColorGrey,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "54",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Manrope_bold",
                                  letterSpacing: 0.2,
                                  color: notifier.textColor,
                                ),
                              ),
                              Text(
                                "Courses",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Manrope_bold",
                                  letterSpacing: 0.3,
                                  color: notifier.textColorGrey,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "2K",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Manrope_bold",
                                  letterSpacing: 0.2,
                                  color: notifier.textColor,
                                ),
                              ),
                              Text(
                                "Students",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Manrope_bold",
                                  letterSpacing: 0.3,
                                  color: notifier.textColorGrey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: height / 35),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: button(
                          text: "+ Follow",
                          color: const Color(0xff0056D2),
                        ),
                      ),
                      SizedBox(height: height / 20),
                      Padding(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: gridItem.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1.7,
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                          ),
                          itemBuilder: (_, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height / 4,
                                  width: width / 1.5,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed("detail_course");
                                      },
                                      child: Image.asset(
                                        gridItem[index]['image'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: height / 75),
                                Text(
                                  gridItem[index]['desc'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: "Manrope_bold",
                                    letterSpacing: 0.4,
                                    color: notifier.textColor,
                                  ),
                                ),
                                SizedBox(height: height / 115),
                                Row(
                                  children: [
                                    Text(
                                      gridItem[index]['name'],
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Manrope_bold",
                                          letterSpacing: 0.3,
                                          color: notifier.textColor),
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          size: 20,
                                          color: Color(0xffF9AA00),
                                        ),
                                        Text(
                                          gridItem[index]['rate'],
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "Manrope_bold",
                                              letterSpacing: 0.3,
                                              color: notifier.textColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: height / 115),
                                Row(
                                  children: [
                                    Image.asset(
                                        "assets/icons/download_icon.png",
                                        width: width / 25),
                                    SizedBox(width: width / 35),
                                    Flexible(
                                      child: Text(
                                        "5 Module Downloaded",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: notifier.textColor,
                                          fontFamily: "Manrope_bold",
                                          letterSpacing: 0.2,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
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
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Visibility(
          visible: isVisible,
          child: SizedBox(
            width: width / 1.5,
            child: FloatingActionButton.extended(
              backgroundColor: notifier.floatingAction,
              onPressed: () {},
              isExtended: true,
              label: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25),
                      ),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return Scaffold(
                        floatingActionButton: Align(
                          alignment: const Alignment(0.1, -1.2),
                          child: Container(
                            transform: Matrix4.translationValues(0.0, -30, 0.0),
                            child: FloatingActionButton(
                              backgroundColor: notifier.bottomSheetColor,
                              onPressed: () {},
                              child: Icon(
                                Icons.close,
                                color: notifier.textColor,
                              ),
                            ),
                          ),
                        ),
                        body: Container(
                          color: notifier.bottomSheetColor,
                          height: height / 1,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: StatefulBuilder(
                              builder: (context, setState) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Filter Course",
                                      style: TextStyle(
                                        fontFamily: "Manrope_bold",
                                        fontWeight: FontWeight.w700,
                                        color: notifier.textColor,
                                        fontSize: 20,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(
                                          () {
                                            value = 0;
                                          },
                                        );
                                      },
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        height: 56,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                            color: value == 0
                                                ? const Color(0xff0056D2)
                                                : notifier.textField,
                                            width: 1,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Text(
                                                "All Level",
                                                style: TextStyle(
                                                  fontFamily: "Manrope_medium",
                                                  fontWeight: FontWeight.w400,
                                                  color: notifier.textColor,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            radioButton(0),
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(
                                          () {
                                            value = 1;
                                          },
                                        );
                                      },
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        height: 56,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              color: value == 1
                                                  ? const Color(0xff0056D2)
                                                  : notifier.textField,
                                              width: 1),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Text(
                                                "Beginner",
                                                style: TextStyle(
                                                  fontFamily: "Manrope_medium",
                                                  fontWeight: FontWeight.w400,
                                                  color: notifier.textColor,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            radioButton(1),
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(
                                          () {
                                            value = 2;
                                          },
                                        );
                                      },
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        height: 56,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              color: value == 2
                                                  ? const Color(0xff0056D2)
                                                  : notifier.textField,
                                              width: 1),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Text(
                                                "Intermediate",
                                                style: TextStyle(
                                                  fontFamily: "Manrope_medium",
                                                  fontWeight: FontWeight.w400,
                                                  color: notifier.textColor,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            radioButton(2),
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(
                                          () {
                                            value = 3;
                                          },
                                        );
                                      },
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        height: 56,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              color: value == 3
                                                  ? const Color(0xff0056D2)
                                                  : notifier.textField,
                                              width: 1),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Text(
                                                "Master",
                                                style: TextStyle(
                                                  fontFamily: "Manrope_medium",
                                                  fontWeight: FontWeight.w400,
                                                  color: notifier.textColor,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            radioButton(3),
                                          ],
                                        ),
                                      ),
                                    ),
                                    button(
                                      text: "Apply",
                                      color: const Color(0xff0056D2),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/filter_icon.png", scale: 2.5),
                    SizedBox(width: width / 30),
                    const Text("Filter"),
                    SizedBox(width: width / 20),
                    Container(
                      width: 1,
                      height: 30,
                      color: Colors.grey,
                      child: const VerticalDivider(),
                    ),
                    SizedBox(width: width / 40),
                    const Icon(CupertinoIcons.sort_down),
                    SizedBox(width: width / 30),
                    const Text("Sorting"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget radioButton(int index) {
    return SizedBox(
      height: 20,
      width: 20,
      child: OutlinedButton(
        onPressed: () {
          value = index;
          setState(() {});
        },
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            color: (value == index)
                ? const Color(0xff0056D2)
                : const Color(0xffE2E8F0),
            width: (value == index) ? 6 : 2,
          ),
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(0),
        ),
        child: const Text(""),
      ),
    );
  }
}
