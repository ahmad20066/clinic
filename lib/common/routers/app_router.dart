import 'package:clinic/features/auth/screens/doctor_form_screen.dart';
import 'package:clinic/features/auth/screens/login_screen.dart';
import 'package:clinic/features/auth/screens/register_screen.dart';
import 'package:clinic/features/auth/screens/welcome_screen.dart';
import 'package:clinic/common/utils/page_transition.dart';
import 'package:get/get.dart';

class AppRoute {
  static const homePageUrl = "/home";
  static const welcomePageUrl = "/welcome-page";
  static const loginPageUrl = "/login-page";
  static const registerPageUrl = "/register-page";
  static const doctorPageUrl = "/doctor-form-page";

  static List<GetPage> pages = [
    // GetPage(name: homePageUrl, page: () => HomePage())
    GetPage(name: welcomePageUrl, page: () => WelcomeScreen()),
    GetPage(name: doctorPageUrl, page: () => DoctorFormScreen()),
    GetPage(name: loginPageUrl, page: () => LoginScreen(),transition: Transition.leftToRight,),
    GetPage(name: registerPageUrl, page: () => RegisterScreen(),transition: Transition.rightToLeft),
  ];
}
