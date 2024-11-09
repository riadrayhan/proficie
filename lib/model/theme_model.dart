import 'package:flutter/material.dart';



class ColorNotifire with ChangeNotifier {

  get textField => isDark ? const Color(0xff64748B) : const Color(0xffCBD5E1);
  get textColorGrey => isDark ? const Color(0xff94A3B8): const Color(0xff64748B);
  get textColor => isDark ? Colors.white : const Color(0xff0F172A);
  get background => isDark ? const Color(0xff0F172A) : Colors.white;
  get imageColor => isDark ? Colors.white : const Color(0xff0056D2);
  get checkBox => isDark ? const Color(0xff334155) : const Color(0xffE2E8F0);
  get buttonBorder => isDark ? Colors.white  :const Color(0xffEBEBEB);
  get textColor_1 => isDark ? const Color(0xff94A3B8) : const Color(0xff0056D2);
  get dotColor => isDark ? const Color(0xff1E293B) : const Color(0xffEDF5FF);
  get tabColor => isDark ?  Colors.white10 : Colors.grey.shade100;
  get tabTextColor => isDark ? const Color(0xff1E293B) : Colors.white;
  get iconColor => isDark ? const Color(0xff64748B) : const Color(0xffCBD5E1);
  get floatingAction => isDark ? const Color(0xff1E293B) : const Color(0xff0F172A);
  get bottomNavigationColor => isDark ? const Color(0xff1E293B) : Colors.white;
  get messageBackColor => isDark ? const Color(0xff1E293B) : const Color(0xffF8F8F8);
  get messageTextColor => isDark ? Colors.white : const Color(0xff0F172A);
  get tabBorder => isDark  ? const Color(0xff334155) : const Color(0xffF1F5F9);
  get bottomSheetColor => isDark ? const Color(0xff1E293B) : Colors.white;
  get mentorDetailTextColor => isDark ? const Color(0xffCBD5E1) : const Color(0xff64748B);
  get paymentCardColor => isDark ? Colors.white : Colors.transparent;
  get dividedColor => isDark ? const Color(0xff334155) : const Color(0xffE2E8F0);
  get containerDividedColor => isDark ? const Color(0xff1E293B) : const Color(0xffF1F5F9);



  bool _isDark = false;
  bool get isDark => _isDark;

  void isAvailable(bool value) {
    _isDark = value;
    notifyListeners();
  }
}

