import 'package:flutter/material.dart';

class TrainingListTile extends StatelessWidget {
  final String trainingNumber;

  TrainingListTile({
    super.key,
    required this.trainingNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(trainingNumber),
      ),
    );
  }
}
