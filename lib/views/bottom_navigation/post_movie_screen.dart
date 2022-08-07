import 'package:atplace/views/add_book_screen.dart';
import 'package:atplace/view_models/book_list_view_model.dart';
import 'package:atplace/models/book.dart';
import 'package:atplace/views/edit_book_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class PostMovieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookListViewModel>(
      create: (_) => BookListViewModel()..fetchBookList(),
      child: Scaffold(
          // appBar: AppBar(
          //   title: Text('ホテルを追加'),
          // ),
          // body: Center(
          //   child: Consumer<BookListViewModel>(builder: (context, model, child) {
          //     final List<Book>? books = model.books;

          //     if (books == null) {
          //       return CircularProgressIndicator();
          //     }

          //     final List<Widget> widgets = books
          //         .map(
          //           (book) => Slidable(
          //             child: ListTile(
          //               leading: book.imgURL != null
          //                   ? Image.network(book.imgURL!)
          //                   : null,
          //               title: Text(book.title),
          //               subtitle: Text(book.author),
          //             ),
          //             endActionPane: ActionPane(
          //               extentRatio: 0.2,
          //               motion: const ScrollMotion(), // (5)
          //               children: [
          //                 SlidableAction(
          //                   label: '編集',
          //                   backgroundColor: Colors.black45,
          //                   icon: Icons.edit,
          //                   onPressed: (value) async {
          //                     // 編集画面に遷移

          //                     // 画面遷移
          //                     final String? title = await Navigator.push(
          //                       context,
          //                       MaterialPageRoute(
          //                         builder: (context) => EditBookPage(book),
          //                       ),
          //                     );

          //                     if (title != null) {
          //                       final snackBar = SnackBar(
          //                         backgroundColor: Colors.green,
          //                         content: Text('$titleを編集しました'),
          //                       );
          //                       ScaffoldMessenger.of(context)
          //                           .showSnackBar(snackBar);
          //                     }

          //                     model.fetchBookList();
          //                   },
          //                 ),
          //                 SlidableAction(
          //                   label: '削除',
          //                   backgroundColor: Colors.red,
          //                   icon: Icons.delete,
          //                   onPressed: (value) async {
          //                     // 削除しますか？って聞いて、はいだったら削除
          //                     await showConfirmDialog(context, book, model);
          //                   },
          //                 ),
          //               ],
          //             ),
          //           ),
          //         )
          //         .toList();
          //     return ListView(
          //       children: widgets,
          //     );
          //   }),
          // ),
          // floatingActionButton: Consumer<BookListViewModel>(
          //   builder: (context, model, child) {
          //     return FloatingActionButton(
          //       onPressed: () async {
          //         // 画面遷移
          //         final bool? added = await Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => AddBookPage(),
          //             fullscreenDialog: true,
          //           ),
          //         );

          //         if (added != null && added) {
          //           final snackBar = SnackBar(
          //             backgroundColor: Colors.green,
          //             content: Text('本を追加しました'),
          //           );
          //           ScaffoldMessenger.of(context).showSnackBar(snackBar);
          //         }

          //         model.fetchBookList();
          //       },
          //       tooltip: 'Increment',
          //       child: Icon(Icons.add),
          //     );
          //   },
          // ),
          ),
    );
  }

  // Future showConfirmDialog(
  //   BuildContext context,
  //   Book book,
  //   BookListViewModel model,
  // // ) {
  //   return showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (_) {
  //       return AlertDialog(
  //         title: Text("削除の確認"),
  //         content: Text("『${book.title}』を削除しますか？"),
  //         actions: [
  //           TextButton(
  //             child: Text("いいえ"),
  //             onPressed: () => Navigator.pop(context),
  //           ),
  //           TextButton(
  //             child: Text("はい"),
  //             onPressed: () async {
  //               // modelで削除
  //               await model.delete(book);
  //               Navigator.pop(context);
  //               final snackBar = SnackBar(
  //                 backgroundColor: Colors.red,
  //                 content: Text('${book.title}を削除しました'),
  //               );
  //               model.fetchBookList();
  //               ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
