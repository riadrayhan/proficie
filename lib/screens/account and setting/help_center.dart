import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/theme_model.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
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
                "assets/icons/menu_icon.png",
                width: width / 7.5,
                color: notifier.isDark ? Colors.white : null,
              ),
            ),
            SizedBox(width: width / 5),
            Text(
              "Help Center",
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/help_center.png"),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "Hi, how can we help?",
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: "Manrope_bold",
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1,
                    color: notifier.textColor,
                  ),
                ),
              ),
              SizedBox(height: height / 140),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 15),
                child: Text(
                  "Now you can learn anywhere, anytime, even if there is no internet access!",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Manrope_semibold",
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.3,
                    color: notifier.textColorGrey,
                  ),
                ),
              ),
              SizedBox(height: height / 30),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: notifier.textField,
                      width: 1,
                    ),
                  ),
                  child: TextField(
                    style: TextStyle(
                        fontFamily: 'Manrope_bold',
                        fontSize: 14,
                        color: notifier.textColor,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.3),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/icons/Search.png",
                          scale: 3,
                          color: const Color(0xff94A3B8),
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(18),
                      hintText: "Search course mentor...",
                      hintStyle: TextStyle(
                          fontFamily: 'Manrope_bold',
                          fontSize: 14,
                          color: notifier.textField,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height / 50),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "Community",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Manrope_bold",
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.3,
                    color: notifier.textColor,
                  ),
                ),
              ),
              SizedBox(height: height / 140),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "Connect with thousands of the Financial users to discuss and share about investment knowledge.!",
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "Manrope_semibold",
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.2,
                    color: notifier.textColorGrey,
                  ),
                ),
              ),
              SizedBox(height: height / 40),
              Container(
                height: 10,
                width: double.infinity,
                color: notifier.containerDividedColor,
              ),
              SizedBox(height: height / 40),
              // SizedBox(height: height / 30),
              accountDetails(
                image: "assets/icons/profile_5.png",
                name: "FAQ",
                desc: "Frequently Asked Question",
                onPress: () { },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget accountDetails(
      {required String image,
      required String name,
      required String desc,
      required void Function()? onPress}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, right: 15, left: 15),
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed("faq");
        },
        child: Row(
          children: [
            Image.asset(
              image,
              scale: 3,
              color: notifier.isDark ? Colors.white : null,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: "Manrope_bold",
                    fontSize: 14,
                    letterSpacing: 0.3,
                    color: notifier.textColor,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  desc,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: "Manrope_semibold",
                    fontSize: 12,
                    letterSpacing: 0.2,
                    color: notifier.textColorGrey,
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: onPress,
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: notifier.iconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
