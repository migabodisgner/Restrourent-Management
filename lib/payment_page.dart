// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController amountController = TextEditingController();

  Future<void> _updatePayment() async {
    final prefs = await SharedPreferences.getInstance();
    double amount = double.tryParse(amountController.text) ?? 0;
    prefs.setDouble("remainingBalance", (prefs.getDouble("remainingBalance") ?? 100) - amount);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Payment")),
      body: Column(
        children: [TextField(controller: amountController, decoration: const InputDecoration(labelText: "Amount")),
          ElevatedButton(onPressed: _updatePayment, child: const Text("Submit Payment")),
        ],
      ),
    );
  }
}