import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/theme_model.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {

  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: notifier.background,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 15,right: 15,bottom: 15,top: 10),
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/splash_logo.png",
                    color: notifier.imageColor,
                    width: width / 9,
                    height: height / 15,
                  ),
                  Text(
                    "Sign Up Later",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Manrope_bold',
                      fontWeight: FontWeight.w700,
                      color: notifier.imageColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 55),
              Image.asset("assets/images/cover.png"),
              SizedBox(height: MediaQuery.of(context).size.height / 55),
              Text(
                "Let's explore course with our professional mentor!",
                style: TextStyle(
                  fontSize: 25,
                  color: notifier.textColor,
                  fontFamily: 'Manrope_bold',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 55),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  "With our mentors, you will able to learn from real-world experience",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Manrope_semibold',
                    fontWeight: FontWeight.w400,
                    color: notifier.textColorGrey,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 55),
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 12,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff0056D2)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed("login");
                      },
                      child: const Text(
                        "Continue With Email",
                        style: TextStyle(
                          fontFamily: 'Manrope_bold',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 55),
                  Container(
                    height: MediaQuery.of(context).size.height / 12,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: OutlinedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        side: MaterialStateProperty.all(
                          BorderSide(color: notifier.buttonBorder, width: 1.5),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/google_logo.png",
                            scale: 2.5,
                          ),
                          SizedBox(
                            width: width / 40,
                          ),
                          const Text(
                            "Continue With Google",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Manrope_bold',
                              color: Color(0xff0F172A),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 55),
                  Container(
                    height: MediaQuery.of(context).size.height / 12,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: OutlinedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        side: MaterialStateProperty.all(
                          BorderSide(color: notifier.buttonBorder, width: 1.5),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/facebook_logo.png",
                            scale: 2.5,
                          ),
                          SizedBox(
                            width: width / 40,
                          ),
                          const Text(
                            "Continue With Facebook",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Manrope_bold',
                              color: Color(0xff0F172A),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 55),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed("sign_up");
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "New to SkillMaster?",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Manrope_bold',
                        color: Color(0xff64748B),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      " Create Account",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Manrope_bold',
                        color: Color(0xff0056D2),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
