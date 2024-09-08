import 'package:flutter/material.dart';

class AppNotifications {
  static GlobalKey<ScaffoldMessengerState> notificationsKey = GlobalKey<ScaffoldMessengerState>();

  static successSnackBar(String? message) {
    notificationsKey.currentState!.showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color(0xffF7F8FB),
        content: Center(
          child: Text(
            message ?? 'Success',
            style: const TextStyle(color: Colors.black),
          ),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static errorSnackBar(String error) {
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
