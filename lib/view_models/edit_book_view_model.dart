import 'package:atplace/models/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditBookViewModel extends ChangeNotifier {
  final Book book;
  EditBookViewModel(this.book) {
    titleController.text = book.title;
    authorController.text = book.author;
  }

  final titleController = TextEditingController();
  final authorController = TextEditingController();

  String? title;
  String? author;

  void setTitle(String title) {
    this.title = title;
    notifyListeners();
  }

  void setAuthor(String author) {
    this.author = author;
    notifyListeners();
  }

  bool isUpdated() {
    return title != null || author != null;
  }

  Future update() async {
    this.title = titleController.text;
    this.author = authorController.text;

    // firestoreに追加
    await FirebaseFirestore.instance.collection('books').doc(book.id).update({
      'title': title,
      'author': author,
    });
  }
}
