import 'package:flutter/material.dart';
import 'login_page.dart';
import 'database_helper.dart';

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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(199, 211, 208, 151),
          title: const Text("DinaBalance"),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Home'),
              Tab(text: 'Client'),
              Tab(text: 'Help'),
              Tab(text: 'Customers'),
              Tab(text: 'Settings'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Home Page
            Container(
              color: const Color.fromARGB(255, 199, 175, 180), // Adjusted opacity
              child: const Center(
                child: Text(
                  "Welcome to Home Page",
                  style: TextStyle(color: Color.fromARGB(255, 8, 61, 129)),
                ),
              ),
            ),

            // About Us Page (Includes Logout Button)
            Container(
              color: const Color.fromARGB(255, 199, 175, 180),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Welcome to DinaBalance Reception App.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  if (user != null) ...[
                    const Text(
                      "Registered User:",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Name: ${user!['fullname']}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Phone: ${user!['phone']}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _logout,
                      child: const Text("Logout"),
                    ),
                  ] else ...[
                    const Text(
                      "No user information available.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ],
              ),
            ),

            // Help Section
            Container(
              color: const Color.fromARGB(255, 199, 175, 180), // Fixed invalid RGB values
              child: const Center(
                child: Text("Help Section"),
              ),
            ),

            // Data Page (Registered Users)
            Container(
              color: const Color.fromARGB(255, 199, 175, 180),
              padding: const EdgeInsets.all(16.0),
              child: _users.isEmpty
                  ? const Center(
                      child: Text(
                        "No users registered.",
                        style: TextStyle(color: Color.fromARGB(255, 97, 85, 99)),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _users.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(Icons.person, color: Colors.blue),
                          title: Text(_users[index]["fullname"]),
                          subtitle: Text("Phone: ${_users[index]["phone"]}"),
                        );
                      },
                    ),
            ),

            // Settings Page
            Container(
              color: const Color.fromARGB(255, 199, 175, 180),
              child: const Center(
                child: Text(
                  "Settings Page",
                  style: TextStyle(color: Color.fromARGB(255, 24, 40, 128)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
