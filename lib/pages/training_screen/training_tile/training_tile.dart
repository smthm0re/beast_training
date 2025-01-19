import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

class TrainingTile extends StatelessWidget {
  TrainingTile({
    super.key,
    required this.trainingNumber,
    required this.deleteTraining,
  });

  final String trainingNumber;
  Function(BuildContext)? deleteTraining;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTraining,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(18),
            ),
          ],
        ),
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          leading: SvgPicture.asset(
            'assets/svg/dumbbell.svg',
            height: 30,
            width: 30,
          ),
          title: Text(
            '01.01.2025',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          subtitle: Text(
            trainingNumber,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.of(context).pushNamed(
              '/training',
            );
          },
        ),
      ),
    );
  }
}
