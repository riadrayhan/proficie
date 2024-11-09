import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/theme_model.dart';


class MessageAttachment extends StatefulWidget {
  const MessageAttachment({super.key});

  @override
  State<MessageAttachment> createState() => _MessageAttachmentState();
}

class _MessageAttachmentState extends State<MessageAttachment> {
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
        return Container(
      height: height / 3.3,
      decoration: BoxDecoration(
        color: notifier.floatingAction,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Attachment",
                  style: TextStyle(
                    fontSize: 20,
                    color: notifier.textColor,
                    fontFamily: "Manrope_bold",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: notifier.textField,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Image/file must be less than 1Mb",
                      style: TextStyle(
                        fontSize: 14,
                        color: notifier.textColor_1,
                        fontFamily: "Manrope_bold",
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image.asset("assets/icons/attachement_1.png",
                            scale: 3.2),
                        SizedBox(height: height / 50),
                        Text(
                          "Camera",
                          style: TextStyle(
                            fontSize: 10,
                            color: notifier.textColor,
                            fontFamily: "Manrope_bold",
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          "assets/icons/attachement_2.png",
                          scale: 3.2,
                        ),
                        SizedBox(height: height / 50),
                        Text(
                          "Gallery",
                          style: TextStyle(
                            fontSize: 10,
                            color: notifier.textColor,
                            fontFamily: "Manrope_bold",
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          "assets/icons/attachement_3.png",
                          scale: 3.2,
                        ),
                        SizedBox(height: height / 50),
                        Text(
                          "Document",
                          style: TextStyle(
                            fontSize: 10,
                            color: notifier.textColor,
                            fontFamily: "Manrope_bold",
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          "assets/icons/attachement_4.png",
                          scale: 3.2,
                        ),
                        SizedBox(height: height / 50),
                        Text(
                          "Location",
                          style: TextStyle(
                            fontSize: 10,
                            color: notifier.textColor,
                            fontFamily: "Manrope_bold",
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
