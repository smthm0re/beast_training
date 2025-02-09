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
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deleteTraining,
            label: "УДАЛИТЬ",
            backgroundColor: Color.fromARGB(255, 235, 102, 91),
          ),
        ],
      ),
      child: ListTile(
        leading: SvgPicture.asset(
          'lib/ui-kit/assets/svg/dumbbell.svg',
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
            '/exercise_screen/',
            arguments: idTraining,
          );
        },
      ),
    );
  }
}
