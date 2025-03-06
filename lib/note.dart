import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Navigation App")),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Home Icon
            Builder(builder: (context) {
              return IconButton(
                icon: const Icon(Icons.home, size: 40),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InfoScreen(
                        title: "Welcome to our Home",
                        content: "This app gives you a bonus you need!",
                      ),
                    ),
                  );
                },
              );
            }),

            // Star Icon
            Builder(builder: (context) {
              return IconButton(
                icon: const Icon(Icons.star, size: 40),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InfoScreen(
                        title: "Welcome to our Star",
                        content:
                            "You can shine! This app gives you the bonus you need.",
                      ),
                    ),
                  );
                },
              );
            }),

            // Settings Icon
            Builder(builder: (context) {
              return IconButton(
                icon: const Icon(Icons.settings, size: 40),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InfoScreen(
                        title: "Welcome to our Settings",
                        content: "What can I help you with?",
                      ),
                    ),
                  );
                },
              );
            }),

            // About Us Icon
            Builder(builder: (context) {
              return IconButton(
                icon: const Icon(Icons.info, size: 40),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InfoScreen(
                        title: "About Us",
                        content: "We help customers get what they want!",
                      ),
                    ),
                  );
                },
              );
            }),

            // Data Icon
            Builder(builder: (context) {
              return IconButton(
                icon: const Icon(Icons.storage, size: 40),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InfoScreen(
                        title: "Data",
                        content: "We're here to help you, my bro!",
                      ),
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

// Screen to display information
class InfoScreen extends StatelessWidget {
  final String title;
  final String content;

  const InfoScreen({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            content,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
