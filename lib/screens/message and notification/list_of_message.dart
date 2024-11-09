import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../model/message_model.dart';
import '../../model/theme_model.dart';
import '../../widget/button.dart';
import 'message_details.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  bool switchState = false;
  int value  = 0;
  var currentIndex = 0;
  ColorNotifire notifier = ColorNotifire();
  List<String> items = [];

  late ScrollController hideButtonController;
  dynamic isVisible;

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
              "Message",
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
              width: width / 4.7,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xff040f3a)),
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
                    color: Colors.black
                  ),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                "assets/images/add_icon_2.png",
                color: notifier.isDark ? Colors.white : null,
                width: width / 8,
                height: height / 8,
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        controller: hideButtonController,
        shrinkWrap: true,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(15),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(2),
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: notifier.textField,
                        width: 1,
                      ),
                    ),
                    child: TextFormField(
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Manrope_bold',
                        letterSpacing: 0.3,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("search");
                          },
                          child: Image.asset(
                            "assets/icons/Search.png",
                            scale: 2.7,
                            color: const Color(0xff94A3B8),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Search course/mentor",
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: notifier.textField,
                          fontFamily: 'Manrope_semibold',
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height / 30),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: message.length,
                    itemBuilder: (context, index) {
                      MessageModel messages = message[index];
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => MessageDetail(
                                      name: messages.name,
                                      image: messages.image,
                                      time: messages.time,
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Image.asset(
                                    messages.image,
                                    scale: 5.8,
                                  ),
                                  SizedBox(width: width / 40),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        messages.name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          fontFamily: "Manrope_bold",
                                          letterSpacing: 0.3,
                                          color: notifier.textColor,
                                        ),
                                      ),
                                      SizedBox(height: height / 100),
                                      Text(
                                        messages.message,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          fontFamily: "Manrope_semibold",
                                          letterSpacing: 0.2,
                                          color: Color(0xff64748B),
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        messages.time,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          fontFamily: "Manrope_semibold",
                                          letterSpacing: 0.2,
                                          color: Color(0xff64748B),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: height / 100),
                                      const Icon(
                                        Icons.check_outlined,
                                        color: Color(0xff64748B),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Visibility(
        visible: isVisible,
        child: Align(
          alignment: const Alignment(0, 0.93),
          child: GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: width / 1.6,
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
                                      "Filter Message",
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
                                                "All Message",
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
                                                "Unread Message",
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
                                                "Unanswered Message",
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
                                        color: const Color(0xff0056D2))
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
                    Image.asset("assets/icons/filter_icon.png", scale: 2.5),
                    SizedBox(width: width / 30),
                    const Text("Filter",style: TextStyle(color: Colors.white),),
                    SizedBox(width: width / 20),
                    Container(
                      width: 1,
                      height: 30,
                      color: Colors.grey,
                      child: const VerticalDivider(),
                    ),
                    SizedBox(width: width / 40),
                    const Icon(CupertinoIcons.sort_down,color: Colors.white54,),
                    SizedBox(width: width / 30),
                    const Text("Sorting",style: TextStyle(color: Colors.white),),
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
