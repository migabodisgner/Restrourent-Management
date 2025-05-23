// ignore_for_file: recursive_getters, avoid_print

import 'package:flutter_application_1/data/repository/popular_product_repo.dart';
import 'package:flutter_application_1/models/products_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo });
  List<dynamic> _popularProductList=[];
  List<dynamic> get popularProductList => popularProductList;

  Future<void> getPopularProductList()async {
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode==200){
      print("got product");
      _popularProductList=[];
      _popularProductList.addAll(Product.fromJson(response.body).products);
    //print(_popularProductList);
      update();
    }else{

    }
    
  }
}