import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<String> restaurants = [
    "Jollybee",
    "fifufoods",
    "loveyDovey",
    "Heartbeat",
    'ghostly kisses'
  ];
  int? currentIndex; // Use int? to allow null values initially

  _MyAppState() {
    currentIndex = null; // Set currentIndex to null in the constructor
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('What do you want to eat'),
              if (currentIndex != null)
                Text(
                  restaurants[currentIndex!], // Use ! to assert that currentIndex is not null
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              Padding(
                padding: EdgeInsets.only(top: 50),
              ),
              ElevatedButton(
                onPressed: () {
                  updateIndex();
                },
                child: Text('Pick Restaurant'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateIndex() {
    final random = Random();
    final index = random.nextInt(restaurants.length);
    setState(() {
      currentIndex = index;
    });
  }
}
