import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../../model/theme_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool hidePassword = true;
  bool hideConfirmPassword = true;
  ColorNotifire notifier = ColorNotifire();
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    if (Platform.isAndroid) {
      await Permission.storage.request();
      await Permission.photos.request();
    } else if (Platform.isIOS) {
      await Permission.photos.request();
    }
  }

  Future<void> _pickImage() async {
    try {
      PermissionStatus status;
      if (Platform.isAndroid) {
        status = await Permission.storage.status;
        if (status.isDenied) {
          status = await Permission.storage.request();
        }
      } else {
        status = await Permission.photos.status;
        if (status.isDenied) {
          status = await Permission.photos.request();
        }
      }

      if (status.isGranted) {
        final XFile? pickedFile = await _picker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 80,
        );

        if (pickedFile != null) {
          setState(() {
            _profileImage = File(pickedFile.path);
          });
        }
      } else if (status.isPermanentlyDenied) {
        // Show dialog to open app settings
        _showPermissionSettingsDialog();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Permission denied to access gallery'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error picking image: ${e.toString()}'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  void _showPermissionSettingsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Permission Required'),
        content: const Text(
          'Gallery permission is required to select an image. Please enable it in app settings.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              openAppSettings();
              Navigator.pop(context);
            },
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
  }

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
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Let's join the Proficie learning ecosystem & meet our professional mentors. It's Free!",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Manrope_semibold',
                    color: notifier.textColorGrey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: height / 100),
                GestureDetector(
                  onTap: _pickImage,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: notifier.textField,
                        backgroundImage:
                        _profileImage != null ? FileImage(_profileImage!) : null,
                        child: _profileImage == null
                            ? Icon(
                          Icons.camera_alt,
                          color: notifier.textColor,
                          size: 40,
                        )
                            : null,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: const Color(0xff0056D2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height / 40),
                _buildTextField(
                  controller: _nameController,
                  hintText: "Full Name",
                  notifier: notifier,
                ),
                SizedBox(height: height / 40),
                _buildTextField(
                  controller: _emailController,
                  hintText: "Email Address",
                  notifier: notifier,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: height / 40),
                _buildPasswordField(
                  controller: _passwordController,
                  hintText: "Password",
                  hidePassword: hidePassword,
                  onTap: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  notifier: notifier,
                ),
                SizedBox(height: height / 40),
                _buildPasswordField(
                  controller: _confirmPasswordController,
                  hintText: "Confirm Password",
                  hidePassword: hideConfirmPassword,
                  onTap: () {
                    setState(() {
                      hideConfirmPassword = !hideConfirmPassword;
                    });
                  },
                  notifier: notifier,
                ),
                SizedBox(height: height / 20),
                SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(const Color(0xff0056D2)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    onPressed: () {
                      // Implement sign-up logic here
                      Navigator.of(context).pushNamed("/");
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'Manrope_bold',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("login");
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Manrope_semibold',
                          color: Color(0xff64748B),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        " Sign In",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Manrope_bold',
                          color: Color(0xff0056D2),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required ColorNotifire notifier,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: notifier.textField, width: 1),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: TextStyle(
          fontFamily: 'Manrope_bold',
          fontSize: 14,
          color: notifier.textColor,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: 'Manrope_bold',
            fontSize: 14,
            color: notifier.textField,
            fontWeight: FontWeight.w500,
          ),
          contentPadding: const EdgeInsets.all(18),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hintText,
    required bool hidePassword,
    required VoidCallback onTap,
    required ColorNotifire notifier,
  }) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: notifier.textField, width: 1),
      ),
      child: TextField(
        controller: controller,
        obscureText: hidePassword,
        style: TextStyle(
          fontFamily: 'Manrope_bold',
          fontSize: 14,
          color: notifier.textColor,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: 'Manrope_bold',
            fontSize: 14,
            color: notifier.textField,
            fontWeight: FontWeight.w500,
          ),
          contentPadding: const EdgeInsets.all(18),
          suffixIcon: IconButton(
            icon: Icon(
              hidePassword ? Icons.visibility_off : Icons.visibility,
              color: const Color(0xff94A3B8),
            ),
            onPressed: onTap,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}