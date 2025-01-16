import 'package:flutter/material.dart';
import 'package:beast_training/main.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _addTraining() {
    setState(() {
// todo: добавить что делать при нажатии кнопки
    });
  }

  List trainingList = [
    "Тренировка №1",
    "Тренировка №2",
    "Тренировка №3",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BEAST TRAINING'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: SvgPicture.asset(
              'assets/svg/dumbbell.svg',
              height: 30,
              width: 30,
            ),
            title: Text(
              '16.01.2025',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text(
              'Тренировка №1',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTraining,
        tooltip: 'Добавить тренировку',
        child: const Icon(Icons.add),
      ),
    );
  }
}
