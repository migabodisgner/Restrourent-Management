import 'package:flutter_application_1/controllers/popular_product_controller.dart';
import 'package:flutter_application_1/data/api/api_client%20.dart';
import 'package:flutter_application_1/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/data/repository/popular_product_repo.dart';

Future<void> init()async {
  // api client
  Get.lazyPut(()=>ApiClient(appBaseUrl:AppConstants.BASE_URL));

  //repos
  Get.lazyPut(()=>PopularProductRepo(apiClient:Get.find()));

  // controller
  Get.lazyPut(()=>PopularProductController(popularProductRepo:Get.find())
  );
}