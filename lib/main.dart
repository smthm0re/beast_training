import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 31, 31, 31),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'BEAST TRAINING',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 31, 31, 31),
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => ListTile(
            title: Text(
              index.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
