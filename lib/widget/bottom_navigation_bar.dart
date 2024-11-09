import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/theme_model.dart';
import '../screens/account and setting/my_account.dart';
import '../screens/bookmark/bookmark_page.dart';
import '../screens/home/home_page.dart';
import '../screens/learning/my_learning.dart';
import '../screens/message and notification/list_of_message.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int currentIndex = 0;
  ColorNotifire notifier = ColorNotifire();
  List<Widget> myChildren = [
    const HomeScreen(),
    const Bookmark(),
    const LearningScreen(),
    const MessageScreen(),
    const MyAccount(),
  ];

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: notifier.background,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff0056D2),
        child: Image.asset(
          "assets/images/floating_icon.png",
          scale: 2.7,
        ),
        onPressed: () {
          setState(() {
            currentIndex = 2;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: notifier.bottomNavigationColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        elevation: 0,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        unselectedItemColor: const Color(0xff64748B),
        selectedItemColor: notifier.imageColor,
        unselectedLabelStyle: const TextStyle(
          fontFamily: "Manrope_bold",
          fontSize: 10,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
        selectedLabelStyle: const TextStyle(
          fontFamily: "Manrope_bold",
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: Color(0xff0056D2),
          letterSpacing: 0.2,
        ),
        items: [
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Image.asset("assets/icons/bottom_home.png",
                    color: const Color(0xff64748B), height: height / 35),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Image.asset(
                  "assets/icons/bottom_home_filled.png",
                  color: notifier.imageColor,
                  height: height / 35,
                ),
              ),
              label: "HomePage"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Image.asset(
                  "assets/icons/bottom_bookmark.png",
                  color: const Color(0xff64748B),
                  height: height / 35,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Icon(
                  Icons.bookmark_outlined,
                  color: notifier.imageColor,
                ),
              ),
              label: "Bookmark"),
          const BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(""),
              ),
              label: "My Course"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Image.asset(
                  "assets/icons/bottom_message.png",
                  color: const Color(0xff64748B),
                  height: height / 30,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Image.asset(
                  "assets/icons/bottom_message_fill.png",
                  color: notifier.imageColor,
                  height: height / 30,
                ),
              ),
              label: "Message"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Image.asset("assets/images/avatar.png",
                    height: height / 30),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: CircleAvatar(
                  radius: 13,
                  backgroundColor: notifier.isDark ? Colors.white : const Color(0xff0056D2),
                  child: Image.asset("assets/images/avatar.png",
                      height: height / 30),
                ),
              ),
              label: "Profile"),
        ],
      ),
      body: myChildren[currentIndex],
    );
  }
}
