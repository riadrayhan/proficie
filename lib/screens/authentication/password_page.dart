import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/theme_model.dart';
import '../../widget/button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: notifier.background,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: notifier.background,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Image.asset(
            "assets/icons/close_icon.png",
            width: width / 7.5,
            color: notifier.isDark ? Colors.white : null,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create New Password",
                style: TextStyle(
                  fontSize: 24,
                  color: notifier.textColor,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Manrope_semibold",
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Your new password must different from previous password.",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: notifier.textColorGrey,
                  fontFamily: "Manrope_semibold",
                  letterSpacing: 0.3,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "New Password",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: notifier.textColor,
                  fontFamily: "Manrope_semibold",
                  letterSpacing: 0.3,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 56,
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
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(18),
                    hintText: "Input your new password",
                    hintStyle: TextStyle(
                      fontFamily: 'Manrope_bold',
                      fontSize: 14,
                      color: notifier.textField,
                      fontWeight: FontWeight.w500,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Confirm New Password",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: notifier.textColor,
                  fontFamily: "Manrope_semibold",
                  letterSpacing: 0.3,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 56,
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
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(18),
                    hintText: "Input your new password",
                    hintStyle: TextStyle(
                      fontFamily: 'Manrope_bold',
                      fontSize: 14,
                      color: notifier.textField,
                      fontWeight: FontWeight.w500,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: button(
                  text: "Confirm New Password",
                  color: const Color(0xff0056D2),
                  onPress: () {
                    Navigator.of(context).pushNamed("login");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
