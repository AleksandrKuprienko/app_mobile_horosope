import 'dart:async';
import 'dart:developer';

import 'package:app_mobile_horosope/features/auth/bloc/auth_bloc.dart';
import 'package:app_mobile_horosope/features/auth/login/login_page.dart';
import 'package:app_mobile_horosope/features/home/pages/home_page.dart';
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
      runApp(const _App());
    },
    (error, stackTrace) {
      log('RunZoneGuarded ERROR ===> ${error.toString()}');
      log('RunZoneGuarded StackTrace ===> ${stackTrace.toString()}');
    },
  );
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(firebaseAuth: FirebaseAuth.instance),
        ),
      ],
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
        home: const _LoadPage(),
      ),
    );
  }
}

class _LoadPage extends StatelessWidget {
  const _LoadPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (p, c) {
            if (p is AuthenticationSuccessState && c is AuthenticationSuccessState) {
              return false;
            }
            return true;
          },
          builder: (context, state) {
            return switch (state) {
              AuthenticationLoadingState _ => const CircularProgressIndicator.adaptive(),
              AuthenticationSuccessState _ => const HomePage(),
              AuthenticationFailureState _ => const LoginPage(),
            };
          },
        ),
      ),
    );
  }
}
