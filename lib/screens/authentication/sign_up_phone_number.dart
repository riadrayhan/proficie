import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/theme_model.dart';

class NumberScreen extends StatefulWidget {
  const NumberScreen({super.key});

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  ColorNotifire notifier = ColorNotifire();
  String selectedCountryCode = "+62"; // Default country code
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: notifier.background,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: notifier.background,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Image.asset(
            "assets/icons/close_icon.png",
            width: width / 7.5,
            color: notifier.isDark ? Colors.white : null,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Almost Done!",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Manrope_bold',
                    color: notifier.textColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Enter your phone number, and we'll text you a code to activate your account.",
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Manrope_semibold',
                    color: notifier.textColorGrey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  "Phone Number",
                  style: TextStyle(
                    fontSize: 14,
                    color: notifier.textColor,
                    fontFamily: 'Manrope_bold',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 56,
                      width: MediaQuery.of(context).size.width / 3.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: notifier.textField,
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        readOnly: true,
                        style: TextStyle(
                          fontFamily: 'Manrope_bold',
                          fontSize: 14,
                          color: notifier.textColor,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            color: const Color(0xff64748B),
                            onPressed: () {
                              showCountryPicker(
                                context: context,
                                showPhoneCode: true,
                                onSelect: (Country country) {
                                  setState(() {
                                    selectedCountryCode = "+${country.phoneCode}";
                                  });
                                },
                              );
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: notifier.textColorGrey,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(18),
                          hintText: selectedCountryCode,
                          hintStyle: TextStyle(
                            fontFamily: 'Manrope_semibold',
                            fontSize: 14,
                            color: notifier.textColor,
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: notifier.textField,
                            width: 1,
                          ),
                        ),
                        child: TextFormField(
                          controller: phoneController,
                          style: TextStyle(
                            fontFamily: 'Manrope_bold',
                            fontSize: 14,
                            color: notifier.textColor,
                            fontWeight: FontWeight.w500,
                          ),
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(18),
                            hintText: "8083911",
                            hintStyle: TextStyle(
                              fontFamily: 'Manrope_semibold',
                              fontSize: 14,
                              color: notifier.textColor,
                              fontWeight: FontWeight.w500,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your phone number";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Center(
                  child: SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 16),
                        ),
                        elevation: MaterialStateProperty.all(8),
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (states) => states.contains(MaterialState.pressed)
                              ? const Color(0xff004BB5)
                              : const Color(0xff0056D2),
                        ),
                        shadowColor: MaterialStateProperty.all(Colors.black26),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).pushNamed("otp");
                        }
                      },
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Manrope_bold',
                          letterSpacing: 0.4,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
