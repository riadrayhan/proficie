import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../globals/search_globals.dart';
import '../../model/theme_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ColorNotifire notifier = ColorNotifire();

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
        title: Row(
          children: [
            Text(
              "Search Course",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Manrope_bold",
                color: notifier.textColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Image.asset(
                "assets/icons/close_icon_1.png",
                color: notifier.isDark ? Colors.white : null,
                width: width / 8,
                height: height / 8,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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
                SizedBox(height: height / 55),
                Text(
                  "Category",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: notifier.textColor,
                    fontFamily: 'Manrope_bold',
                    letterSpacing: 0.2,
                  ),
                ),
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: item.map((e) {
                    return ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      leading: Image.asset("${e['image']}",scale: 2.5),
                      title: Text(
                        "${e['title']}",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: notifier.textColor,
                          fontFamily: "Manrope_bold",
                          letterSpacing: 0.3,
                        ),
                      ),
                      subtitle: Text(
                        "${e['subtitle']}",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: notifier.textColorGrey,
                          fontFamily: "Manrope_bold",
                          letterSpacing: 0.2,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon:  Icon(
                          Icons.arrow_forward_ios,
                          color: notifier.iconColor,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
