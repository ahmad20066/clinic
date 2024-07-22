import 'package:clinic/features/auth/screens/admin_form_screen.dart';
import 'package:clinic/features/auth/screens/doctor_form_screen.dart';
import 'package:clinic/features/auth/screens/login_screen.dart';
import 'package:clinic/features/auth/screens/register_screen.dart';
import 'package:clinic/features/auth/screens/welcome_screen.dart';
import 'package:clinic/common/utils/page_transition.dart';
import 'package:clinic/features/home/pages/home_page.dart';
import 'package:get/get.dart';

class AppRoute {
  static const homePageUrl = "/home";
  static const welcomePageUrl = "/welcome-page";
  static const loginPageUrl = "/login-page";
  static const registerPageUrl = "/register-page";
  static const doctorPageUrl = "/doctor-form-page";
  static const adminPageUrl = "/admin_form";

  static List<GetPage> pages = [
    // GetPage(name: homePageUrl, page: () => HomePage())
    GetPage(name: welcomePageUrl, page: () => WelcomeScreen()),
    GetPage(
        name: doctorPageUrl,
        page: () => DoctorFormScreen(),
        transition: Transition.rightToLeft),
    GetPage(
      name: loginPageUrl,
      page: () => LoginScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
        name: registerPageUrl,
        page: () => RegisterScreen(),
        transition: Transition.rightToLeft),
    GetPage(
        name: adminPageUrl,
        page: () => AdminFormScreen(),
        transition: Transition.rightToLeft),
    GetPage(
        name: homePageUrl,
        page: () => HomePage(),
        transition: Transition.upToDown),
  ];
}
