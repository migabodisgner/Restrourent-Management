import 'package:flutter_application_1/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo });
  List<dynamic> _popularProductList=[];
  List<dynamic> get popularProductList => popularProductList;

  Future<void> getPopularProductList()async {
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode==20){
      _popularProductList=[];
     // _popularProductList.addAll();
      update();
    }else{

    }
    
  }
}