import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/share_model.dart';
import '../model/theme_model.dart';

class ShareButton extends StatefulWidget {
  const ShareButton({super.key});

  @override
  State<ShareButton> createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton> {
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: Align(
        alignment: const Alignment(0.1, -1.2),
        child: Container(
          transform: Matrix4.translationValues(0.0, -30, 0.0),
          child: FloatingActionButton(
            backgroundColor: notifier.bottomSheetColor,
            onPressed: () {},
            child: Icon(
              Icons.close,
              color: notifier.textColor,
            ),
          ),
        ),
      ),
      body: Container(
        height: height / 1,
        color: notifier.bottomSheetColor,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Share",
                    style: TextStyle(
                      fontFamily: "Manrope_bold",
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: notifier.textColor,
                    ),
                  ),
                  SizedBox(height: height / 40),
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
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              SizedBox(
                                width: width / 5.5,
                                child:
                                    Image.asset(data.image, fit: BoxFit.cover),
                              ),
                              SizedBox(height: height / 120),
                              Text(
                                data.firstName,
                                style: TextStyle(
                                  color: notifier.textColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Manrope_bold",
                                  letterSpacing: 0.2,
                                ),
                              ),
                              Text(
                                data.lastName,
                                style: TextStyle(
                                  color: notifier.textColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Manrope_bold",
                                  letterSpacing: 0.2,
                                ),
                              ),
                              SizedBox(height: height / 35),
                              Container(
                                alignment: Alignment.center,
                                width: width / 5.5,
                                height: height / 9,
                                decoration: const BoxDecoration(
                                  color: Color(0xffEDF5FF),
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  data.icon,
                                  height: height / 15,
                                  width: width / 15,
                                ),
                              ),
                              SizedBox(height: height / 100),
                              Text(
                                data.text,
                                style: TextStyle(
                                  color: notifier.textColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Manrope_bold",
                                  letterSpacing: 0.2,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: height / 55),
                  Container(
                    padding: const EdgeInsets.all(2),
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: notifier.textField,
                        width: 0.9,
                      ),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
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
        ),
      ),
    );
  }
}
