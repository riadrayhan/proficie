import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../model/theme_model.dart';
import '../../widget/button.dart';

class MentorScreen extends StatefulWidget {
  const MentorScreen({super.key});

  @override
  State<MentorScreen> createState() => _MentorScreenState();
}

class _MentorScreenState extends State<MentorScreen> {
  int selectIndex = 0;
  List tabContain = [
    {
      "image": "assets/icons/diamond.png",
      'text': 'Design',
    },
    {
      "image": "assets/icons/document-text.png",
      'text': "Business",
    },
    {
      "image": "assets/icons/chart-pie.png",
      'text': 'Technology',
    },
    {
      "image": "assets/icons/cpu.png",
      'text': 'Arts & Humanities',
    },
  ];
  List text = [
    'Design',
    "Business",
    'Technology',
    'Arts & Humanities',
  ];
  bool switchState = false;
  String selectedFilter = "All Level";

  ColorNotifire notifier = ColorNotifire();

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
    return Scaffold(
      backgroundColor: notifier.background,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: notifier.background,
        automaticallyImplyLeading: false,
        elevation: 0,
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
            SizedBox(width: width / 9.5),
            Text(
              "Most Popular Course",
              style: TextStyle(
                fontFamily: "Manrope_bold",
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: notifier.textColor,
              ),
            ),
          ],
        ),
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
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      padding: const EdgeInsets.only(right: 15),
                                      height: 56,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
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
                                            padding:
                                            const EdgeInsets.only(left: 20),
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
                                      padding: const EdgeInsets.only(right: 15),
                                      height: 56,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: value == 1
                                                ? const Color(0xff0056D2)
                                                : notifier.textField, width: 1),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(left: 20),
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
                                      padding: const EdgeInsets.only(right: 15),
                                      height: 56,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: value == 2
                                                ? const Color(0xff0056D2)
                                                : notifier.textField, width: 1),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(left: 20),
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
                                      padding: const EdgeInsets.only(right: 15),
                                      height: 56,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: value == 3
                                                ? const Color(0xff0056D2)
                                                : notifier.textField, width: 1),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(left: 20),
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
    );
  }

  Widget buttonMentor(
      {required String text, required Color color, void Function()? onPress}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 16,
      width: MediaQuery.of(context).size.width / 2.5,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        onPressed: onPress,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            fontFamily: 'Manrope_bold',
            color: Colors.white,
            letterSpacing: 0.2,
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
