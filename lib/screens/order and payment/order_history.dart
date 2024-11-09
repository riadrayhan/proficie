import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/theme_model.dart';
import '../../widget/button.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  ColorNotifire notifier = ColorNotifire();
  String selectedFilter = "All Level";

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: notifier.background,
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
                width: width / 7.8,
                color: notifier.isDark ? Colors.white : null,
              ),
            ),
            SizedBox(width: width / 4.9),
            Text(
              "Order History",
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
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 57,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: notifier.textField,
                    width: 1,
                  ),
                ),
                child: TextField(
                  style: TextStyle(
                      fontFamily: 'Manrope_bold',
                      fontSize: 14,
                      color: notifier.textColor,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.3),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/icons/Search.png",
                        scale: 3,
                        color: const Color(0xff94A3B8),
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(18),
                    hintText: "Search order history...",
                    hintStyle: TextStyle(
                        fontFamily: 'Manrope_bold',
                        fontSize: 14,
                        color: notifier.textField,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: height / 35),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed("Order_history_detail");
                },
                child: Container(
                  height: height / 4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: notifier.textField, width: 0.9),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 50),
                          child: Text(
                            "Prototyping and Testing: Perfecting Your UI/UX Design",
                            style: TextStyle(
                              fontFamily: "Manrope_bold",
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.3,
                              color: notifier.textColor,
                            ),
                          ),
                        ),
                        SizedBox(height: height / 60),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/avatar.png",
                              height: height / 25,
                            ),
                            SizedBox(width: width / 35),
                            Text(
                              "Kierra Torff",
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
                        Divider(
                          height: 1,
                          thickness: 1,
                          color: notifier.dividedColor,
                        ),
                        Row(
                          children: [
                            Image.asset(
                                "assets/images/order_history_calendar.png",
                                scale: 2.5),
                            SizedBox(width: width / 45),
                            Text(
                              "7 Feb 2023",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                fontFamily: "Manrope_bold",
                                color: notifier.textColor,
                                letterSpacing: 0.2,
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              "\$354.0",
                              style: TextStyle(
                                fontFamily: "Manrope_bold",
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.2,
                                color: Color(0xff0056D2),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: height / 35),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed("Order_history_detail");
                },
                child: Container(
                  height: height / 4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: notifier.textField, width: 0.9),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 50),
                          child: Text(
                            "User-Centered Design Process: Research to Launch",
                            style: TextStyle(
                              fontFamily: "Manrope_bold",
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.3,
                              color: notifier.textColor,
                            ),
                          ),
                        ),
                        SizedBox(height: height / 60),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/message_1.png",
                              height: height / 25,
                            ),
                            SizedBox(width: width / 35),
                            Text(
                              "Jordyn",
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
                        Divider(
                          height: 1,
                          thickness: 1,
                          color: notifier.dividedColor,
                        ),
                        Row(
                          children: [
                            Image.asset(
                                "assets/images/order_history_calendar.png",
                                scale: 2.5),
                            SizedBox(width: width / 45),
                            Text(
                              "11 Jan 2023",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                fontFamily: "Manrope_bold",
                                color: notifier.textColor,
                                letterSpacing: 0.2,
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              "\$251.0",
                              style: TextStyle(
                                fontFamily: "Manrope_bold",
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.2,
                                color: Color(0xff0056D2),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: height / 35),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed("Order_history_detail");
                },
                child: Container(
                  height: height / 4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: notifier.textField, width: 0.9),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 50),
                          child: Text(
                            "UI/UX Design Fundamentals: From Wireframe to Prototype",
                            style: TextStyle(
                              fontFamily: "Manrope_bold",
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.3,
                              color: notifier.textColor,
                            ),
                          ),
                        ),
                        SizedBox(height: height / 60),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/message_2.png",
                              height: height / 25,
                            ),
                            SizedBox(width: width / 35),
                            Text(
                              "Desirae Siphron",
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
                        Divider(
                          height: 1,
                          thickness: 1,
                          color: notifier.dividedColor,
                        ),
                        Row(
                          children: [
                            Image.asset(
                                "assets/images/order_history_calendar.png",
                                scale: 2.5),
                            SizedBox(width: width / 45),
                            Text(
                              "30 Des 2022",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                fontFamily: "Manrope_bold",
                                color: notifier.textColor,
                                letterSpacing: 0.2,
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              "\$332.0",
                              style: TextStyle(
                                fontFamily: "Manrope_bold",
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.2,
                                color: Color(0xff0056D2),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Align(
        alignment: const Alignment(0, 0.97),
        child: GestureDetector(
          onTap: () {},
          child: SizedBox(
            width: width / 3,
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
                                  Container(
                                    height: 56,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: notifier.textField,
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
                                        Radio(
                                          activeColor: const Color(0xff0056D2),
                                          value: "All Message",
                                          groupValue: selectedFilter,
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                selectedFilter = value!;
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 56,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: notifier.textField, width: 1),
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
                                        Radio(
                                          activeColor: const Color(0xff0056D2),
                                          value: "Unready Message",
                                          groupValue: selectedFilter,
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                selectedFilter = value!;
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 56,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: notifier.textField, width: 1),
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
                                        Radio(
                                          activeColor: const Color(0xff0056D2),
                                          value: "Unanswered Message",
                                          groupValue: selectedFilter,
                                          onChanged: (val) {
                                            setState(
                                              () {
                                                selectedFilter = val!;
                                              },
                                            );
                                          },
                                        ),
                                      ],
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
                  Image.asset("assets/images/order_history_calendar.png",
                      color: Colors.white, scale: 2),
                  SizedBox(width: width / 35),
                  const Text(
                    "Date Range",
                    style: TextStyle(
                      fontFamily: "Manrope_bold",
                      fontSize: 12,
                      color: Colors.white,
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
}
