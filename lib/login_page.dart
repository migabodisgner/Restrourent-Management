// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_application_1/database_helper.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;

  void _login() async {
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();

    final user = await DatabaseHelper.instance.getUser(phone, password);

    if (!mounted) return;

    if (user != null) {
      Navigator.pushReplacementNamed(context, "/home", arguments: user);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid credentials. Please try again.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(225, 1, 1, 1),
        title: Row(
          children: [
            Image.asset(
              'assets/Logos/log.webp',  // Ensure the image path is correct
              height: 90,
              width: 110,  // Adjust the size as needed
            ),
            const SizedBox(width: 30), // Add space between logo and title
            const Text(
              " Sign in Form",
              style: TextStyle(color: Color.fromARGB(255, 150, 137, 21)),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Images/login.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Foreground Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: const Color.fromARGB(255, 101, 114, 109),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: phoneController,
                        decoration: const InputDecoration(
                          labelText: "Phone (+250XXXXXXXXX)",
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 65, 44, 52)),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: passwordController,
                        obscureText: _obscurePassword,
                        decoration: const InputDecoration(
                          labelText: "Password",
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 145, 160, 13)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _login,
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Color.fromARGB(255, 44, 54, 89)),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterPage()),
                    );
                  },
                  child: const Text(
                    "Create Account",
                    style: TextStyle(color: Color.fromARGB(255, 66, 28, 170)),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Forgot Password? Contact support.",
                          style: TextStyle(
                              color: Color.fromARGB(255, 222, 211, 231)),
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: Color.fromARGB(255, 60, 55, 126)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
