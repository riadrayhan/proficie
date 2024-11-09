import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/status_model.dart';
import '../model/theme_model.dart';



class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  var colors = [
    const Color(0xff5ACC52),
    const Color(0xffE2E8F0),
    const Color(0xff5ACC52),
    const Color(0xffE2E8F0),
    const Color(0xff5ACC52),
    const Color(0xffE2E8F0),
    const Color(0xff5ACC52),
  ];
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifier.background,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 15,right: 15,left: 15),
        child: ListView.builder(
          itemCount: model.length,
          itemBuilder: (context, index) {
            StatusModel status = model[index];
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Image.asset(
                status.image,
                scale: 3,
              ),
              title: Text(
                status.name,
                style:  TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  fontFamily: "Manrope_bold",
                  letterSpacing: 0.3,
                  color: notifier.textColor,
                ),
              ),
              subtitle: Text(
                status.time,
                style:  TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  fontFamily: "Manrope_semibold",
                  letterSpacing: 0.2,
                  color: notifier.textColorGrey,
                ),
              ),
              trailing: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    colors[index],
                  ),
                ),
                child: Text(
                  status.request,
                  style: const TextStyle(
                    fontSize: 10,
                    fontFamily: "Manrope_bold",
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                    color: Color(0xff0F172A),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
