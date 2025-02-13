import 'package:beast_training/ui-kit/notification_service/notification_service.dart';
import 'package:flutter/material.dart';

class NotificationTimePicker extends StatelessWidget {
  final NotificationService notificationService;
  final String notificationTitle;
  final String notificationBody;

  const NotificationTimePicker({
    super.key,
    required this.notificationService,
    required this.notificationTitle,
    required this.notificationBody,
  });

  Future<void> selectNotificationTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      print('Время выбрано: $pickedTime');
      await notificationService.scheduleNotification(
        title: notificationTitle,
        body: notificationBody,
        time: pickedTime,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Уведомление запланировано на ${pickedTime.format(context)}',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.access_time),
      onPressed: () async {
        await selectNotificationTime(context);
      },
    );
  }
}
