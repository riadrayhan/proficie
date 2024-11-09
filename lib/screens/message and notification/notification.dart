import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/notification_model.dart';
import '../../model/theme_model.dart';
import '../../widget/button.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  ColorNotifire notifier = ColorNotifire();
  int value = 0;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: notifier.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: notifier.background,
        elevation: 0,
        title: Row(
          children: [
            Text(
              "Notification",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: notifier.textColor,
                fontSize: 20,
                fontFamily: "Manrope_bold",
              ),
            ),
            SizedBox(width: width / 30),
            SizedBox(
              height: height / 28,
              width: width / 5.5,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xffF4462C)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "2 NEW",
                  style: TextStyle(
                    fontFamily: "Manrope_bold",
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Image.asset(
                "assets/icons/close_icon_1.png",
                color: notifier.isDark ? Colors.white : null,
                width: width / 8,
                height: height / 8,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: notification.length,
          itemBuilder: (context, index) {
            NotificationModel data = notification[index];
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Image.asset(data.image, scale: 2.5),
              title: Text(
                data.name,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  fontFamily: "Manrope_bold",
                  letterSpacing: 0.3,
                  color: notifier.textColor,
                ),
              ),
              subtitle: Text(
                data.desc,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  fontFamily: "Manrope_semibold",
                  letterSpacing: 0.2,
                  color: notifier.textColorGrey,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Text(
                data.status,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  fontFamily: "Manrope_semibold",
                  letterSpacing: 0.2,
                  color: notifier.textColorGrey,
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Align(
        alignment: const Alignment(0, 0.97),
        child: GestureDetector(
          onTap: () {},
          child: SizedBox(
            width: width / 3.3,
            child: FloatingActionButton.extended(
              backgroundColor: notifier.floatingAction,
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: notifier.bottomNavigationColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return Scaffold(
                      backgroundColor: notifier.bottomNavigationColor,
                      floatingActionButton: Align(
                        alignment: const Alignment(0.10, -1.2),
                        child: Container(
                          transform: Matrix4.translationValues(0.0, -30, 0.0),
                          child: FloatingActionButton(
                            backgroundColor: notifier.bottomNavigationColor,
                            onPressed: () {},
                            child: Icon(
                              Icons.close,
                              color: notifier.textColor,
                            ),
                          ),
                        ),
                      ),
                      body: SizedBox(
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
                                    "Sort Notification",
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
                                              "All Status",
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
                                              "Already Read",
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
                                              "Unread",
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
              isExtended: true,
              label: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(CupertinoIcons.sort_down),
                  SizedBox(width: width / 35),
                  const Text(
                    "Sorting",
                    style: TextStyle(
                      fontFamily: "Manrope_bold",
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
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
