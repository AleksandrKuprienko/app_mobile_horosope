import 'package:app_mobile_horosope/features/home/pages/home_page.dart';
import 'package:app_mobile_horosope/features/onboarding/pages/onboarding_page.dart';
import 'package:app_mobile_horosope/features/registration/presentation/pages/registration_page.dart';
import 'package:app_mobile_horosope/features/user/pages/login_page.dart';
import 'package:flutter/material.dart';

class MainNavigator {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static registration() {
    navigatorKey.currentState?.pushReplacement(MaterialPageRoute(builder: (context) => const RegistrationPage()));
  }

  static login() {
    navigatorKey.currentState?.pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  static home() {
    navigatorKey.currentState?.pushReplacement(PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 600),
      pageBuilder: (context, animation, secondaryAnimation) => const HomePage(),
      // barrierColor: const Color(0xFF6E56CF),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 0.9);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          // opacity: animation,
          child: child,
        );
      },
    ));
  }

  static onboarding() {
    navigatorKey.currentState?.pushReplacement(MaterialPageRoute(builder: (context) => const OnboardingPage()));
  }
}
