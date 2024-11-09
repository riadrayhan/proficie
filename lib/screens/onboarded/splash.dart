import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/theme_model.dart';
import '../home/home_page.dart';
import 'onboard_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ColorNotifire notifire = ColorNotifire();

  void initialization() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const OnBoardingScreen(),
           // builder: (context) => const HomeScreen(),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    initialization();
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/splash_logo.png",
              scale: 8,
              color: notifire.imageColor,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),
          Text(
            "SkillMaster",
            style: TextStyle(
              color: notifire.textColor,
              fontSize: 30,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.3,
              fontFamily: "Manrope_semibold",
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: notifire.background,
        elevation: 0,
        height: 50,
        child: const Center(
          child: Text(
            "Version 0.0.1",
            style: TextStyle(
                color: Color(0xff94A3B8),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: "Manrope_semibold",
                letterSpacing: 0.3),
          ),
        ),
      ),
    );
  }
}
