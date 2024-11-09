import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proficie/screens/Preference/preference_page.dart';
import 'package:proficie/screens/account%20and%20setting/detail_profile.dart';
import 'package:proficie/screens/account%20and%20setting/payment_account.dart';
import 'package:proficie/screens/account%20and%20setting/push_notification.dart';
import 'package:proficie/screens/account%20and%20setting/refferal_code.dart';
import 'package:proficie/screens/order%20and%20payment/order_history.dart';
import 'package:provider/provider.dart';

import '../../model/theme_model.dart';
import '../home/home_page.dart';
import 'account_security.dart';
import 'downloaded_option.dart';
import 'faq_page.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  double sliderValue = 1;
  var selectIndex = 0;
  var currentIndex = 0;
  ColorNotifire notifier = ColorNotifire();
  bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        backgroundColor: notifier.background,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "My Profile",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: "Manrope_bold",
            fontSize: 20,
            color: notifier.textColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              container(),
              //==============//
              SizedBox(height: 40,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Account Details",   style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: "Manrope_bold",
                  fontSize: 20,
                  color: notifier.textColor,
                ),),
              ),
              SizedBox(height: 10,),
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileDetail(),));
                },
                title: Text("Details Profile",style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: "Manrope_bold",
                  fontSize: 15,
                  color: notifier.textColor,
                ),),
                subtitle: Text("Information Account"),
                leading: Icon(Icons.person,color: Colors.black,),
                trailing: Icon(CupertinoIcons.right_chevron),
              ),

              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OrderHistory(),));
                },
                title: Text("Identify",style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: "Manrope_bold",
                  fontSize: 15,
                  color: notifier.textColor,
                ),),
                subtitle: Text("Verification status settings"),
                leading: Icon(Icons.verified_user,color: Colors.black,),
                trailing: Icon(CupertinoIcons.right_chevron),
              ),

              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PreferencePage(),));
                },
                title: Text("Preference",style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: "Manrope_bold",
                  fontSize: 15,
                  color: notifier.textColor,
                ),),
                subtitle: Text("Career skill and more"),
                leading: Icon(Icons.room_preferences,color: Colors.black,),
                trailing: Icon(CupertinoIcons.right_chevron),
              ),

              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OrderHistory(),));
                },
                title: Text("Order History",style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: "Manrope_bold",
                  fontSize: 15,
                  color: notifier.textColor,
                ),),
                subtitle: Text("Your order history"),
                leading: Icon(Icons.history_edu_sharp,color: Colors.black,),
                trailing: Icon(CupertinoIcons.right_chevron),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentMethod(),));
                },
                title: Text("Payment Account",style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: "Manrope_bold",
                  fontSize: 15,
                  color: notifier.textColor,
                ),),
                subtitle: Text("manage your payment"),
                leading: Icon(Icons.payments_rounded,color: Colors.black,),
                trailing: Icon(CupertinoIcons.right_chevron),
              ),
//===========================================//

              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DownloadedOption(),));
                },
                title: Text("Download Option",style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: "Manrope_bold",
                  fontSize: 15,
                  color: notifier.textColor,
                ),),
                subtitle: Text("Download your course"),
                leading: Icon(Icons.download_for_offline,color: Colors.black,),
                trailing: Icon(CupertinoIcons.right_chevron),
              ),

              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AccountSecurity(),));
                },
                title: Text("Account Security",style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: "Manrope_bold",
                  fontSize: 15,
                  color: notifier.textColor,
                ),),
                subtitle: Text("Secure account"),
                leading: Icon(Icons.security,color: Colors.black,),
                trailing: Icon(CupertinoIcons.right_chevron),
              ),

              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PushNotification(),));
                },
                title: Text("Notification",style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: "Manrope_bold",
                  fontSize: 15,
                  color: notifier.textColor,
                ),),
                subtitle: Text("Notification Settings"),
                leading: Icon(Icons.notification_add,color: Colors.black,),
                trailing: Icon(CupertinoIcons.right_chevron),
              ),

              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FAQ(),));
                },
                title: Text("FAQ",style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: "Manrope_bold",
                  fontSize: 15,
                  color: notifier.textColor,
                ),),
                subtitle: Text("Ask your questions"),
                leading: Icon(CupertinoIcons.question_diamond_fill,color: Colors.black,),
                trailing: Icon(CupertinoIcons.right_chevron),
              ),
              //=======================//
            ],
          )
        ),
      ),

    );
  }

Widget container() {
  return Container(
    padding: const EdgeInsets.all(15),
    height: 350,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: const LinearGradient(
        colors: [
          Color(0xff2472E3),
          Color(0xff0550BB),
        ],
      ),
    ),
    child: Column(
      children: [
        Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    "assets/images/avatar.png",
                    scale: 5,
                  ),
                ),
                Positioned(
                  left: 1,
                  child: Image.asset(
                    "assets/images/badge.png",
                    scale: 3,
                  ),
                ),
              ],
            ),
            SizedBox(width: MediaQuery
                .of(context)
                .size
                .width / 20),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Elon Musk",
                  style: TextStyle(
                    fontFamily: "Manrope_bold",
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 18,
                    letterSpacing: 0.2,
                  ),
                ),
                Text(
                  "Congrats you have reach Platinum",
                  style: TextStyle(
                    fontFamily: "Manrope_bold",
                    fontWeight: FontWeight.w400,
                    color: Color(0xff96CBFA),
                    fontSize: 12,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Conqueror",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                fontFamily: "Manrope_bold",
                letterSpacing: 0.2,
              ),
            ),
            const Spacer(),
            Text(
              "${sliderValue.toInt()}/1000",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                fontFamily: "Manrope_bold",
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: const Color(0xffF9AA00),
            inactiveTrackColor: Colors.white,
            trackHeight: 6,
            thumbShape: const RoundSliderOverlayShape(),
            trackShape: CustomTrackShape(),
          ),
          child: Slider(
            min: 00,
            max: 1000,
            value: sliderValue,
            onChanged: (double val) {
              setState(() {
                sliderValue = val;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("my_learning");
              },
              child: Container(
                alignment: Alignment.center,
                height: 66,
                width: 93,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/Home.png",
                      scale: 3,
                    ),
                    const Text(
                      "53 Course",
                      style: TextStyle(
                        fontFamily: "Manrope_bold",
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 10,
                        letterSpacing: 0.2,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 66,
              width: 93,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "assets/images/Home_2.png",
                    scale: 3,
                  ),
                  const Text(
                    "20 Hours",
                    style: TextStyle(
                      fontFamily: "Manrope_bold",
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 10,
                      letterSpacing: 0.2,
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 66,
              width: 93,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "assets/images/Home_3.png",
                    scale: 3,
                  ),
                  const Text(
                    "120 Modules",
                    style: TextStyle(
                      fontFamily: "Manrope_bold",
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 10,
                      letterSpacing: 0.2,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ReferralCode(),));
            });
          },
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(2),
            height: 75,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Text("Referral Program",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,fontFamily: "Manrope_bold",),),
                Text("Invite your friend to get free asset upto 500")
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
}