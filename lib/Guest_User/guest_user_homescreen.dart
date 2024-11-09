import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../globals/list_grid_view_global.dart';
import '../../model/home_category_model.dart';
import '../../model/list_mentor_model.dart';
import '../../model/theme_model.dart';
import '../../widget/share_button_contain.dart';
import '../screens/course/details_of_mentors.dart';

class GuestUser_HomeScreen extends StatefulWidget {
  const GuestUser_HomeScreen({super.key});

  @override
  State<GuestUser_HomeScreen> createState() => _GuestUser_HomeScreenState();
}

class _GuestUser_HomeScreenState extends State<GuestUser_HomeScreen> {

  ColorNotifire notifier = ColorNotifire();
  double sliderValue = 00;
  double sliderValueGrid = 0;
  var currentIndex = 0;
  bool isFirstClick = true; // This will track if it's the first click


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadClickState(); // Load the saved click state when the app starts
  }
// Function to load the stored click state from SharedPreferences
  Future<void> _loadClickState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isFirstClick = prefs.getBool('isFirstClick') ?? true; // Default to true if not set
    });
  }

  // Function to update the click state in SharedPreferences
  Future<void> _updateClickState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstClick', value);
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
        backgroundColor: notifier.background,
        elevation: 0,
        leading: Image.asset(
          "assets/images/avatar.png",
          scale: 7.5,
        ),
        leadingWidth: 65,
        titleSpacing: -0,
        title: Text(
          "Hello, Elon Musk!",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.4,
              color: notifier.textColor,
              fontFamily: "Manrope_bold"),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed("notification");
            },
            child: Image.asset(
              "assets/icons/bell_icon.png",
              color: notifier.isDark ? Colors.white : null,
              scale: 3.3,
            ),
          ),
          SizedBox(width: width / 35),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Text(
                  "Let's learn something new today!",
                  style: TextStyle(
                    fontSize: 30,
                    color: notifier.textColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Manrope_bold",
                  ),
                ),
                const SizedBox(height: 20),
                container(),
                const SizedBox(height: 20),
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: category.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                    itemBuilder: (context, index) {
                      CategoryModel data = category[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("course");
                          },
                          child: Column(
                            children: [
                              Container(
                                height:26,
                                color: Colors.black,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    data.name_1,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Manrope_bold",
                                      letterSpacing: 0.2,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Latest Course",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: notifier.textColor,
                        fontFamily: "Manrope_bold",
                        letterSpacing: 0.2,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed("latest_see_all");
                      },
                      child: const Text(
                        "SEE ALL",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff0056D2),
                          fontWeight: FontWeight.w700,
                          fontFamily: "Manrope_bold",
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height / 35),
                Container(
                  height: height / 2.1,
                  color: notifier.background,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: gridItem.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (isFirstClick) {
                            Navigator.of(context).pushNamed("sign_up");
                            setState(() {
                              isFirstClick = false;
                            });
                            _updateClickState(false); // Save the updated state in SharedPreferences
                          } else {
                            Navigator.of(context).pushNamed("detail_course");
                          }
                          // Navigator.of(context).pushNamed("detail_course");
                        },
                        child: Container(
                          padding: const EdgeInsets.only(right: 20),
                          width: width / 1.2,
                          color: notifier.background,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: height / 4.8,
                                width: width / 1.2,
                                decoration: BoxDecoration(
                                  color: notifier.background,
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                  ),
                                  image: const DecorationImage(
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
                                padding:
                                const EdgeInsets.only(right: 10, left: 10),
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
                                padding:
                                const EdgeInsets.only(right: 10, left: 10),
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
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          size: 22,
                                          color: Color(0xffF9AA00),
                                        ),
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
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 10, left: 10, top: 0),
                                child: slider(),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(right: 10, left: 10),
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
                                      "${sliderValueGrid.toInt()}%",
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
                                padding: const EdgeInsets.only(
                                    right: 10, left: 10, top: 4),
                                child: Row(
                                  children: [
                                    Image.asset(
                                        "assets/icons/download_icon.png",
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
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: height / 120),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Most Popular Course",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: notifier.textColor,
                        fontFamily: "Manrope_bold",
                        letterSpacing: 0.2,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed("most_popular_course");
                      },
                      child: const Text(
                        "SEE ALL",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff0056D2),
                          fontWeight: FontWeight.w700,
                          fontFamily: "Manrope_bold",
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height / 60),
                SizedBox(
                  width: width,
                  height: height / 2.1,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: gridItem.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (isFirstClick) {
                            Navigator.of(context).pushNamed("sign_up");
                            setState(() {
                              isFirstClick = false;
                            });
                            _updateClickState(false); // Save the updated state in SharedPreferences
                          } else {
                            Navigator.of(context).pushNamed("course");
                          }
                          //  Navigator.of(context).pushNamed("course");
                        },
                        child: SizedBox(
                          width: width / 1.9,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  gridItem[index]['image'],
                                  height: height / 3.5,
                                  width: width / 1.5,
                                ),
                                Text(
                                  gridItem[index]['desc'],
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: notifier.textColor,
                                    fontFamily: "Manrope_bold",
                                    letterSpacing: 0.4,
                                  ),
                                ),
                                SizedBox(height: height / 120),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      gridItem[index]['name'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: notifier.textColor,
                                        fontFamily: "Manrope_bold",
                                        letterSpacing: 0.3,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          size: 22,
                                          color: Color(0xffF9AA00),
                                        ),
                                        Text(
                                          gridItem[index]['rate'],
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: notifier.textColor,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Manrope_bold",
                                            letterSpacing: 0.3,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height / 60,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                        "assets/icons/download_icon.png",
                                        width: width / 25),
                                    SizedBox(width: width / 35),
                                    Text(
                                      "5 Module...",
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
                                      "510.0 MB",
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
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: height / 120),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Most Popular Mentor",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Manrope_bold",
                        color: notifier.textColor,
                        letterSpacing: 0.2,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed("most_popular_mentor");
                      },
                      child: const Text(
                        "SEE ALL",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff0056D2),
                          fontWeight: FontWeight.w700,
                          fontFamily: "Manrope_bold",
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height / 35),
                SizedBox(
                  width: width,
                  height: height / 3.5,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: mentors.length,
                    itemBuilder: (context, index) {
                      Mentors mentor = mentors[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Container(
                          width: width / 2.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/mentor.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                width: width / 2.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/images/mentor_image_overlay.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(right: 25, top: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(25),
                                            ),
                                          ),
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const ShareButton();
                                          },
                                        );
                                      },
                                      child: Image.asset(
                                        "assets/icons/mentor_backarrow.png",
                                        height: height / 32,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, top: 45, bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: height / 30),
                                    Text(
                                      mentor.name,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Manrope_bold",
                                        color: Colors.white,
                                        letterSpacing: 0.3,
                                      ),
                                    ),
                                    SizedBox(height: height / 150),
                                    Text(
                                      mentor.course,
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Manrope_bold",
                                        color: Colors.white,
                                        letterSpacing: 0.2,
                                      ),
                                    ),
                                    SizedBox(height: height / 60),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          size: 20,
                                          color: Color(0xffF9AA00),
                                        ),
                                        Text(
                                          mentor.rate,
                                          style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Manrope_bold",
                                            color: Colors.white,
                                            letterSpacing: 0.2,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    buttonMentor(
                                      text: "Follow",
                                      color: const Color(0xff0056D2),
                                      onPress: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => DetailScreen(
                                              name: mentor.name,
                                              rate: mentor.rate,
                                              course: mentor.course,
                                              image: mentor.imageUrl,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
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
        max: 1000,
        value: sliderValue,
        onChanged: (double val) {
          setState(() {
            sliderValue = val;
          });
        },
      ),
    );
  }

  Widget container() {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 310,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color(0xff2472E3),
            Color(0xff0550BB),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      "assets/images/avatar.png",
                      scale: 5,
                    ),
                  ),
                  Positioned(
                    left: 1,
                    child: Image.asset(
                      "assets/images/badge.png",
                      scale: 3,
                    ),
                  ),
                ],
              ),
              SizedBox(width: MediaQuery.of(context).size.width / 20),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Elon Musk",
                    style: TextStyle(
                      fontFamily: "Manrope_bold",
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 0.2,
                    ),
                  ),
                  Text(
                    "Congrats you have reach Platinum",
                    style: TextStyle(
                      fontFamily: "Manrope_bold",
                      fontWeight: FontWeight.w400,
                      color: Color(0xff96CBFA),
                      fontSize: 12,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Conqueror",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Manrope_bold",
                  letterSpacing: 0.2,
                ),
              ),
              const Spacer(),
              Text(
                "${sliderValue.toInt()}/1000",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Manrope_bold",
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
          SliderTheme(
            data: SliderThemeData(
              activeTrackColor: const Color(0xffF9AA00),
              inactiveTrackColor: Colors.white,
              trackHeight: 6,
              thumbShape: const RoundSliderOverlayShape(),
              trackShape: CustomTrackShape(),
            ),
            child: Slider(
              min: 00,
              max: 1000,
              value: sliderValue,
              onChanged: (double val) {
                setState(() {
                  sliderValue = val;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed("my_learning");
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 66,
                  width: 93,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/Home.png",
                        scale: 3,
                      ),
                      const Text(
                        "53 Course",
                        style: TextStyle(
                          fontFamily: "Manrope_bold",
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 10,
                          letterSpacing: 0.2,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 66,
                width: 93,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "assets/images/Home_2.png",
                      scale: 3,
                    ),
                    const Text(
                      "20 Hours",
                      style: TextStyle(
                        fontFamily: "Manrope_bold",
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 10,
                        letterSpacing: 0.2,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 66,
                width: 93,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "assets/images/Home_3.png",
                      scale: 3,
                    ),
                    const Text(
                      "120 Modules",
                      style: TextStyle(
                        fontFamily: "Manrope_bold",
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 10,
                        letterSpacing: 0.2,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(2),
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextFormField(
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Manrope_bold',
                color: notifier.textColor,
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
                    color: const Color(0xff0F172A),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                hintText: "Search course/mentor",
                contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Manrope_semibold',
                  color: notifier.textColorGrey,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonMentor(
      {required String text, required Color color, void Function()? onPress}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 20,
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

  Widget sliderGrid() {
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
        value: sliderValueGrid,
        onChanged: (double val) {
          setState(() {
            sliderValueGrid = val;
          });
        },
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
