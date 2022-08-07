// import 'package:flutter/material.dart';
// import 'first_page.dart';

// void main() => runApp(SecondPage());

// class SecondPage extends StatelessWidget {
//   const SecondPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('次へ'),
//         backgroundColor: Colors.red,
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pop(
//               context,
//               MaterialPageRoute(builder: (context) => FirstPage()),
//             );
//           },
//           child: const Text('戻る'),
//         ),
//       ),
//     );
//   }
// }