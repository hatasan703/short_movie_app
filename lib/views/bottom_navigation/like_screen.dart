import 'package:flutter/material.dart';

class LikeScreen extends StatelessWidget {
  const LikeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('お気に入り'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(
              context,
              // MaterialPageRoute(builder: (context) => FirstPage()),
            );
          },
          child: const Text('未実装'),
        ),
      ),
    );
  }
}
