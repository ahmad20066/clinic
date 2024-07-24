import 'package:clinic/common/constants/end_points.dart';
import 'package:clinic/common/providers/remote/api_provider.dart';
import 'package:clinic/data/models/app_response.dart';
import 'package:dio/dio.dart';

class EmployeeRepository {
  Future<AppResponse> getEmployees() async {
    try {
      var appResponse = await ApiProvider.get(
          url: EndPoints.getEmployees,
          token: '2|D1pj0W1v04aBcr1FxrI6egKiNvs1JCA20HMP0Z0D973e269b');
      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }
}
