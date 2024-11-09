import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/theme_model.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({super.key});

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              "Detail Profile",
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
                child:
                    Image.asset("assets/images/detail_profile.png", scale: 3)),
            Center(
              child: Text(
                "Elon Musk",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: "Manrope_bold",
                  fontSize: 24,
                  letterSpacing: 0.2,
                  color: notifier.textColor,
                ),
              ),
            ),
            Center(
              child: Text(
                "@elonmusk",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: "Manrope_bold",
                  fontSize: 14,
                  letterSpacing: 0.2,
                  color: notifier.textColorGrey,
                ),
              ),
            ),
            SizedBox(height: height / 15),
            Text(
              "Email Address",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: "Manrope_bold",
                fontSize: 14,
                letterSpacing: 0.3,
                color: notifier.textColor,
              ),
            ),
            SizedBox(height: height / 100),
            Text(
              "elonmusk@gmail.com",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: "Manrope_bold",
                fontSize: 12,
                letterSpacing: 0.2,
                color: notifier.textColorGrey,
              ),
            ),
            SizedBox(height: height / 15),
             Text(
              "Phone Number",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: "Manrope_bold",
                fontSize: 14,
                letterSpacing: 0.3,
                color: notifier.textColor,
              ),
            ),
            SizedBox(height: height / 100),
             Text(
              "+6283021930041",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: "Manrope_bold",
                fontSize: 12,
                letterSpacing: 0.2,
                color: notifier.textColorGrey,
              ),
            ),
            SizedBox(height: height / 15),
             Text(
              "Location",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: "Manrope_bold",
                fontSize: 14,
                letterSpacing: 0.3,
                color: notifier.textColor,
              ),
            ),
            SizedBox(height: height / 100),
             Text(
              "Semarang, Indonesia",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: "Manrope_bold",
                fontSize: 12,
                letterSpacing: 0.2,
                color: notifier.textColorGrey,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buttonElevated(onPress: () {
                  Navigator.of(context).pushNamed("personal_data_edit");
                }),
                buttonOutlined(
                  onPress: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonElevated({void Function()? onPress}) {
    return SizedBox(
      height: 56,
      width: 155.5,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xff0056D2)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        onPressed: onPress,
        child: const Text(
          "Edit Profile",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: 'Manrope_bold',
            color: Color(0xffFFFFFF),
            letterSpacing: 0.4,
          ),
        ),
      ),
    );
  }

  Widget buttonOutlined({void Function()? onPress}) {
    return SizedBox(
      height: 56,
      width: 155.5,
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          side: MaterialStateProperty.all(
             BorderSide(
              color: notifier.buttonBorder,
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        onPressed: onPress,
        child:  const Text(
          "Edit Password",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: 'Manrope_bold',
            color: Color(0xff0F172A),
            letterSpacing: 0.4,
          ),
        ),
      ),
    );
  }
}
