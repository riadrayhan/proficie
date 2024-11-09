import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/theme_model.dart';
import '../../widget/button.dart';

class AccountSecurity extends StatefulWidget {
  const AccountSecurity({super.key});

  @override
  State<AccountSecurity> createState() => _AccountSecurityState();
}

class _AccountSecurityState extends State<AccountSecurity> {

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
                width: width / 7.5,
                color: notifier.isDark ? Colors.white : null,
              ),
            ),
            SizedBox(width: width / 5.5),
            Text(
              "Account Security",
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
        padding: const EdgeInsets.only(top: 15,bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
               padding: const EdgeInsets.only(left: 15 , right: 15),
               child: Text(
                "Multi-factor Authentication",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Manrope_bold",
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.3,
                  color: notifier.textColor,
                ),
            ),
             ),
            SizedBox(height: height / 70),
             Padding(
               padding: const EdgeInsets.only(left: 15 , right: 15),
               child: Text(
                "Increase your account security by requiring that a code emailed to you entered when tou log in.",
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Manrope_semibold ",
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.2,
                  color: notifier.textColorGrey,
                ),
            ),
             ),
            SizedBox(height: height / 30),
            buttonOutlined(),
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
                "Current Password",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Manrope_bold",
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.3,
                  color: notifier.textColor,
                ),
            ),
             ),
            SizedBox(height: height / 70),
            Padding(
              padding: const EdgeInsets.only(left: 15 , right: 15),
              child: Container(
                height: 57,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27),
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
                    hintText: "*********",
                    hintStyle: TextStyle(
                        fontFamily: 'Manrope_bold',
                        fontSize: 14,
                        color: notifier.textColor,
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
            SizedBox(height: height / 100),
             Padding(
               padding: const EdgeInsets.only(left: 15 , right: 15),
               child: Text(
                "New Password",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Manrope_bold",
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.3,
                  color: notifier.textColor,
                ),
            ),
             ),
            SizedBox(height: height / 70),
            Padding(
              padding: const EdgeInsets.only(left: 15 , right: 15),
              child: Container(
                height: 57,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27),
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
                    hintText: "**********",
                    hintStyle: TextStyle(
                        fontFamily: 'Manrope_bold',
                        fontSize: 14,
                        color: notifier.textColor,
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
            SizedBox(height: height / 100),
             Padding(
               padding: const EdgeInsets.only(left: 15 , right: 15),
               child: Text(
                "Confirmation Password",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Manrope_bold",
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.3,
                  color: notifier.textColor,
                ),
            ),
             ),
            SizedBox(height: height / 70),
            Padding(
              padding: const EdgeInsets.only(left: 15 , right: 15),
              child: Container(
                height: 57,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27),
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
                    hintText: "**********",
                    hintStyle: TextStyle(
                        fontFamily: 'Manrope_bold',
                        fontSize: 14,
                        color: notifier.textColor,
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
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 15 , left: 15),
              child: button(
                text: "Change Password",
                color: const Color(
                  0xff0056D2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonOutlined({void Function()? onPress}) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: OutlinedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(notifier.isDark ? Colors.white : null),
            side: MaterialStateProperty.all(
                BorderSide(
                color: notifier.textColor,
                  width: 1,
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
            "Enable",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontFamily: 'Manrope_bold',
              color: Color(0xff0F172A),
              letterSpacing: 0.4,
            ),
          ),
        ),
      ),
    );
  }
  Widget textFieldAccount({required String text, required Color color}) {
    return Container(
      padding: const EdgeInsets.all(0),
      height: 70,
      width: double.infinity,
      color: Colors.white,
      child: TextFormField(
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: 'Manrope_bold',
          color:  Color(0xff0F172A),
          letterSpacing: 0.3,
        ),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: const BorderSide(
              color: Color(0xffCBD5E1),
              width: 1,
            ),
          ),
          hintText: text,
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: 'Manrope_bold',
            color:  Color(0xff0F172A),
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}
