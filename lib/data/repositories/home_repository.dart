import 'package:clinic/common/constants/end_points.dart';
import 'package:clinic/common/providers/local/cache_provider.dart';
import 'package:clinic/common/providers/remote/api_provider.dart';
import 'package:clinic/data/models/app_response.dart';
import 'package:clinic/data/models/order_med_model.dart';
import 'package:clinic/data/models/order_model.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  Future<AppResponse> getMedics() async {
    try {
      var appResponse = await ApiProvider.get(
          url: EndPoints.indexMedical, token: CacheProvider.getAppToken());

      return AppResponse(
          success: true, data: appResponse.data['medical'], errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> getDoctors() async {
    try {
      var appResponse = await ApiProvider.get(
          url: EndPoints.indexDoctor, token: CacheProvider.getAppToken());

      return AppResponse(
          success: true, data: appResponse.data['doctor'], errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: false, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> createOrder(OrderModel model) async {
    try {
      var appResponse = await ApiProvider.post(
        url: EndPoints.createOrder,
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

  Future<AppResponse> createOrderMed(OrderMedModel model) async {
    try {
      var appResponse = await ApiProvider.post(
        url: EndPoints.createOrMed,
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
}
