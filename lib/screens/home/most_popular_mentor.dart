import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/theme_model.dart';

class MostPopularMentor extends StatefulWidget {
  const MostPopularMentor({super.key});

  @override
  State<MostPopularMentor> createState() => _MostPopularMentorState();
}

class _MostPopularMentorState extends State<MostPopularMentor> {
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);

    return Scaffold(
      backgroundColor: notifier.background,
      resizeToAvoidBottomInset: false,

      body: const Padding(
        padding: EdgeInsets.only(right: 15, left: 15, bottom: 15),

      ),
    );
  }

  Widget buttonMentor(
      {required String text, required Color color, void Function()? onPress}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 20,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        onPressed: onPress,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            fontFamily: 'Manrope_bold',
            color: Colors.white,
            letterSpacing: 0.2,
          ),
        ),
      ),
    );
  }
}
