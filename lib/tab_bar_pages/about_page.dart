import 'package:flutter/material.dart';
import 'package:proficie/tab_bar_pages/available_slot_page.dart';
import 'package:provider/provider.dart';

import '../model/overview_model.dart';
import '../model/theme_model.dart';


class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: notifier.background,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              "Overview",
              style: TextStyle(
                fontFamily: "Manrope_bold",
                fontSize: 18,
                color: notifier.textColor,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.2,
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: overview.length,
              itemBuilder: (context, index) {
                OverviewModel data = overview[index];
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  minLeadingWidth: 20,
                  leading: Image.asset(
                    data.image,
                    scale: 2.9,
                    color: notifier.textColorGrey,
                  ),
                  title: Text(
                    data.desc,
                    style:  TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "Manrope_bold",
                      fontSize: 12,
                      color: notifier.textColor,
                      letterSpacing: 0.2,
                    ),
                  ),
                );
              },
            ),

             Padding(
               padding: const EdgeInsets.only(left: 37),
               child: Text("Available Course",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 13),),
             ),
            SizedBox(height: height / 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.black,
                  child: TextButton(onPressed: () {

                    showModalBottomSheet(context: context, builder: (context) {
                      return Container(
                        color: Colors.white70,
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: AvailableSlotPage(),
                      );
                    },);

                  }, child: Text("Pre Recorded",style: TextStyle(color: Colors.white,fontSize: 11),)),
                ),

                Container(
                  color: Colors.black,
                  child: TextButton(onPressed: () {

                  }, child: Text("Online Live Classes",style: TextStyle(color: Colors.white,fontSize: 11),)),
                ),

                Container(
                  color: Colors.black,
                  child: TextButton(onPressed: () {
                  //  Navigator.push(context, MaterialPageRoute(builder: (context) => AvailableSlotPage(),));
                    showModalBottomSheet(context: context, builder: (context) {
                      return Container(
                        color: Colors.white70,
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: AvailableSlotPage(),
                      );
                    },);

                  }, child: Text("Physical Classes",style: TextStyle(color: Colors.white,fontSize: 11),)),
                ),
              ],
            ),
            SizedBox(height: height / 60),
             Text(
              "Mentor",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: "Manrope_bold",
                fontSize: 18,
                color: notifier.textColor,
                letterSpacing: 0.2,
              ),
            ),
            Card(
              child: ExpansionTile(
                    title:  Text(
                      "Alex Adams",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: "Manrope_bold",
                        fontSize: 16,
                        color: notifier.textColor,
                        letterSpacing: 0.4,
                      ),
                    ),
                    subtitle: const Text(
                      "UI UX Design",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: "Manrope_semibold",
                        fontSize: 12,
                        color: Color(0xff64748B),
                        letterSpacing: 0.2,
                      ),
                    ),
                leading: Image.asset("assets/images/overview_1.png"),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6,bottom: 3,),
                    child: Text(
                      "A mentor for a course in product design typically provides guidance and support to students learning about the process of designing and developing products.",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: notifier.mentorDetailTextColor,
                        fontFamily: "Manrope_medium",
                        fontSize: 14,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: height / 50),
             Text(
              "Keypoint",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: "Manrope_bold",
                fontSize: 18,
                color: notifier.textColor,
                letterSpacing: 0.2,
              ),
            ),
            SizedBox(height: height / 64),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: keypoint.length,
              itemBuilder: (context, index) {
                KeypointModel data = keypoint[index];
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  leading: Image.asset("assets/icons/keypoint.png",scale: 2.5,),
                  minLeadingWidth: 20,
                  title: Text(
                    data.desc,
                    style:  TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "Manrope_semibold",
                      fontSize: 12,
                      color: notifier.textColor,
                      letterSpacing: 0.2,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}