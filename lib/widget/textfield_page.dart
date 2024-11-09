import 'package:flutter/material.dart';

Widget textField({required String text, required Color color}) {
  return Container(
    padding: const EdgeInsets.all(0),
    height: 70,
    width: double.infinity,
    color: Colors.white,
    child: TextFormField(
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
            color:  Color(0xffCBD5E1),
          letterSpacing: 0.3,
        ),
      ),
    ),
  );
}
