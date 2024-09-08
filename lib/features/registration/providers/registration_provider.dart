import 'dart:async';

import 'package:app_mobile_horosope/notifications/app_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationProvider with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  StreamSubscription<User?>? userAuthStream;

  String emailError = '';
  String passwordError = '';

  bool _validateEmail(String? value) {
    const String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  bool _isPasswordValid(String? value) {
    if (value != null && value.isNotEmpty && !value.contains(' ') && value.length > 6) {
      return true;
    } else {
      return false;
    }
  }

  bool isFormValid({required String email, required String password}) {
    if (_validateEmail(email) && _isPasswordValid(password)) {
      return true;
    }
    AppNotifications.errorSnackBar('Please enter valid password and email');
    return false;
  }

  Future<UserCredential> createUserWithEmailAndPassword({required String email, required String password}) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      AppNotifications.errorSnackBar(e.message ?? 'Oops stars crashes');
      rethrow;
    } catch (e) {
      AppNotifications.errorSnackBar('Oops stars crashes...We fix it');
      rethrow;
    }
  }
}
