import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/payment_model.dart';
import '../../model/theme_model.dart';
import '../../widget/button.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: notifier.background,
      appBar: AppBar(
        backgroundColor: notifier.background,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Image.asset(
                "assets/icons/close_icon.png",
                width: width / 7.5,
                color: notifier.isDark ? Colors.white : null,
              ),
            ),
            SizedBox(width: width / 5.5),
            Text(
              "Payment Account",
              style: TextStyle(
                fontFamily: "Manrope_bold",
                fontWeight: FontWeight.w700,
                fontSize: 16,
                letterSpacing: 0.4,
                color: notifier.textColor,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Credit Card",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: "Manrope_bold",
                fontSize: 18,
                letterSpacing: 0.2,
                color: notifier.textColor,
              ),
            ),
            SizedBox(height: height / 50),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: payment.length,
              itemBuilder: (context, index) {
                Payment data = payment[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: notifier.paymentCardColor,
                      ),
                      child: Image.asset(
                        data.image,
                        scale: 1.8,
                      ),
                    ),
                    title: Text(
                      data.card,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: "Manrope_bold",
                        fontSize: 14,
                        letterSpacing: 0.3,
                        color: notifier.textColor,
                      ),
                    ),
                    subtitle: Text(
                      data.number,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: "Manrope_bold",
                        fontSize: 12,
                        letterSpacing: 0.2,
                        color: notifier.textColorGrey,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon:  Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: notifier.iconColor,
                      ),
                    ),
                  ),
                );
              },
            ),
            const Spacer(),
            button(
              text: "Add Payment Account",
              color: const Color(0xff0056D2),
              onPress: () {
                Navigator.of(context).pushNamed("new_add_payment");
              },
            ),
          ],
        ),
      ),
    );
  }
}
