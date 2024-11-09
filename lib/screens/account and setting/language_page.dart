import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/language_model.dart';
import '../../model/theme_model.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int value = 0;
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
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
              "Language",
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
          padding:
              const EdgeInsets.only(right: 20, left: 20, top: 15, bottom: 15),
          child: Column(
            children: [
              Container(
                height: 57,
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
                        color: notifier.textField,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(18),
                    hintText: "Search country",
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
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: language.length,
                itemBuilder: (context, index) {
                  LanguageModel data = language[index];
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        value = index;
                      });
                    },
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        data.style,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Manrope_bold",
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.3,
                          color: notifier.textColor,
                        ),
                      ),
                      subtitle: Text(
                        data.lang,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Manrope_bold",
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.2,
                          color: notifier.textColorGrey,
                        ),
                      ),
                      trailing: radioButton(index),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget radioButton(int index) {
    return Container(
      alignment: Alignment.center,
      height: 25,
      width: 25,
      child: OutlinedButton(
        onPressed: () {
          value = index;
          setState(() {});
        },
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            color: (value == index)
                ? const Color(0xff0056D2)
                : notifier.isDark
                    ? const Color(0xff334155)
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
