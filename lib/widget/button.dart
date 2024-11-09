import 'package:flutter/material.dart';

Widget button({required String text, required Color color, void Function()? onPress}) {
  return SizedBox(
    height: 56,
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
      child:  Text(
        text,
        style: const TextStyle(
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
