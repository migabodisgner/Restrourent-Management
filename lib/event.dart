// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'database_helper.dart';  // Import the database helper

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  int totalPlates = 60;
  int usedPlates = 0;
  bool _isConfirmed = false;

  @override
  void initState() {
    super.initState();
    _loadEventData();
  }

  // Load event data from the database
  Future<void> _loadEventData() async {
    var event = await DatabaseHelper.instance.getEvent();
    if (event != null) {
      setState(() {
        totalPlates = event['totalPlates'];
        usedPlates = event['usedPlates'];
        _isConfirmed = event['isConfirmed'] == 1;
      });
    }
  }

  // Save event data to the database
  Future<void> _saveEventData() async {
    var row = {
      'totalPlates': totalPlates,
      'usedPlates': usedPlates,
      'isConfirmed': _isConfirmed ? 1 : 0,
    };
    await DatabaseHelper.instance.insert(row);
  }

  // Add plates to the used count
  void addPlates(int plates) {
    if (_isConfirmed) return;

    setState(() {
      if (usedPlates + plates <= totalPlates) {
        usedPlates += plates;
        _saveEventData();  // Save data to database
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("You have exceeded your plate limit.")),
        );
      }
    });
  }

  // Confirm the selection
  void confirmSelection() {
    setState(() {
      _isConfirmed = true;
      _saveEventData();  // Save data to database
    });
  }

  // Reset the plate selection before confirmation
  void resetPlates() {
    setState(() {
      usedPlates = 0;
      _isConfirmed = false;
      _saveEventData();  // Save data to database
    });
  }

  // Handle the back button press
  Future<bool> _onWillPop() async {
    // Show a confirmation dialog if the user tries to go back
    if (_isConfirmed) {
      // If already confirmed, allow back navigation
      Navigator.pop(context); // Navigate back to MyHomePage
    } else {
      return (await showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('Do you want to go back without saving your changes?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Stay on the page
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Allow going back
                Navigator.pop(context); // Pop the EventPage and go back to MyHomePage
              },
              child: const Text('Yes'),
            ),
          ],
        ),
      )) ??
          false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,  // Handle back button press
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Plate Usage Event"),
          backgroundColor: Colors.green,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Handle back navigation by checking if user is confirmed or not
              if (!_isConfirmed) {
                _onWillPop(); // Show confirmation dialog
              } else {
                Navigator.pop(context); // Go back to MyHomePage
              }
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Total Plates: $totalPlates",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "Used Plates: $usedPlates",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "Remaining Plates: ${totalPlates - usedPlates}",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _isConfirmed ? null : () => addPlates(1),
                    child: const Text("1 Plate"),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _isConfirmed ? null : () => addPlates(2),
                    child: const Text("2 Plates"),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _isConfirmed ? null : () => addPlates(3),
                    child: const Text("3 Plates"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isConfirmed ? null : confirmSelection,
                child: const Text("Confirm Selection"),
              ),
              const SizedBox(height: 20),
              if (usedPlates == totalPlates)
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "You can get all the plates you need. Thank you for confirming your selection!",
                    style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              const SizedBox(height: 20),
              if (!_isConfirmed)
                ElevatedButton(
                  onPressed: resetPlates,
                  child: const Text("Reset Plates"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
