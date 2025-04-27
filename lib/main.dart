
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
