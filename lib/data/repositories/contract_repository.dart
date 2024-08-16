import 'package:clinic/common/constants/end_points.dart';
import 'package:clinic/common/providers/local/cache_provider.dart';
import 'package:clinic/common/providers/remote/api_provider.dart';
import 'package:clinic/data/models/app_response.dart';
import 'package:clinic/data/models/contract_model.dart';
import 'package:dio/dio.dart';

class ContractRepository {
  Future<AppResponse> getContracts() async {
    try {
      var appResponse = await ApiProvider.get(
          url: EndPoints.getContracts,
          token: CacheProvider.getAppToken());
      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> createContract(ContractModel model) async {
    try {
      var appResponse = await ApiProvider.post(
        url: EndPoints.createContract,
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

  Future<AppResponse> updateContract(ContractModel model) async {
    try {
      var appResponse = await ApiProvider.post(
        url: '${EndPoints.editContract}/${model.id}',
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

  Future<AppResponse> deleteContract(int contractId) async {
    try {
      var appResponse = await ApiProvider.delete(
        url: '${EndPoints.deleteContract}/$contractId',
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
