import 'package:app_mobile_horosope/features/auth/login/login_page.dart';
import 'package:app_mobile_horosope/features/auth/registration/registration_page.dart';
import 'package:app_mobile_horosope/features/home/pages/home_page.dart';
import 'package:app_mobile_horosope/features/profile/pages/profile_page.dart';
import 'package:flutter/material.dart';

class MainNavigator {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static registration() =>
      navigatorKey.currentState?.push(MaterialPageRoute(builder: (context) => const RegistrationPage()));

  static login() => navigatorKey.currentState?.push(MaterialPageRoute(builder: (context) => const LoginPage()));

  static home() => navigatorKey.currentState?.push(MaterialPageRoute(builder: (context) => const HomePage()));

  static profilePage() => navigatorKey.currentState?.push(MaterialPageRoute(builder: (context) => const ProfilePage()));
}
