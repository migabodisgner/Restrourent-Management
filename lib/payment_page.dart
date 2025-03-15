import 'package:flutter/material.dart';
import 'payment_details_page.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> plans = [
      {"name": "Basic Plan", "price": "600 RWF", "duration": "one plate"},
      {"name": "Standard Plan", "price": "17,500 RWF", "duration": "15 Days"},
      {"name": "Premium Plan", "price": "35,000 RWF", "duration": "30 Days"},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(197, 46, 128, 100),
        title: const Text("Payment Plans"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: plans.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: const Icon(Icons.payment, color: Colors.blue),
                title: Text(plans[index]["name"], style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text("${plans[index]["price"]} - ${plans[index]["duration"]}"),
                trailing: const Icon(Icons.arrow_forward, color: Colors.green),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentDetailsPage(plan: plans[index]),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
