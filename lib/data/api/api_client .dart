// ignore_for_file: unused_field, file_names

import 'package:flutter_application_1/utils/app_constants.dart';
import 'package:get/get.dart';

class ApiClient  extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl;

   late Map<String, String> _mainHeader;

  ApiClient({
    required this.appBaseUrl}){
      baseUrl = appBaseUrl;
      timeout = Duration(seconds: 30);
      token =AppConstants.TOKEN;
      _mainHeader={
        'Content-type':'application/json; charset=UTF-8',
        'Authorization': 'Bear $token',
      };
    }
    Future<Response> getData(String uri,) async{
      try{
        Response response = await get(uri);
        return response;
      }catch(e){
        return Response(statusCode: 1,statusText: e.toString());
      }
    }
}