import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic>? user;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      user = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?; // Fetch user data
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text("DinaBalance"),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Home'),
              Tab(text: 'About Us'),
              Tab(text: 'Help'),
              Tab(text: 'Data'),
              Tab(text: 'Settings'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Home Page
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text("Welcome to Home "),
              ),
            ),
            // About Us Page (Showing User Information)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome to DinaBalance Reception App.\nOur goal is to provide a seamless experience for tracking customer payments and balances for a 30-day usage plan.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 20),
                    if (user != null) ...[
                      const Text(
                        "Registered User:",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text("Name: ${user!['fullName']}", style: const TextStyle(fontSize: 16)),
                      Text("Phone: ${user!['phone']}", style: const TextStyle(fontSize: 16)),
                    ] else ...[
                      const Text("No user information available.", style: TextStyle(fontSize: 16)),
                    ],
                  ],
                ),
              ),
            ),
            // Help Page
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text("What do you need help with?"),
              ),
            ),
            // Data Page
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text("Members of Group NSHIMIYIMANA ALPHONSE - MUGISHA JOSHUA - MANZI JONATHAN"),
              ),
            ),
            // Settings Page
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text("Settings options will go here."),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
