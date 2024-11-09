import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/theme_model.dart';

class FAQ extends StatefulWidget {
  const FAQ({super.key});

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
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
            SizedBox(width: width / 3.2),
            Text(
              "FAQ",
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
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/help_center.png"),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "Frequently Asked Question",
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: "Manrope_bold",
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1,
                    color: notifier.textColor,
                  ),
                ),
              ),
              SizedBox(height: height / 50),
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
                      hintText: "Search you answer",
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
              SizedBox(height: height / 30),
              Container(
                height: 10,
                width: double.infinity,
                color: notifier.containerDividedColor,
              ),
              expansionList(text: "What are course apps?"),
              SizedBox(height: height / 140),
              expansionList(text: "What features do course apps have?"),
              SizedBox(height: height / 140),
              expansionList(
                  text: "What are the benefits of using course apps?"),
              SizedBox(height: height / 140),
              expansionList(text: "Are course apps effective for learning?"),
            ],
          ),
        ),
      ),
    );
  }

  Widget expansionList({required String text}) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: ExpansionTile(
          childrenPadding: EdgeInsets.zero,
          iconColor: notifier.iconColor,
          title: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: "Manrope_semibold",
              fontSize: 14,
              color: notifier.textColor,
              letterSpacing: 0.3,
            ),
          ),
          collapsedIconColor: const Color(0xffCBD5E1),
          tilePadding: EdgeInsets.zero,
          children: [
            Text(
              "Connect with thousands of the Financial users to discuss and share about investment knowledge.",
              style: TextStyle(
                fontSize: 12,
                fontFamily: "Manrope_semibold",
                fontWeight: FontWeight.w400,
                letterSpacing: 0.2,
                color: notifier.textColorGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
