import 'package:flutter/material.dart';

Widget accountDetails(
    {required String image,
    required String name,
    required String desc,
    required void Function()? onPress}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Row(
      children: [
        Image.asset(image, scale: 3),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style:  const TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: "Manrope_bold",
                fontSize: 14,
                letterSpacing: 0.3,
                color: Color(0xff0F172A),
              ),
            ),
            const SizedBox(height: 7),
            Text(
              desc,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: "Manrope_bold",
                fontSize: 12,
                letterSpacing: 0.2,
                color: Color(0xff64748B),
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: onPress,
          icon: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Color(0xffCBD5E1),
          ),
        ),
      ],
    ),
  );
}
