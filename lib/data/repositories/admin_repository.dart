import 'package:clinic/common/constants/end_points.dart';
import 'package:clinic/common/providers/remote/api_provider.dart';
import 'package:clinic/data/models/admin_model.dart';
import 'package:clinic/data/models/app_response.dart';
import 'package:dio/dio.dart';

class AdminRepository {
  Future<AppResponse> getAdmins() async {
    try {
      var appResponse = await ApiProvider.get(
          url: EndPoints.getAdmins,
          token: EndPoints.token);
      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> createAdmin(AdminModel model) async {
    try {
      var appResponse = await ApiProvider.post(
        url: EndPoints.createAdmin,
        query: model.toJson(),
        token: EndPoints.token,
      );
      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> updateAdmin(AdminModel model) async {
    try {
      var appResponse = await ApiProvider.post(
        url: '${EndPoints.updateAdmin}/${model.id}',
        query: model.toJson(),
        token: EndPoints.token,
      );
      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> deleteAdmin(int adminId) async {
    try {
      var appResponse = await ApiProvider.delete(
        url: '${EndPoints.deleteAdmin}/$adminId',
        token: EndPoints.token,
      );
      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }
}