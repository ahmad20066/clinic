import 'package:clinic/data/models/admin_model.dart';
import 'package:clinic/data/models/doctor_model.dart';
import 'package:clinic/data/models/user_model.dart';
import 'package:dio/dio.dart';

import '../../common/constants/end_points.dart';
import '../../common/providers/remote/api_provider.dart';
import '../models/app_response.dart';

class AuthRepository {
  Future<AppResponse> login(Map<String, dynamic> loginBody) async {
    try {
      var appResponse =
          await ApiProvider.post(url: EndPoints.login, body: loginBody);

      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> register(UserModel user) async {
    try {
      var appResponse = await ApiProvider.post(
          url: EndPoints.register, body: {}, query: user.toMapRegister());

      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> createDoctor(DoctorModel user) async {
    try {
      var appResponse = await ApiProvider.post(
          url: EndPoints.createDoctor, body: {}, query: user.toMap());

      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> createAdmin(AdminModel user) async {
    try {
      var appResponse = await ApiProvider.post(
          url: EndPoints.createAdmin, body: {}, query: user.toMap());

      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  // Future<AppResponse> logOut() async {
  //   try {
  //     var appResponse = await ApiProvider.post(
  //         url: EndPoints.logOutApi, token: CacheProvider.getAppToken());

  //     return AppResponse(
  //         success: true, data: appResponse.data, errorMessage: null);
  //   } on DioException catch (e) {
  //     return AppResponse(
  //         success: false, data: null, errorMessage: e.message ?? e.toString());
  //   }
  // }
}
