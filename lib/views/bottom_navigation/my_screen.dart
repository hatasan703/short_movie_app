import 'package:atplace/views/login_screen.dart';
import 'package:atplace/views/sign_up_screen.dart';
import 'package:flutter/material.dart';

class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ユーザーページ"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text(
                "ログイン",
                style: TextStyle(fontSize: 16),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                primary: Colors.white,
              ),
              onPressed: () {
                // （1） 指定した画面に遷移する
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        // （2） 実際に表示するページ(ウィジェット)を指定する
                        builder: (context) => LoginScreen()));
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              child: Text(
                "新規登録",
                style: TextStyle(fontSize: 16),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                primary: Colors.white,
              ),
              onPressed: () {
                // （1） 指定した画面に遷移する
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        // （2） 実際に表示するページ(ウィジェット)を指定する
                        builder: (context) => SignUpScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
