import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/theme_model.dart';
import '../../widget/button.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({super.key});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                width: width / 7.8,
                color: notifier.isDark ? Colors.white : null,
              ),
            ),
            SizedBox(width: width / 4.9),
            Text(
              "Edit Profile",
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
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset("assets/images/detail_profile.png", scale: 3),
            ),
            SizedBox(height: height / 15),
            Text(
              "Full Name",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: "Manrope_bold",
                fontSize: 14,
                letterSpacing: 0.3,
                color: notifier.textColor,
              ),
            ),
            SizedBox(height: height / 40),
            Container(
              height: 57,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
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
                  contentPadding: const EdgeInsets.all(18),
                  hintText: "Elon Musk",
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
            SizedBox(height: height / 35),
            Text(
              "Email Address",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: "Manrope_bold",
                fontSize: 14,
                letterSpacing: 0.3,
                color: notifier.textColor,
              ),
            ),
            SizedBox(height: height / 40),
            Container(
              height: 57,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
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
                  contentPadding: const EdgeInsets.all(18),
                  hintText: "elon@gmail.com",
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
            const Spacer(),
            button(
              text: "Save Changes",
              color: const Color(0xff0056D2),
            ),
          ],
        ),
      ),
    );
  }
}
