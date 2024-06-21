import 'package:flutter/material.dart';

class AppNotifications {
  static GlobalKey<ScaffoldMessengerState> notificationsKey = GlobalKey<ScaffoldMessengerState>();

  static successSnackBar() {
    notificationsKey.currentState!.showSnackBar(
      SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green[300],
        showCloseIcon: true,
        content: const Text(
          "test",
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
