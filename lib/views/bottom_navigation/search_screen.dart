import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('検索'),
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
