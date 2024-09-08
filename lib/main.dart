import 'dart:async';
import 'dart:developer';

import 'package:app_mobile_horosope/features/auth/bloc/auth_bloc.dart';
import 'package:app_mobile_horosope/features/onboarding/pages/onboarding_page.dart';
import 'package:app_mobile_horosope/firebase_options.dart';
import 'package:app_mobile_horosope/horoscope_bloc_observer.dart';
import 'package:app_mobile_horosope/navigator/main_navigator.dart';
import 'package:app_mobile_horosope/notifications/app_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      Bloc.observer = HoroscopeBlocObserver();

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      runApp(const Initialization());
    },
    (error, stackTrace) {
      log('RunZoneGuarded ERROR ===> ${error.toString()}');
      log('RunZoneGuarded StackTrace ===> ${stackTrace.toString()}');
    },
  );
}

class Initialization extends StatelessWidget {
  const Initialization({super.key});

  @override
  Widget build(BuildContext context) {
    return const _App();
  }
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(firebaseAuth: FirebaseAuth.instance),
      child: MaterialApp(
        scaffoldMessengerKey: AppNotifications.notificationsKey,
        navigatorKey: MainNavigator.navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: Colors.white,
          cupertinoOverrideTheme: const CupertinoThemeData(
            primaryColor: Color(0xFF6E56CF),
          ),
        ),
        home: const OnboardingPage(),
      ),
    );
  }
}
