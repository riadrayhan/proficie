import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/theme_model.dart';
import '../../tab_bar_pages/about_page.dart';
import '../../tab_bar_pages/curriculum_page.dart';
import '../../tab_bar_pages/review_page.dart';
import '../../widget/bottom_enroll.dart';
import '../../widget/share_button_contain.dart';

class AboutCourse extends StatefulWidget {
  const AboutCourse({super.key});

  @override
  State<AboutCourse> createState() => _AboutCourseState();
}

class _AboutCourseState extends State<AboutCourse> {
  List text = [
    'About',
    "Curriculum",
    'Review',
  ];
  var selectIndex = 0;
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: notifier.background,
        appBar: AppBar(
          backgroundColor: notifier.background,
          automaticallyImplyLeading: false,
          elevation: 0,
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
                "assets/icons/share_icon_black.png",
                scale: 2.9,
                color: notifier.isDark ? Colors.white : null,
              ),
            ),
            SizedBox(
              width: width / 30,
            ),
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                "assets/icons/bookmark_icon_black.png",
                width: width / 8,
                color: notifier.isDark ? Colors.white : null,
              ),
            ),
            SizedBox(
              width: width / 20,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/about_course.png"),
                      SizedBox(height: height / 35),
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: Text(
                          "Animation is the key of Successfully UI/UX Design",
                          style: TextStyle(
                            fontFamily: "Manrope_bold",
                            fontSize: 30,
                            color: notifier.textColor,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -1,
                          ),
                        ),
                      ),
                      SizedBox(height: height / 60),
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: Text(
                          "Animation plays a crucial role in creating successful UI/UX design. It can help to make interfaces more interactive, engaging, and visually appealing",
                          style: TextStyle(
                            fontFamily: "Manrope_bold",
                            fontSize: 14,
                            color: notifier.textColorGrey,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                      SizedBox(height: height / 20),
                      Container(
                        alignment: Alignment.center,
                        height: height / 10,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: notifier.isDark ? const Color(0xff1E293B) : const Color(0xffF9F9F9),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
                          child: TabBar(
                            physics: const BouncingScrollPhysics(),
                            labelColor: notifier.background,
                            labelStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Manrope_bold",
                              letterSpacing: 0.2,
                            ),
                            unselectedLabelColor: notifier.textColor,
                            indicator: BoxDecoration(
                              color: notifier.textColor,
                              // Set rectangular shape with no borderRadius
                              borderRadius: BorderRadius.circular(8),
                            ),
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicatorWeight: 0, // Removes the underline shadow
                            tabs: const [
                              Tab(child: Text("About")),
                              Tab(child: Text("Curriculum")),
                              Tab(child: Text("Review")),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height / 30),
                    ],
                  ),
                ),
              ];
            },
            body: const TabBarView(
              physics: BouncingScrollPhysics(),
              children: [
                AboutScreen(),
                CurriculumScreen(),
                ReviewScreen(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          alignment: Alignment.center,
          color: notifier.bottomNavigationColor,
          height: height / 8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$354.00",
                  style: TextStyle(
                    fontFamily: "Manrope_bold",
                    fontSize: 24,
                    color: notifier.textColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                buttonEnroll(
                  onPress: () {
                    showModalBottomSheet(
                      backgroundColor: notifier.bottomNavigationColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return const BottomEnroll();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget buttonEnroll({required void Function()? onPress}) {
    return SizedBox(
      height: 45,
      width: 158.5,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xff0056D2)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        onPressed: onPress,
        child: const Text(
          "Enroll Now",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: 'Manrope_bold',
            color: Color(0xffFFFFFF),
            letterSpacing: 0.4,
          ),
        ),
      ),
    );
  }
}
