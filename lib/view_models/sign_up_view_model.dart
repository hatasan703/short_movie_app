import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpViewModel extends ChangeNotifier {
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

  Future signUp() async {
    this.email = emailController.text;
    this.password = passwordContoller.text;

    if (email != null && password != null) {
      // firebase authでユーザー作成
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);
      final user = userCredential.user;
      if (user != null) {
        final uid = user.uid;
        // firestoreに追加
        final doc = FirebaseFirestore.instance.collection('users').doc(uid);
        await doc.set({
          'uid': uid,
          'email': email,
        });
      }
      // firestoreに追加
    }
  }
}
