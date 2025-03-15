import 'package:flutter/material.dart';

class PaymentDetailsPage extends StatefulWidget {
  final Map<String, dynamic> plan;
  const PaymentDetailsPage({super.key, required this.plan});

  @override
  State<PaymentDetailsPage> createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  final TextEditingController _phoneController = TextEditingController();

  void _confirmPayment() {
    String phone = _phoneController.text;
    if (phone.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Payment initiated for ${widget.plan["name"]} using $phone")),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a phone number")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(197, 46, 128, 100),
        title: Text("Pay for ${widget.plan["name"]}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Plan: ${widget.plan["name"]}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("Price: ${widget.plan["price"]}", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text("Duration: ${widget.plan["duration"]}", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Enter Phone Number",
                border: OutlineInputBorder(),
                prefixIcon: const Icon(Icons.phone),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: _confirmPayment,
                child: const Text("Confirm Payment"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
