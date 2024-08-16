import 'package:clinic/common/constants/end_points.dart';
import 'package:clinic/common/providers/local/cache_provider.dart';
import 'package:clinic/common/providers/remote/api_provider.dart';
import 'package:clinic/data/models/app_response.dart';
import 'package:clinic/data/models/medicine_model.dart';
import 'package:dio/dio.dart';

class MedicineRepository {
  Future<AppResponse> getMedicines() async {
    try {
      var appResponse = await ApiProvider.get(
          url: EndPoints.getMedicines,
          token: CacheProvider.getAppToken());
      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> createMedicine(MedicineModel model) async {
    try {
      var appResponse = await ApiProvider.post(
        url: EndPoints.createMedicine,
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

  Future<AppResponse> updateMedicine(MedicineModel model) async {
    try {
      var appResponse = await ApiProvider.post(
        url: '${EndPoints.updateMedicine}/${model.id}',
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

  Future<AppResponse> deleteMedicine(int vaccineId) async {
    print(vaccineId);
    try {
      var appResponse = await ApiProvider.delete(
        url: '${EndPoints.deleteMedicine}/$vaccineId',
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