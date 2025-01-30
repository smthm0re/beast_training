import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

class TrainingTileWidget extends StatelessWidget {
  final String idTraining;
  final String dateTraining;
  Function(BuildContext)? deleteTraining;

  TrainingTileWidget({
    super.key,
    required this.idTraining,
    required this.dateTraining,
    required this.deleteTraining,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTraining,
              icon: Icons.delete_outline,
              backgroundColor: Colors.red.shade400,
              foregroundColor: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          leading: SvgPicture.asset(
            'assets/svg/dumbbell.svg',
            height: 40,
            width: 40,
          ),
          title: Text(
            dateTraining,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          subtitle: Text(
            idTraining,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.of(context).pushNamed(
              '/training_structure_screen/',
              arguments: idTraining,
            );
          },
        ),
      ),
    );
  }
}
