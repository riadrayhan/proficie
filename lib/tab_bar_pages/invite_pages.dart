import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/share_model.dart';
import '../model/theme_model.dart';
import '../widget/button.dart';

class InviteScreen extends StatefulWidget {
  const InviteScreen({super.key});

  @override
  State<InviteScreen> createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: notifier.background,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/gift_1.png",
                  scale: 3.8,
                ),
              ),
              Text(
                "Invite your friends and win up to 1 Million Dollar!",
                style: TextStyle(
                  fontSize: 26,
                  fontFamily: "Manrope_bold",
                  fontWeight: FontWeight.w700,
                  color: notifier.textColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height / 80),
              Text(
                "Each time the friends you invite buy , you get a 0.020%. Commission is calculated from the value of buy purchase.",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Manrope_semibold",
                  fontWeight: FontWeight.w400,
                  color: notifier.textColorGrey,
                  letterSpacing: 0.3,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height / 50),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 6),
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: notifier.textField, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Use @username as a referral code",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: "Manrope_semibold",
                        fontSize: 10,
                        letterSpacing: 0.2,
                        color: notifier.textColorGrey,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "@elon354",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: "Manrope_semibold",
                            fontSize: 18,
                            letterSpacing: 0.2,
                            color: notifier.textColor,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.copy,
                            color: Color(0xff0056D2),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: height / 10),
              button(
                text: "Invite My Friends",
                color: const Color(0xff0056D2),
                onPress: () {
                  showModalBottomSheet(
                    backgroundColor: notifier.isDark ? const Color(0xff1E293B) : Colors.white,
                    isScrollControlled: true,
                    constraints:
                        const BoxConstraints(maxHeight: 575, minHeight: 575),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25),
                      ),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return inviteFriend();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget inviteFriend() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Invite My Friends",
                style: TextStyle(
                  fontFamily: "Manrope_bold",
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: notifier.textColor,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 230,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: notifier.textField,
                    width: 1,
                  ),
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 15),
                          child: Text(
                            "Elon Musk",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Manrope_bold",
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.2,
                              color: notifier.textColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 5),
                          child: Text.rich(
                            TextSpan(
                              text: "I earned ",
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: "Manrope_bold",
                                fontWeight: FontWeight.w700,
                                color: notifier.textColor,
                              ),
                              children: [
                                const TextSpan(
                                  text: "\$5 ",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: "Manrope_bold",
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff0056D2),
                                  ),
                                ),
                                TextSpan(
                                  text: " in assets by\nfinishing",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: "Manrope_bold",
                                    fontWeight: FontWeight.w700,
                                    color: notifier.textColor,
                                  ),
                                ),
                                const TextSpan(
                                  text: " 1 ",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: "Manrope_bold",
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff0056D2),
                                  ),
                                ),
                                TextSpan(
                                  text: "course",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: "Manrope_bold",
                                    fontWeight: FontWeight.w700,
                                    color: notifier.textColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 116,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color(0xff0056D2),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 15, left: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  "Use referral code and earn commission",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Manrope_semibold",
                                    fontSize: 13,
                                    letterSpacing: 0.2,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Text(
                                    "@elonmusk",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Manrope_bold",
                                      fontSize: 14,
                                      letterSpacing: 0.3,
                                      color: Color(0xff0F172A),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: share.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                  itemBuilder: (context, index) {
                    ShareModel data = share[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 51,
                            height: 51,
                            child: Image.asset(data.image, fit: BoxFit.cover),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            data.firstName,
                            style: TextStyle(
                              color: notifier.textColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Manrope_semibold",
                              letterSpacing: 0.2,
                            ),
                          ),
                          Text(
                            data.lastName,
                            style: TextStyle(
                              color: notifier.textColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Manrope_semibold",
                              letterSpacing: 0.2,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: share.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                  itemBuilder: (context, index) {
                    ShareModel data = share[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 51,
                            height: 51,
                            decoration: const BoxDecoration(
                              color: Color(0xffEDF5FF),
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              data.icon,
                              height: 20,
                              width: 20,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            data.text,
                            style: TextStyle(
                              color: notifier.textColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Manrope_semibold",
                              letterSpacing: 0.2,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(2),
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: notifier.textField, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: notifier.textColor,
                    fontFamily: 'Manrope_bold',
                    letterSpacing: 0.3,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.copy,
                        color: notifier.textColor,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Copy",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: notifier.textColor,
                      fontFamily: 'Manrope_bold',
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
