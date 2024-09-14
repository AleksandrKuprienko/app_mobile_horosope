import 'package:app_mobile_horosope/features/auth/login/login_page.dart';
import 'package:app_mobile_horosope/features/auth/registration/registration_page.dart';
import 'package:app_mobile_horosope/features/home/pages/home_page.dart';
import 'package:app_mobile_horosope/features/profile/pages/profile_page.dart';
import 'package:flutter/material.dart';

class MainNavigator {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void registration() => navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => const RegistrationPage(),
        ),
      );

  static void login() => navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
          fullscreenDialog: true,
        ),
      );

  static void home() => navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
          fullscreenDialog: true,
        ),
      );

  static void profilePage() => navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => const ProfilePage(),
          fullscreenDialog: true,
        ),
      );

  static void pop() => navigatorKey.currentState?.pop();
}
