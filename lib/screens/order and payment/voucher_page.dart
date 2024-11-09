import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/theme_model.dart';
import '../../widget/button.dart';

class VoucherScreen extends StatefulWidget {
  const VoucherScreen({super.key});

  @override
  State<VoucherScreen> createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> {
  int value = 0;
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
              "Add Voucher",
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
        padding:
            const EdgeInsets.only(right: 15, left: 15, bottom: 15, top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 56,
                  width: width / 1.7,
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
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(18),
                      hintText: "123",
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
                buttonApply(onPress: () {}),
              ],
            ),
            SizedBox(height: height / 25),
            Text(
              "Promo Available",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                fontFamily: "Manrope_bold",
                letterSpacing: 0.4,
                color: notifier.textColor,
              ),
            ),
            SizedBox(height: height / 55),
            GestureDetector(
              onTap: (){
                setState(() {
                  value = 0;
                });
              },
              child: Container(
                height: height / 8.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all( color: value == 0
                      ? const Color(0xff0056D2)
                      : notifier.textField, width: 0.9),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/voucher_screen_icon.png",
                          scale: 1.8),
                      SizedBox(width: width / 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Up to 10% Discount",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              fontFamily: "Manrope_bold",
                              letterSpacing: 0.3,
                              color: notifier.textColor,
                            ),
                          ),
                          SizedBox(height: height / 100),
                          Text(
                            "Valid until 13 Feb 2023",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              fontFamily: "Manrope_semibold",
                              letterSpacing: 0.2,
                              color: notifier.textColorGrey,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      radioButton(0),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height / 25),
            GestureDetector(
              onTap: (){
                setState(() {
                  value = 1;
                });
              },
              child: Container(
                height: height / 8.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all( color: value == 1
                      ? const Color(0xff0056D2)
                      : notifier.textField, width: 0.9),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/voucher_screen_icon.png",
                          scale: 1.8),
                      SizedBox(width: width / 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Cashback 10%",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              fontFamily: "Manrope_bold",
                              letterSpacing: 0.3,
                              color: notifier.textColor,
                            ),
                          ),
                          SizedBox(height: height / 100),
                          Text(
                            "Valid until 13 Feb 2023",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              fontFamily: "Manrope_semibold",
                              letterSpacing: 0.2,
                              color: notifier.textColorGrey,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      radioButton(1),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            button(
              text: "Confirmation",
              color: const Color(0xff0056D2),
              onPress: () {
                Navigator.of(context).pushNamed("confirmation_order");
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonApply({required void Function()? onPress}) {
    return SizedBox(
      height: 56,
      width: 100,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xff0056D2)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
          ),
        ),
        onPressed: onPress,
        child: const Text(
          "Apply",
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

  Widget radioButton(int index) {
    return SizedBox(
      height: 24,
      width: 24,
      child: OutlinedButton(
        onPressed: () {
          value = index;
          setState(() {});
        },
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            color: (value == index)
                ? const Color(0xff0056D2)
                : const Color(0xffE2E8F0),
            width: (value == index) ? 7 : 2,
          ),
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(0),
        ),
        child: const Text(""),
      ),
    );
  }
}
