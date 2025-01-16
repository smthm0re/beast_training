import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TrainingTile extends StatelessWidget {
  const TrainingTile({
    super.key,
    required this.trainingNumber,
  });

  final String trainingNumber;

  @override
  Widget build(BuildContext context) {
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
        trainingNumber,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/training',
        );
      },
    );
  }
}
