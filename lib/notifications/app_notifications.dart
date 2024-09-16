import 'package:app_mobile_horosope/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppNotifications {
  static GlobalKey<ScaffoldMessengerState> notificationsKey = GlobalKey<ScaffoldMessengerState>();

  static successSnackBar(String? message) {
    notificationsKey.currentState!.clearSnackBars();
    notificationsKey.currentState!.showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color.fromARGB(255, 84, 167, 29),
        content: Center(
          child: Text(
            message ?? 'Success',
            style: const TextStyle(color: AppPallete.white),
          ),
        ),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  static errorSnackBar(String error) {
    notificationsKey.currentState!.clearSnackBars();
    notificationsKey.currentState!.showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color(0xFFB33822),
        content: Center(
          child: Text(
            error,
          ),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
