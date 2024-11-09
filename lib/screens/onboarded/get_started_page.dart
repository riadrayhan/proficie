import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/theme_model.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifier.background,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Image.asset("assets/images/get_started.png",height: height / 2.3),
              SizedBox(height: height / 35),
              Text(
                "Get Started",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Manrope_bold',
                  color: notifier.textColor,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: height / 50),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  "Let's explore course with our professional mentor just in SkillMaster App!",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Manrope_semibold',
                    color: notifier.textColorGrey,
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: height / 15),
              Container(
                margin: const EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height / 13,
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
                    Navigator.of(context).pushNamed("explore");
                  },
                  child: const Text(
                    "Continue With Email",
                    style: TextStyle(
                      fontFamily: 'Manrope_bold',
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 14,
                    width: MediaQuery.of(context).size.width / 2.5,
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
                          SizedBox(width: width / 40,),
                          const Text(
                            "Google",
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
                  Container(
                    height: MediaQuery.of(context).size.height / 14,
                    width: MediaQuery.of(context).size.width / 2.5,
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
                            scale: 2.7,
                          ),
                          SizedBox(width: width / 40,),
                          const Text(
                            "Facebook",
                            style: TextStyle(
                              fontFamily: 'Manrope_bold',
                              fontSize: 16,
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
              SizedBox(height: height / 35),
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
