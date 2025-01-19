import 'package:beast_training/pages/training_screen/dialog_box/my_button/my_button.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 45, 45, 45),
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Добавить тренировку',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Сохранить", onPressed: onSave),
                const SizedBox(width: 8),
                MyButton(text: "Отмена", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
