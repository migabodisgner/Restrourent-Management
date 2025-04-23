import 'package:flutter_application_1/controllers/popular_product_controller.dart';
import 'package:flutter_application_1/data/api/api_client%20.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/data/repository/popular_product_repo.dart';

Future<void> init()async {
  // api client
  Get.lazyput(()=>ApiClient(appBaseUrl: "https://www.dbestech.com"));

  //repos
  Get.lazyput(()=>PopularProductRepo(apiClient:Get.find()));

  // controller
  Get.lazyput(()=>PopularProductController(popularProductRepo:Get.find()));
}