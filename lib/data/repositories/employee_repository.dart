import 'package:clinic/common/constants/end_points.dart';
import 'package:clinic/common/providers/remote/api_provider.dart';
import 'package:clinic/data/models/app_response.dart';
import 'package:dio/dio.dart';

class EmployeeRepository {
  Future<AppResponse> getEmployees() async {
    try {
      var appResponse = await ApiProvider.get(
          url: EndPoints.getEmployees, token: EndPoints.token);
      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> getReviews(String id, String date) async {
    print(id + date);
    try {
      var appResponse = await ApiProvider.post(
          url: EndPoints.getReviews,
          query: {"id": id, "date": date},
          token: EndPoints.token);
      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> getEmployeeReviews(int id) async {
    try {
      var appResponse = await ApiProvider.post(
          url: EndPoints.getEmpReviews,
          token: EndPoints.token,
          query: {'id': id});
      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> getInvoices() async {
    try {
      var appResponse = await ApiProvider.get(
          url: EndPoints.getInvoices, token: EndPoints.token);
      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }
}
