import 'package:flutter/material.dart';
import 'package:proficie/screens/learning/live_class.dart';
import 'package:proficie/screens/learning/resource/resource_page.dart';
import 'package:proficie/tab_bar_pages/active_course.dart';
import 'package:proficie/tab_bar_pages/dowloaded_course.dart';

class LearningScreen extends StatelessWidget {
  const LearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text('MyCourse',style: TextStyle(color: Colors.black),),
            centerTitle: true,
            backgroundColor: Colors.white54,
            bottom: TabBar(
              automaticIndicatorColorAdjustment: true,
              tabs: [
                Tab(icon: Icon(Icons.book), text: "Active Course",),
                Tab(icon: Icon(Icons.download), text: "Downloaded"),
                Tab(icon: Icon(Icons.live_tv), text: "Live Class"),
                Tab(icon: Icon(Icons.source), text: "Resource"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ActiveCourse(),
              DownloadedCourse(),
              LiveClass(),
              Resource(),
            ],
          ),
        ),
      ),
    );
  }
}