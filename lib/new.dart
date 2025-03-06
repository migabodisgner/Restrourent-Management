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
        appBar: AppBar(title: const Text("Interactive Widgets")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TextField
              TextField(
                decoration: const InputDecoration(
                  labelText: "Enter your name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                onChanged: (text) {
                  // ignore: avoid_print
                  print("User typed: $text");
                },
              ),
              const SizedBox(height: 20),

              // ElevatedButton
              ElevatedButton(
                onPressed: () {
                },
                child: const Text("Click Me"),
              ),
              const SizedBox(height: 20),

              // GestureDetector for Tap, Double Tap, Long Press
              GestureDetector(
                onTap: () {
                },
                onDoubleTap: () {
                },
                onLongPress: () {
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  child: const Center(
                    child: Text("Tap Me", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // GestureDetector for Swipe
              GestureDetector(
                onHorizontalDragEnd: (details) {
                },
                onVerticalDragEnd: (details) {
                },
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                  child: const Center(
                    child: Text("Swipe Here", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
