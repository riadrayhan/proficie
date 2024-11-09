import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/theme_model.dart';
import '../../tab_bar_pages/invite_pages.dart';
import '../../tab_bar_pages/status_page.dart';

class ReferralCode extends StatefulWidget {
  const ReferralCode({super.key});

  @override
  State<ReferralCode> createState() => _ReferralCodeState();
}

class _ReferralCodeState extends State<ReferralCode> {
  ColorNotifire notifier = ColorNotifire();

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
                  width: width / 7.5,
                  color: notifier.isDark ? Colors.white : null,
                ),
              ),
              SizedBox(width: width / 5.5),
              Text(
                "Refferal Program",
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
        body: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15, right: 15, left: 15,top: 15),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: height / 10,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: notifier.isDark ? const Color(0xff1E293B) : const Color(0xffF9F9F9),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15, left: 15),
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
                              borderRadius: BorderRadius.circular(50),
                              color: notifier.textColor,
                            ),
                            tabs: const [
                              Tab(child: Text("Invite")),
                              Tab(child: Text("Status")),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: const TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              InviteScreen(),
              StatusScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
