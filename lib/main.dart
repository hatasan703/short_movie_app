import 'package:atplace/views/add_hotel_screen.dart';
import 'package:atplace/views/book_list_screen.dart';
import 'package:atplace/views/bottom_navigation/home_screen.dart';
import 'package:atplace/views/bottom_navigation/like_screen.dart';
import 'package:atplace/views/bottom_navigation/my_screen.dart';
import 'package:atplace/views/bottom_navigation/post_movie_screen.dart';
import 'package:atplace/views/bottom_navigation/search_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
      // home: StreamBuilder<User?>(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       // スプラッシュ画面などに書き換えても良い
      //       return const SizedBox();
      //     }
      //     if (snapshot.hasData) {
      //       // User が null でなない、つまりサインイン済みのホーム画面へ
      //       return FirstPage();
      //     }
      //     // User が null である、つまり未サインインのサインイン画面へ
      //     return SignInPage();
      //   },
      // ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  var _pages = <Widget>[
    HomeScreen(),
    SearchScreen(),
    PostMovieScreen(),
    LikeScreen(),
    MyScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('BottomNavigationBar Sample'),
      // ),
      body: _pages[_selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 14.0),
        child: FloatingActionButton(
          backgroundColor: Color.fromRGBO(255, 143, 0, 1),
          onPressed: () async {
            // 画面遷移
            // final bool? added = await Navigator.push(
            // context,

            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddHotelScreen(),
                fullscreenDialog: true,
              ),
            );
            // );

            // if (added != null && added) {
            //   final snackBar = SnackBar(
            //     backgroundColor: Colors.green,
            //     content: Text('本を追加しました'),
            //   );
            //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
            // }

            // model.fetchBookList();
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          elevation: 0.0,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, //属性追加
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.amber[800],
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        iconSize: 30,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}

// class SignInPage extends StatefulWidget {
//   @override
//   State<SignInPage> createState() => _SignInPageState();
// }

// class _SignInPageState extends State<SignInPage> {
//   @override
//   Widget build(BuildContext context) => const Scaffold(
//         body: Login();
//       );
// }

// class FirstPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => const Scaffold(
//         body: Center(
//           child: Text('サインイン済み時に表示する画面です。'),
//         ),
//       );
// }
