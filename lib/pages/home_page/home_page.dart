import 'package:beast_training/pages/home_page/widgets/training_list_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: Text(
          'BEAST TRAINING',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
      ),
      body: ListView(
        children: [
          TrainingListTile(),
          TrainingListTile(),
          TrainingListTile(),
          TrainingListTile(),
        ],
      ),
    );
  }
}