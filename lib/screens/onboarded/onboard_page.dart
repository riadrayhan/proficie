import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/onboard_model.dart';
import '../../model/theme_model.dart';
import '../../widget/onboard_size.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  int _currentPage = 0;
  ColorNotifire notifier = ColorNotifire();

  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        color:
            _currentPage == index ? const Color(0xff0056D2) : notifier.dotColor,
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return Scaffold(
      backgroundColor: notifier.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _controller,
                onPageChanged: (value) => setState(() => _currentPage = value),
                itemCount: contents.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      SizedBox(height: height / 50),
                      Image.asset(
                        contents[i].image,
                        height: SizeConfig.blockV! * 35,
                      ),
                      SizedBox(
                        height: (height >= 840) ? 60 : 30,
                      ),
                      Text(
                        contents[i].title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: notifier.textColor,
                          fontFamily: 'Manrope_bold',
                          fontSize: (width <= 550) ? 30 : 35,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 25),
                        child: Text(
                          contents[i].desc,
                          style: TextStyle(
                            color: notifier.textColorGrey,
                            fontFamily: 'Manrope_semibold',
                            fontWeight: FontWeight.w400,
                            fontSize: (width <= 550) ? 14 : 25,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      contents.length,
                      (int index) => _buildDots(
                        index: index,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 30, left: 30, top: 30),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xff0056D2)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        onPressed: () {
                         // Navigator.of(context).pushNamed("get_started");
                          Navigator.of(context).pushNamed("number");
                        },
                        child: const Text(
                          "Get Started",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'Manrope_bold',
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 10),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: OutlinedButton(
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(BorderSide(
                              color: notifier.buttonBorder, width: 1.5)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Browse Course",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Manrope_bold',
                            color: Color(0xff0F172A),
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
