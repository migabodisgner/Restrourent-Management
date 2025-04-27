// ignore_for_file: unused_element, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_1/event.dart';
import 'package:flutter_application_1/main_food.dart';
import 'package:flutter_application_1/pages/popular_food_detail.dart';
import 'package:get/get.dart';
import 'login_page.dart';
import 'database_helper.dart';
import 'payment_page.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/pages/recomanded_food_datail.dart';

class MyHomePage extends StatefulWidget {
  final String userPhone;

  const MyHomePage({super.key, required this.userPhone});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic>? user;
  List<Map<String, dynamic>> _users = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      user = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    });
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final data = await DatabaseHelper.instance.getAllUsers();
    setState(() {
      _users = data;
    });
  }

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  void _payment() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PaymentPage()),
    );
  }

  void _event() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EventPage()),
    );
  }

  void _main_Food() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MainFood()),
    );
  }
 void _popular_food_detail(){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const PopularFoodDetail()),
  );
 }
 void _recomanded_food_datail(){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const RecomandedFoodDatail()),
  );
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(225, 10, 10, 20),
        title: Row(
          children: [
            Image.asset(
              'assets/Logos/log.webp',
              height: 90,
              width: 110,
            ),
            const SizedBox(width: 100, height: 20),
            const Text(
              " ",
              style: TextStyle(color: Color.fromARGB(255, 150, 137, 21)),
            ),
          ],
        ),
      ),
      
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu',
                style: TextStyle(color: Color.fromARGB(255, 80, 38, 83), fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Customers'),
              onTap: () {
                Navigator.pop(context);
                _navigateToPage(CustomersScreen(users: _users));
              },
            ),
            
            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('payment'),
              onTap: _payment,
            ),
            ListTile(
              leading: const Icon(Icons.event),
              title: const Text('event'),
              onTap: _event,
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: _logout,
            ),
            ListTile(
              leading: const Icon(Icons.fastfood),
              title: const Text('Main Food'),
              onTap: _main_Food,
            ),
            ListTile(
              leading: const Icon(Icons.food_bank_rounded),
              title: const Text('PopularFoodpages'),
              onTap: _popular_food_detail,
            ),
            ListTile(
              leading: const Icon(Icons.recommend),
              title: const Text('RecomandedFoodDatail'),
              onTap: _recomanded_food_datail,
            ),
          ],
        ),
      ),
      body: 
       ClientScreen(user: user),
    );
  }

  void _navigateToPage(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(179, 243, 244, 244),
      appBar: AppBar(
        title: const Text(
          "DinaBalance",
          style: TextStyle(color: Color.fromARGB(145, 112, 4, 201)),
        ),
      ),
      body: const Center(child: Text("Welcome to Home Page")),
    );
  }
}

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(179, 243, 244, 244),
      appBar: AppBar(
        title: const Text(
          "DinaBalance",
          style: TextStyle(color: Color.fromARGB(145, 112, 4, 201)),
        ),
      ),
      body: const Center(child: Text("Help Section")),
    );
  }
}

class CustomersScreen extends StatelessWidget {
  final List<Map<String, dynamic>> users;
  const CustomersScreen({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(179, 243, 244, 244),
      appBar: AppBar(
        title: const Text(
          "DinaBalance",
          style: TextStyle(color: Color.fromARGB(145, 112, 4, 201)),
        ),
      ),
      body: users.isEmpty
          ? const Center(child: Text("No users registered."))
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.person, color: Colors.blue),
                  title: Text(users[index]["fullname"]),
                  subtitle: Text("Phone: ${users[index]["phone"]}"),
                );
              },
            ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(179, 243, 244, 244),
      appBar: AppBar(
        title: const Text(
          "DinaBalance",
          style: TextStyle(color: Color.fromARGB(145, 112, 4, 201)),
        ),
      ),
      body: const Center(child: Text("Settings Page")),
    );
  }
}

class ClientScreen extends StatelessWidget {
  final Map<String, dynamic>? user;

  const ClientScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Background Image
            Container(
              width: 500,
              height: 5001,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Images/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Welcome to DinaBalance Reception App.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                      if (user != null) ...[
                        const SizedBox(height: 10),
                        Text(
                          "Name: ${user!["fullname"]}",
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Phone: ${user!["phone"]}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ] else
                        const Text(
                          "No user information available.",
                          style: TextStyle(color: Colors.white),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
