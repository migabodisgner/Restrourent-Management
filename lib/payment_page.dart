// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key, Map<String, dynamic>? user});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController amountController = TextEditingController();
  String? selectedPaymentMethod;

  Future<void> _updatePayment() async {
    if (selectedPaymentMethod == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please select a payment method.")));
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    double amount = double.tryParse(amountController.text) ?? 0;
    double currentBalance = prefs.getDouble("remainingBalance") ?? 100;

    if (amount <= 0 || amount > currentBalance) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Invalid amount.")));
      return;
    }

    prefs.setDouble("remainingBalance", currentBalance - amount);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Payment successful!")));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Payment")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: amountController, decoration: const InputDecoration(labelText: "Amount (RWF)")),
            DropdownButton<String>(
              value: selectedPaymentMethod,
              hint: const Text("Select Payment Method"),
              items: ["MTN Mobile Money", "Airtel Money"].map((String method) {
                return DropdownMenuItem(value: method, child: Text(method));
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedPaymentMethod = value;
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _updatePayment, child: const Text("Submit Payment")),
          ],
        ),
      ),
    );
  }
}
