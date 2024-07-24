import 'package:clinic/common/constants/end_points.dart';
import 'package:clinic/common/providers/remote/api_provider.dart';
import 'package:clinic/data/models/app_response.dart';
import 'package:clinic/data/models/clinic_model.dart';
import 'package:dio/dio.dart';

class ClinicRepository {
  Future<AppResponse> getClinics() async {
    try {
      var appResponse = await ApiProvider.get(
          url: EndPoints.getClinicsUrl,
          token: '2|D1pj0W1v04aBcr1FxrI6egKiNvs1JCA20HMP0Z0D973e269b');
      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> createClinic(ClinicModel model) async {
    try {
      var appResponse = await ApiProvider.post(
        url: EndPoints.createClinicUrl,
        query: model.toJson(),
        token: '2|D1pj0W1v04aBcr1FxrI6egKiNvs1JCA20HMP0Z0D973e269b',
      );
      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> updateClinic(ClinicModel model) async {
    try {
      var appResponse = await ApiProvider.post(
        url: '${EndPoints.updateClinicUrl}/${model.id}',
        query: model.toJson(),
        token: '2|D1pj0W1v04aBcr1FxrI6egKiNvs1JCA20HMP0Z0D973e269b',
      );
      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> deleteClinic(int clinicId) async {
    try {
      var appResponse = await ApiProvider.delete(
        url: '${EndPoints.deleteClinicUrl}/$clinicId',
        token: '2|D1pj0W1v04aBcr1FxrI6egKiNvs1JCA20HMP0Z0D973e269b',
      );
      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }
}
