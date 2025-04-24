// ignore_for_file: duplicate_import

import 'package:flutter_application_1/data/api/api_client%20.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/utils/app_constants.dart';
import '../../utils/app_constants.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async{
  return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URL);
  }
}