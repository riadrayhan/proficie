import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/theme_model.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {

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
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Padding(
                 padding: const EdgeInsets.only(left: 15 , right: 15),
                 child: Text(
                  "Terms & Conditions",
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: "Manrope_bold",
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1,
                    color: notifier.textColor,
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
               Padding(
                 padding: const EdgeInsets.only(left: 15 , right: 15),
                 child: Text(
                  "At SkillMaster Apps, we are committed to protecting the privacy and security of our users. This Privacy Policy explains how we collect, use, and protect the personal information of our users.",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Manrope_semibold",
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.3,
                    color: notifier.textColorGrey,
                  ),
              ),
               ),
              SizedBox(height: height / 45),
               Padding(
                 padding: const EdgeInsets.only(left: 15 , right: 15),
                 child: Text(
                  "Collection of Personal Information We collect the following personal information from our users: Name Email address Payment information (if applicable) User-generated content (e.g. posts in community forums) Use of Personal Information",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Manrope_semibold",
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.3,
                    color: notifier.textColorGrey,
                  ),
              ),
               ),
              SizedBox(height: height / 45),
               Padding(
                 padding: const EdgeInsets.only(left: 15 , right: 15),
                 child: Text(
                  "We use the personal information we collect for the following purposes: To create and manage user accounts To deliver the educational content and resources offered by our app To improve the app and provide a personalized experience To send periodic updates and promotions (if the",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Manrope_semibold",
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.3,
                    color: notifier.textColorGrey,
                  ),
              ),
               ),
              SizedBox(height: height / 45),
              Padding(
                padding: const EdgeInsets.only(left: 15 , right: 15),
                child: Text(
                  "At Eduline Apps, we are committed to protecting the privacy and security of our users. This Privacy Policy explains how we collect, use, and protect the personal information of our users.",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Manrope_semibold",
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.3,
                    color: notifier.textColorGrey,
                  ),
                ),
              ),
              SizedBox(height: height / 45),
              Padding(
                padding: const EdgeInsets.only(left: 15 , right: 15),
                child: Text(
                  "Collection of Personal Information We collect the following personal information from our users: Name Email address Payment information (if applicable) User-generated content (e.g. posts in community forums) Use of Personal Information",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Manrope_semibold",
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.3,
                    color: notifier.textColorGrey,
                  ),
                ),
              ),
              SizedBox(height: height / 45),
              Padding(
                padding: const EdgeInsets.only(left: 15 , right: 15),
                child: Text(
                  "We use the personal information we collect for the following purposes: To create and manage user accounts To deliver the educational content and resources offered by our app To improve the app and provide a personalized experience To send periodic updates and promotions (if the",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Manrope_semibold",
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.3,
                    color: notifier.textColorGrey,
                  ),
                ),
              ),
              SizedBox(height: height / 45),
              Padding(
                padding: const EdgeInsets.only(left: 15 , right: 15),
                child: Text(
                  "We use the personal information we collect for the following purposes: To create and manage user accounts To deliver the educational content and resources offered by our app To improve the app and provide a personalized experience To send periodic updates and promotions (if the",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Manrope_semibold",
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.3,
                    color: notifier.textColorGrey,
                  ),
                ),
              ),
              SizedBox(height: height / 40),
              Padding(
                padding: const EdgeInsets.only(left: 15 , right: 15),
                child: Text(
                  "At Eduline Apps, we are committed to protecting the privacy and security of our users. This Privacy Policy explains how we collect, use, and protect the personal information of our users.",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Manrope_semibold",
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.3,
                    color: notifier.textColorGrey,
                  ),
                ),
              ),
              SizedBox(height: height / 45),
              Padding(
                padding: const EdgeInsets.only(left: 15 , right: 15),
                child: Text(
                  "Collection of Personal Information We collect the following personal information from our users: Name Email address Payment information (if applicable) User-generated content (e.g. posts in community forums) Use of Personal Information",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Manrope_semibold",
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.3,
                    color: notifier.textColorGrey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
