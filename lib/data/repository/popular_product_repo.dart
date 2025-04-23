import 'package:flutter_application_1/data/api/api_client%20.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async{
  return await apiClient.getData("https://www.dbestech.com/api/product/list");
  }
}