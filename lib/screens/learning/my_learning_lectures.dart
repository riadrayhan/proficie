import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../model/theme_model.dart';
import '../../tab_bar_pages/lectures_page.dart';
import '../../tab_bar_pages/more_page.dart';

class MyLearningLectures extends StatefulWidget {
  const MyLearningLectures({super.key});

  @override
  State<MyLearningLectures> createState() => _MyLearningLecturesState();
}

class _MyLearningLecturesState extends State<MyLearningLectures> {
  ColorNotifire notifier = ColorNotifire();

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'x4DydJKVvQk',
    flags: const YoutubePlayerFlags(
      autoPlay: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: notifier.background,
        appBar: AppBar(
          backgroundColor: notifier.background,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Image.asset(
                  "assets/icons/close_icon_black.png",
                  width: width / 7.8,
                  color: notifier.isDark ? Colors.white : null,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  "assets/images/more_vert_icon.png",
                  width: width / 8,
                  color: notifier.isDark ? Colors.white : null,
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScroll) {
              return [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: YoutubePlayer(
                          controller: _controller,
                          showVideoProgressIndicator: true,
                          progressIndicatorColor: Colors.amber,
                          progressColors: const ProgressBarColors(
                            playedColor: Colors.amber,
                            handleColor: Colors.amberAccent,
                          ),
                          onReady: () {
                            _controller.addListener(() {});
                          },
                        ),
                      ),
                      // Image.asset("assets/images/learning_video.png"),
                      SizedBox(height: height / 50),
                      Text(
                        "Introduction to UI/UX design and animation",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Manrope_bold",
                          fontWeight: FontWeight.w700,
                          color: notifier.textColor,
                        ),
                      ),
                      SizedBox(height: height / 100),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/course_detail_avtar.png",
                            width: width / 12,
                          ),
                          SizedBox(width: width / 35),
                          Text(
                            "Emerson Siphron",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Manrope_semibold",
                              fontWeight: FontWeight.w600,
                              color: notifier.textColor,
                              letterSpacing: 0.3,
                            ),
                          ),
                          SizedBox(width: width / 35),
                          Container(
                            height: 20,
                            width: 1,
                            color: Colors.grey,
                            child: const VerticalDivider(),
                          ),
                          SizedBox(width: width / 35),
                          Text(
                            "UI UX Design ",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Manrope_mediumbold",
                              fontWeight: FontWeight.w400,
                              color: notifier.textColor,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height / 50),
                      Container(
                        alignment: Alignment.center,
                        height: height / 10,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: notifier.tabColor,
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 15, left: 15, top: 10, bottom: 10),
                          child: TabBar(
                            physics: const BouncingScrollPhysics(),
                            labelColor: notifier.tabTextColor,
                            labelStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Manrope_bold",
                              letterSpacing: 0.2,
                            ),
                            unselectedLabelColor: notifier.textColor,
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: notifier.textColor,
                            ),
                            tabs: const [
                              Tab(
                                child: Text("Lectures"),
                              ),
                              Tab(
                                child: Text("More"),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height / 35),
                    ],
                  ),
                ),
              ];
            },
            body: const TabBarView(
              physics: BouncingScrollPhysics(),
              children: [
                LectureScreen(),
                MoreScreen(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          alignment: Alignment.center,
          color: notifier.isDark ? const Color(0xff1E293B) :const Color(0xffF9F9F9),
          height: height / 10,
          child: Padding(
            padding:
                const EdgeInsets.only(right: 15, left: 15, top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Download All",
                      style: TextStyle(
                        fontFamily: "Manrope_semibold",
                        fontSize: 14,
                        color: notifier.textColor,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.3,
                      ),
                    ),
                    Text(
                      "1.2 GB",
                      style: TextStyle(
                        fontFamily: "Manrope_semibold",
                        fontSize: 12,
                        color: notifier.textColorGrey,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
                buttonDownload(onPress: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buttonDownload({required void Function()? onPress}) {
    return SizedBox(
      height: 48,
      width: 158.5,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(notifier.isDark ? Colors.white : const Color(0xff0056D2),),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        onPressed: onPress,
        child: Text(
          "Download",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: 'Manrope_bold',
            color: notifier.isDark ? const Color(0xff0F172A) : Colors.white,
            letterSpacing: 0.4,
          ),
        ),
      ),
    );
  }
}
