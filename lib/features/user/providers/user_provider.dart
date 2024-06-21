import 'dart:async';

import 'package:app_mobile_horosope/features/home/pages/home_page.dart';
import 'package:app_mobile_horosope/features/user/pages/registration_page.dart';
import 'package:app_mobile_horosope/navigator/main_navigator.dart';
import 'package:app_mobile_horosope/notifications/app_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserProvider();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  StreamSubscription<User?>? userAuthStream;

  void init() {
    userAuthStream = _firebaseAuth.authStateChanges().listen((event) {
      if (event == null) {
        MainNavigator.navigatorKey.currentState
            ?.pushReplacement(MaterialPageRoute(builder: (_) => const RegistrationPage()));
      } else {
        MainNavigator.navigatorKey.currentState?.pushReplacement(MaterialPageRoute(builder: (_) => const HomePage()));
      }
    });
  }

  void logOut() {
    _firebaseAuth.signOut();
    notifyListeners();
  }

  Future createUserWithEmailAndPassword({required String email, required String password}) async {
    try {
      UserCredential authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      AppNotifications.successSnackBar();
      return authResult.user != null;
    } catch (e) {
      return e;
    }
    // try {
    //   return await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    // } catch (e) {
    //   AppNotifications.successSnackBar();
    //   rethrow;
    // }
  }
}
