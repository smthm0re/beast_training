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
      backgroundColor: Color.fromARGB(255, 31, 31, 31),
      appBar: AppBar(

      ),
    );
  }
}

// appBar: AppBar(
// centerTitle: true,
// title: Text(
// 'BEAST TRAINING',
// style: TextStyle(
// color: Colors.white,
// fontWeight: FontWeight.w600,
// fontSize: 24,
// ),
// ),
// backgroundColor: Color.fromARGB(255, 31, 31, 31),
// ),
// body: ListView.builder(
// itemCount: 5,
// itemBuilder: (context, index) => ListTile(
// title: Text(
// index.toString(),
// style: TextStyle(color: Colors.white),
// ),
// ),
// ),
// ),
// );
// }
// }
