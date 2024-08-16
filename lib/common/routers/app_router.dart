import 'package:clinic/features/auth/screens/admin_form_screen.dart';
import 'package:clinic/features/auth/screens/doctor_form_screen.dart';
import 'package:clinic/features/auth/screens/login_screen.dart';
import 'package:clinic/features/auth/screens/register_screen.dart';
import 'package:clinic/features/auth/screens/welcome_screen.dart';
import 'package:clinic/common/utils/page_transition.dart';
import 'package:clinic/features/doctor/pages/doctor_details_page.dart';
import 'package:clinic/features/home/pages/home_page.dart';
import 'package:clinic/features/medics/pages/medic_details_page.dart';
import 'package:clinic/features_admin/admin/pages/admins_page.dart';
import 'package:clinic/features_admin/admin/pages/create_admin_page.dart';
import 'package:clinic/features_admin/admin/pages/edit_admin_page.dart';
import 'package:clinic/features_admin/clinic/pages/create_clinic_page.dart';
import 'package:clinic/features_admin/clinic/pages/edit_clinic_page.dart';
import 'package:clinic/features_admin/contract/pages/contracts_page.dart';
import 'package:clinic/features_admin/contract/pages/create_contract_page.dart';
import 'package:clinic/features_admin/contract/pages/edit_contract_page.dart';
import 'package:clinic/features/main_layout/pages/nav_bar_page.dart';
import 'package:clinic/features_admin/main_layout/pages/nav_bar_page.dart';
import 'package:clinic/features_admin/medicine/pages/create_medicine_page.dart';
import 'package:clinic/features_admin/medicine/pages/edit_medicine_page.dart';
import 'package:clinic/features_admin/medicine/pages/medicines_page.dart';
import 'package:clinic/features_admin/vaccine/pages/create_vaccine_page.dart';
import 'package:clinic/features_admin/vaccine/pages/edit_vaccine_page.dart';
import 'package:clinic/features_employee/main_layout/pages/nav_bar_page.dart';
import 'package:get/get.dart';

class AppRoute {
  static const homePageUrl = "/home";
  static const welcomePageUrl = "/welcome-page";
  static const loginPageUrl = "/login-page";
  static const registerPageUrl = "/register-page";
  static const doctorPageUrl = "/doctor-form-page";
  static const doctorDetailsPageUrl = "/doctor-details";
  static const adminPageUrl = "/admin_form";
  static const medicinePageUrl = "/medicine-details";
  static const mainLayout = '/main-layout';
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
  static const adminsPage = '/admins-page';
  static const createAdminPage = '/create-admin-page';
  static const editAdminPage = '/edit-admin-page';
  static const employeeMainLayoutPage = '/employee-mainlayout-page';

  static List<GetPage> pages = [
    // GetPage(name: homePageUrl, page: () => HomePage())
    GetPage(name: welcomePageUrl, page: () => WelcomeScreen()),

    GetPage(
      name: loginPageUrl,
      page: () => LoginScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(name: doctorPageUrl, page: () => DoctorFormScreen()),

    GetPage(
        name: adminPageUrl,
        page: () => AdminFormScreen(),
        transition: Transition.rightToLeft),
    GetPage(
        name: homePageUrl,
        page: () => HomePage(),
        transition: Transition.upToDown),
    GetPage(
      name: medicinePageUrl,
      page: () => MedicDetails(),
    ),
    GetPage(name: mainLayout, page: () => NavBarPage()),
    GetPage(name: doctorDetailsPageUrl, page: () => DoctorDetailsPage()),
    

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
    GetPage(name: editContractPage, page: () => EditContractPage()),
    GetPage(name: adminsPage, page: () => AdminsPage()),
    GetPage(name: createAdminPage, page: () => CreateAdminPage()),
    GetPage(name: editAdminPage, page: () => EditAdminPage()),

    //employee 
    GetPage(name: employeeMainLayoutPage, page: () => EmployeeNavBarPage()),
  ];
}
