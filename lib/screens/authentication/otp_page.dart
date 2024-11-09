import 'dart:async';
import 'package:custom_otp_textfield/custom_otp_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/theme_model.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController textEditingController = TextEditingController();
  ColorNotifire notifier = ColorNotifire();
  Timer? _timer;
  int _secondsRemaining = 90;
  bool canResendCode = false;
  bool isInvalidOtp = false;

  @override
  void initState() {
    super.initState();
    startTimer();
    textEditingController.addListener(_onOtpChange);
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          canResendCode = true;
          _timer?.cancel();
        });
      }
    });
  }

  void resendCode() {
    setState(() {
      _secondsRemaining = 90;
      canResendCode = false;
      startTimer();
      isInvalidOtp = false;
      textEditingController.clear();
    });
    // Add resend logic here
  }

  void verifyOtp(String otpCode) {
    if (otpCode == "1234") {
      Navigator.of(context).pushNamed("/home");
    } else {
      setState(() {
        isInvalidOtp = true;
      });
    }
  }

  void _onOtpChange() {
    if (textEditingController.text.length == 4) {
      verifyOtp(textEditingController.text);
    }
  }

  String get timerText {
    final minutes = _secondsRemaining ~/ 60;
    final seconds = _secondsRemaining % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    _timer?.cancel();
    textEditingController.removeListener(_onOtpChange);
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
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
                "OTP Verification",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Manrope_bold',
                  color: notifier.textColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "We have sent a verification code to phone number +6230587401.",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Manrope_semibold',
                  color: notifier.textColorGrey,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.3,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Verification Code",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Manrope_bold',
                      color: notifier.textColor,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.3,
                    ),
                  ),
                  canResendCode
                      ? GestureDetector(
                    onTap: resendCode,
                    child: const Text(
                      "Resend Code",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Manrope_bold',
                        color: Color(0xff0056D2),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.3,
                      ),
                    ),
                  )
                      : Text(
                    "Resend in $timerText",
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Manrope_bold',
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 30),
              Center(
                child: CustomOTPTextField(
                  deviceWidth: MediaQuery.of(context).size.width,
                  textEditingController: textEditingController,
                  boxSize: MediaQuery.of(context).size.width / 4.7,
                  inputBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                    BorderSide(color: notifier.textField, width: 1.5),
                  ),
                  cursorColor: notifier.textColor,
                  otpLength: 4,
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Manrope_bold",
                    color: notifier.textColor,
                    letterSpacing: 0.3,
                  ),
                  spaceBetweenTextFields: 7.5,
                  cursorHeight: 20,
                ),
              ),
              if (isInvalidOtp) ...[
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    "Invalid code. Please try again.",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
              const Spacer(),
              Center(
                child: SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xff0056D2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                    ),
                    onPressed: () {
                      // Navigator.of(context).pushNamed("password");
                      Navigator.of(context).pushNamed("/");
                      verifyOtp(textEditingController.text);
                    },
                    child: const Text(
                      "Verify",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Manrope_bold',
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
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
