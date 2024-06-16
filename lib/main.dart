import 'package:app_mobile_horosope/features/onboarding/pages/onboarding_page.dart';
import 'package:app_mobile_horosope/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
        cupertinoOverrideTheme: const CupertinoThemeData(
          primaryColor: Color(0xFF6E56CF),
        ),
      ),
      home: const OnboardingPage(),
    );
  }
}
