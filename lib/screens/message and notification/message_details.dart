import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/chatmessage_model.dart';
import '../../model/theme_model.dart';
import '../../widget/message_attachment.dart';

class MessageDetail extends StatefulWidget {
  final String image;
  final String name;
  final String time;

  const MessageDetail(
      {super.key, required this.image, required this.name, required this.time});

  @override
  State<MessageDetail> createState() => _MessageDetailState();
}

class _MessageDetailState extends State<MessageDetail> {
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: notifier.background,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: notifier.background,
        // toolbarHeight: 80,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset(
                    "assets/icons/close_icon.png",
                    color: notifier.isDark ? Colors.white : null,
                    width: width / 7.5,
                  ),
                ),
                // SizedBox(width: width / 8,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Manrope_bold",
                          letterSpacing: 0.4,
                          color: notifier.textColor,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.time,
                        style: TextStyle(
                          color: notifier.textColorGrey,
                          fontSize: 10,
                          fontFamily: "Manrope_bold",
                          letterSpacing: 0.2,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.settings,
                  color: notifier.textColor,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(
                    left: 14, right: 14, top: 10, bottom: 10),
                child: Align(
                  alignment: (messages[index].messageType == "receiver"
                      ? Alignment.topLeft
                      : Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (messages[index].messageType == "receiver"
                          ? notifier.messageBackColor
                          : const Color(0xff0056D2)),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      messages[index].messageContent,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.2,
                        fontFamily: "Manrope_bold",
                        color: (messages[index].messageType == "receiver"
                            ? notifier.messageTextColor
                            : Colors.white),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: notifier.background,
          border: const Border(
            top: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25),
                      ),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return const MessageAttachment();
                    },
                  );
                },
                child: Image.asset(
                  "assets/images/attach-circle.png",
                  scale: 2,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Write message here...",
                    hintStyle: TextStyle(
                      fontFamily: "Manrope_mediumbold",
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff94A3B8),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: const Color(0xff0056D2),
                elevation: 0,
                child: const Icon(
                  Icons.mic_none,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
