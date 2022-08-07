import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordContoller = TextEditingController();

  String? email;
  String? password;
  bool isLoading = false;

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    this.password = password;
    notifyListeners();
  }

  Future login() async {
    this.email = emailController.text;
    this.password = passwordContoller.text;

    // ログイン処理
    if (email != null && password != null) {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);

      final currentUser = FirebaseAuth.instance.currentUser;
      final uid = currentUser!.uid;
    }
  }
}
