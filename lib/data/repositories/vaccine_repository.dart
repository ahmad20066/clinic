import 'package:clinic/common/constants/end_points.dart';
import 'package:clinic/common/providers/local/cache_provider.dart';
import 'package:clinic/common/providers/remote/api_provider.dart';
import 'package:clinic/data/models/app_response.dart';
import 'package:clinic/data/models/vaccine_card.dart';
import 'package:clinic/data/models/vaccine_model.dart';
import 'package:dio/dio.dart';

class VaccineRepository {
  Future<AppResponse> getVaccines() async {
    try {
      var appResponse = await ApiProvider.get(
          url: EndPoints.indexVaccine, token: CacheProvider.getAppToken());
      print("--------------------");
      print(appResponse.statusCode);
      print(appResponse.data);
      return AppResponse(
          success: true, data: appResponse.data['vaccine'], errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> createVaccine(VaccineModel model) async {
    try {
      var appResponse = await ApiProvider.post(
        url: EndPoints.createVaccineUrl,
        query: model.toJson(),
        token: CacheProvider.getAppToken(),
      );
      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> createVaccineCard(VaccineCard model) async {
    try {
      var appResponse = await ApiProvider.post(
        url: EndPoints.createVaccineCard,
        query: model.toMap(),
        token: CacheProvider.getAppToken(),
      );
      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> updateVaccine(VaccineModel model) async {
    try {
      var appResponse = await ApiProvider.post(
        url: '${EndPoints.updateVaccine}/${model.id}',
        query: model.toJson(),
        token: CacheProvider.getAppToken(),
      );
      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> deleteVaccine(int vaccineId) async {
    print(vaccineId);
    try {
      var appResponse = await ApiProvider.delete(
        url: '${EndPoints.deleteVaccine}/$vaccineId',
        token: CacheProvider.getAppToken(),
      );
      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }
}
