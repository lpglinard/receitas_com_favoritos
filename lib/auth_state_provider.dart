import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthState with ChangeNotifier {
  User? _user;
  User? get user => _user;

  bool get isAuthenticated => _user != null;

  AuthState() {
    _user = FirebaseAuth.instance.currentUser;
    FirebaseAuth.instance.userChanges().listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }
}