import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'register_page.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reception App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const LoginPage(),
        "/home": (context) => const MyHomePage(userPhone: '',),
        "/register": (context) => const RegisterPage(),
       
      },
    );
  }
}



















/*
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_1/home/food_page_body.dart';
import 'package:flutter_application_1/main_food.dart';
import 'package:flutter_application_1/pages/popular_food_detail.dart';
import 'package:flutter_application_1/pages/recomanded_food_datail.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'register_page.dart';
import 'package:get/get.dart';
import 'helper/depandencies.dart' as dep;
import 'controllers/popular_product_controller.dart'; // <-- Make sure to import this

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();

  // Call your controller method here
  Get.find<PopularProductController>().getPopularProductList();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reception App',
      theme: ThemeData(
        primarySwatch:  Colors.blue,
      ),
      
      home: MainFood(),
      
    );
  }
}

*/