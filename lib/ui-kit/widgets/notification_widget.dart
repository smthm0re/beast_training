import 'package:beast_training/ui-kit/notification_service/notification_service.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.notifications),
      onPressed: () async {
        await notificationService.showNotification(
          title: 'Пора на тренировку!',
          body: 'Вы давно не были в зале',
        );
      },
    );
  }
}
