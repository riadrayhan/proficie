import 'package:flutter/material.dart';
import 'package:proficie/screens/account%20and%20setting/about_skillmaster.dart';
import 'package:proficie/screens/account%20and%20setting/account_security.dart';
import 'package:proficie/screens/account%20and%20setting/detail_profile.dart';
import 'package:proficie/screens/account%20and%20setting/downloaded_option.dart';
import 'package:proficie/screens/account%20and%20setting/faq_page.dart';
import 'package:proficie/screens/account%20and%20setting/help_center.dart';
import 'package:proficie/screens/account%20and%20setting/language_page.dart';
import 'package:proficie/screens/account%20and%20setting/my_account.dart';
import 'package:proficie/screens/account%20and%20setting/new_add_payment_account.dart';
import 'package:proficie/screens/account%20and%20setting/payment_account.dart';
import 'package:proficie/screens/account%20and%20setting/perosnal_data_edit.dart';
import 'package:proficie/screens/account%20and%20setting/private_policy.dart';
import 'package:proficie/screens/account%20and%20setting/push_notification.dart';
import 'package:proficie/screens/account%20and%20setting/refferal_code.dart';
import 'package:proficie/screens/account%20and%20setting/terms_and_conditions.dart';
import 'package:proficie/screens/authentication/enable_face_id.dart';
import 'package:proficie/screens/authentication/enable_finger_print.dart';
import 'package:proficie/screens/authentication/login_page.dart';
import 'package:proficie/screens/authentication/otp_page.dart';
import 'package:proficie/screens/authentication/password_page.dart';
import 'package:proficie/screens/authentication/sign_up_page.dart';
import 'package:proficie/screens/authentication/sign_up_phone_number.dart';
import 'package:proficie/screens/course/about_course.dart';
import 'package:proficie/screens/course/about_mentor.dart';
import 'package:proficie/screens/course/detail_of_course.dart';
import 'package:proficie/screens/course/list_course_page.dart';
import 'package:proficie/screens/course/list_of_mentor.dart';
import 'package:proficie/screens/home/home_page.dart';
import 'package:proficie/screens/home/latest_see_all.dart';
import 'package:proficie/screens/home/most_popular_course.dart';
import 'package:proficie/screens/home/most_popular_mentor.dart';
import 'package:proficie/screens/home/search_page.dart';
import 'package:proficie/screens/learning/learning_detail.dart';
import 'package:proficie/screens/learning/my_learning.dart';
import 'package:proficie/screens/learning/my_learning_lectures.dart';
import 'package:proficie/screens/message%20and%20notification/list_of_message.dart';
import 'package:proficie/screens/message%20and%20notification/notification.dart';
import 'package:proficie/screens/onboarded/explore_page.dart';
import 'package:proficie/screens/onboarded/get_started_page.dart';
import 'package:proficie/screens/onboarded/onboard_page.dart';
import 'package:proficie/screens/onboarded/splash.dart';
import 'package:proficie/screens/order%20and%20payment/buy_course_detail.dart';
import 'package:proficie/screens/order%20and%20payment/buy_success.dart';
import 'package:proficie/screens/order%20and%20payment/confirmation_order.dart';
import 'package:proficie/screens/order%20and%20payment/order_history.dart';
import 'package:proficie/screens/order%20and%20payment/order_history_detail.dart';
import 'package:proficie/screens/order%20and%20payment/select_payment.dart';
import 'package:proficie/screens/order%20and%20payment/voucher_page.dart';
import 'package:proficie/screens/payment_option/payment_option_list.dart';
import 'package:proficie/widget/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'Guest_User/guest_user_bottombar.dart';
import 'model/theme_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => ColorNotifire(),
            ),
          ],
          builder: (_, context) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
             // initialRoute: "splash",
              initialRoute: "/",
              routes: {
                'splash': (context) => const SplashScreen(),
                'onboard': (context) => const OnBoardingScreen(),
                'get_started': (context) => const GetStartedScreen(),
                'explore': (context) => const ExploreScreen(),
                'login': (context) => const LoginScreen(),
                'sign_up': (context) => const SignUpScreen(),
                'number': (context) => const NumberScreen(),
                'otp': (context) => const OtpScreen(),
                'password': (context) => const PasswordScreen(),
                'face_id': (context) => const EnableFace(),
                'finger_print': (context) => const FingerScreen(),
                //'/': (context) => const HomeScreen(),
                '/':(context)=>  GuestUser_BottomBar(),
               // '/': (context) => const BottomBarScreen(),
                'home_screen': (context) => const HomeScreen(),
               // 'bottom_navigation_bar': (context) => const BottomBarScreen(),
                'latest_see_all': (context) => const LatestSeeAll(),
                'most_popular_course': (context) => const MostPopularCourse(),
                'most_popular_mentor': (context) => const MostPopularMentor(),
                'search': (context) => const SearchScreen(),
                'course': (context) => const CourseScreen(),
                'list_mentor': (context) => const MentorScreen(),
                'detail_course': (context) => const CourseDetail(),
                'about_course': (context) => const AboutCourse(),
                'about_mentor': (context) => const AboutMentor(),
                'detail_education': (context) => const EducationDetail(),
                'buy_course_detail': (context) => const BuyCourseDetail(),
                'select_payment': (content) => const SelectPayment(),
                'voucher_page': (context) => const VoucherScreen(),
                'confirmation_order': (context) => const ConfirmationOrder(),
                'buy_success': (context) => const BuySuccess(),
                'my_learning': (context) => const LearningScreen(),
                'my_learning_lecture': (context) => const MyLearningLectures(),
                'message': (context) => const MessageScreen(),
                'my_account': (context) => const MyAccount(),
                'notification' : (context) => const NotificationScreen(),
                'detail_profile': (context) => const ProfileDetail(),
                'order_history' : (context) => const OrderHistory(),
                'Order_history_detail' : (context) => const OrderHistoryDetail(),
                'personal_data_edit': (context) => const PersonalData(),
                'payment_method': (context) => const PaymentMethod(),
                'new_add_payment': (context) => const NewAddPayment(),
                'PaymentOptionList': (context) =>  PaymentOptionList(),
                'downloaded_option': (context) => const DownloadedOption(),
                'language_page': (context) => const LanguageScreen(),
                'push_notification': (context) => const PushNotification(),
                'account_security': (context) => const AccountSecurity(),
                'help_center': (context) => const HelpCenter(),
                'faq': (context) => const FAQ(),
                'about_eduline': (context) => const AboutSkillmaster(),
                'private_policy': (context) => const PrivatePolicy(),
                'terms_conditions': (context) => const TermsAndConditions(),
                'referral_code': (context) => const ReferralCode(),
              },
            );
          },
        ),
      ],
    );
  }
}
