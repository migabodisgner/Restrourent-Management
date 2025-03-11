// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;

  void _register() async {
    String fullName = fullNameController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();

    // Phone number validation (must start with +2507 and have exactly 9 digits after)
    final RegExp phoneRegex = RegExp(r'^\+2507[0-9]{8}$');
    if (!phoneRegex.hasMatch(phone)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid phone number. Format: +2507XXXXXXXX")),
      );
      return;
    }

    if (fullName.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All fields are required.")),
      );
      return;
    }

    await DatabaseHelper.instance.registerUser(fullName, phone, password);

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Registration successful! You can now log in.")),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: fullNameController, decoration: const InputDecoration(labelText: "Full Name")),
            TextField(controller: phoneController, decoration: const InputDecoration(labelText: "Phone (+2507XXXXXXXX)")),
            TextField(controller: passwordController, obscureText: _obscurePassword, decoration: InputDecoration(labelText: "Password")),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _register, child: const Text("Register")),
          ],
        ),
      ),
    );
  }
}
