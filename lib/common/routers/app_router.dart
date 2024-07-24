import 'package:clinic/features/auth/screens/doctor_form_screen.dart';
import 'package:clinic/features/auth/screens/login_screen.dart';
import 'package:clinic/features/auth/screens/register_screen.dart';
import 'package:clinic/features/auth/screens/welcome_screen.dart';
import 'package:clinic/common/utils/page_transition.dart';
import 'package:clinic/features_admin/clinic/pages/create_clinic_page.dart';
import 'package:clinic/features_admin/clinic/pages/edit_clinic_page.dart';
import 'package:clinic/features_admin/contract/pages/contracts_page.dart';
import 'package:clinic/features_admin/contract/pages/create_contract_page.dart';
import 'package:clinic/features_admin/contract/pages/edit_contract_page.dart';
import 'package:clinic/features_admin/main_layout/pages/nav_bar_page.dart';
import 'package:clinic/features_admin/medicine/pages/create_medicine_page.dart';
import 'package:clinic/features_admin/medicine/pages/edit_medicine_page.dart';
import 'package:clinic/features_admin/medicine/pages/medicines_page.dart';
import 'package:clinic/features_admin/vaccine/pages/create_vaccine_page.dart';
import 'package:clinic/features_admin/vaccine/pages/edit_vaccine_page.dart';
import 'package:get/get.dart';

class AppRoute {
  static const homePageUrl = "/home";
  static const welcomePageUrl = "/welcome-page";
  static const loginPageUrl = "/login-page";
  static const registerPageUrl = "/register-page";
  static const doctorPageUrl = "/doctor-form-page";

  //admin pages
  static const adminMainLayout = '/admin-main-layout';
  static const addClinicPage = '/add-clinic-page';
  static const editClinicPage = '/edit-clinic-page';
  static const createVaccinePage = '/create-vaccine-page';
  static const editVaccinePage = '/edit-vaccine-page';
  static const medicinesPage = '/medicines-page';
  static const editMedicinePage = '/edit-medicine-page';
  static const createMedicinePage = '/create-medicine-page';
  static const contractsPage = '/contracts-page';
  static const createContractPage = '/create-contract-page';
  static const editContractPage = '/edit-contract-page';

  static List<GetPage> pages = [
    // GetPage(name: homePageUrl, page: () => HomePage())
    GetPage(name: welcomePageUrl, page: () => WelcomeScreen()),
    GetPage(name: doctorPageUrl, page: () => DoctorFormScreen()),
    GetPage(
        name: loginPageUrl,
        page: () => LoginScreen(),
        transition: Transition.leftToRight),
    GetPage(
        name: registerPageUrl,
        page: () => RegisterScreen(),
        transition: Transition.rightToLeft),

    //admin
    GetPage(name: adminMainLayout, page: () => AdminNavBarPage()),
    GetPage(name: editClinicPage, page: () => EditClinicPage()),
    GetPage(name: addClinicPage, page: () => CreateClinicPage()),
    GetPage(name: createVaccinePage, page: () => CreateVaccinePage()),
    GetPage(name: editVaccinePage, page: () => EditVaccinePage()),
    GetPage(name: medicinesPage, page: () => MedicinesPage()),
    GetPage(name: editMedicinePage, page: () => EditMedicinePage()),
    GetPage(name: createMedicinePage, page: () => CreateMedicinePage()),
    GetPage(name: contractsPage, page: () => ContractsPage()),
    GetPage(name: createContractPage, page: () => CreateContractPage()),
    GetPage(name: editContractPage, page: () => EditContractPage())
  ];
}
