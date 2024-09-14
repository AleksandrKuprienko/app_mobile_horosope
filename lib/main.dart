import 'dart:async';
import 'dart:developer';

import 'package:app_mobile_horosope/features/auth/bloc/auth_bloc.dart';
import 'package:app_mobile_horosope/features/profile/bloc/profile_bloc.dart';
import 'package:app_mobile_horosope/firebase_options.dart';
import 'package:app_mobile_horosope/horoscope_bloc_observer.dart';
import 'package:app_mobile_horosope/navigator/main_navigator.dart';
import 'package:app_mobile_horosope/notifications/app_notifications.dart';
import 'package:app_mobile_horosope/theme/app_pallete.dart';
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
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      runApp(_App(
        firebaseAuth: firebaseAuth,
      ));
    },
    (error, stackTrace) {
      log('RunZoneGuarded ERROR ===> ${error.toString()}');
      log('RunZoneGuarded StackTrace ===> ${stackTrace.toString()}');
    },
  );
}

class _App extends StatelessWidget {
  const _App({
    required this.firebaseAuth,
  });
  final FirebaseAuth firebaseAuth;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
            create: (BuildContext context) => AuthBloc(firebaseAuth: firebaseAuth)..add(const AuthListenerEvent())),
        BlocProvider(create: (BuildContext context) => ProfileBloc(firebaseAuth: firebaseAuth))
      ],
      child: MaterialApp(
          scaffoldMessengerKey: AppNotifications.notificationsKey,
          navigatorKey: MainNavigator.navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            fontFamily: 'Poppins',
            scaffoldBackgroundColor: AppPallete.white,
            cupertinoOverrideTheme: const CupertinoThemeData(
              primaryColor: AppPallete.purple500,
            ),
          ),
          home: const _LoadPage()),
    );
  }
}

class _LoadPage extends StatelessWidget {
  const _LoadPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.purple500,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state is AuthenticationSuccessState ? MainNavigator.home() : MainNavigator.login();
        },
        child: const SizedBox(),
      ),
    );
  }
}
