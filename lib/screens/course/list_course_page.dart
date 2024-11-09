import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../model/theme_model.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  bool switchState = false;
  int selectIndex = 0;
  List text = ['Design', "Business", 'Technology', 'Arts & Humanities'];
  List image = [
    "assets/icons/diamond.png",
    "assets/icons/document-text.png",
    "assets/icons/chart-pie.png",
    "assets/icons/cpu.png",
  ];

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
  String selectedFilter = "All Level";
  ColorNotifire notifier = ColorNotifire();

  dynamic isVisible;
  late ScrollController hideButtonController;
  int value = 0;

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

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);

    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: notifier.background,
      appBar: AppBar(
        backgroundColor: notifier.background,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Image.asset(
            "assets/icons/close_icon.png",
            width: width / 7.5,
            color: notifier.isDark ? Colors.white : null,
          ),
        ),
        actions: [
          CupertinoSwitch(
            value: switchState,
            activeColor: const Color(0xff0056D2),
            onChanged: (value) {
              setState(
                () {
                  switchState = value;
                },
              );
            },
          ),
          const SizedBox(width: 15),
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Visibility(
        visible: isVisible,
        child: SizedBox(
          width: width / 1.5,

        ),
      ),
    );
  }


}
