// import 'package:flutter/material.dart';
// import 'first_page.dart';

// // void main() => runApp(TweetPage());

// class TweetPage extends StatelessWidget {
//   TweetPage(this.name);
//   String name;

//   // const TweetPage({
//   //   Key? key,
//   // }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ツイート画面'),
//         backgroundColor: Colors.red,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start, // 上揃えにする
//             children: [
//               CircleAvatar(
//                 backgroundImage: NetworkImage(
//                     'https://pbs.twimg.com/profile_images/1392164764202143750/0pwNMqq6_400x400.jpg'),
//               ),
//               SizedBox(width: 8), // 少し隙間を開ける
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Text('こんぶ @ Flutter大学'),
//                       SizedBox(width: 8),
//                       Text('2022/05/05'),
//                     ],
//                   ),
//                   SizedBox(height: 4),
//                   Text(name),
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(Icons.favorite_border),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
