import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class AddBookViewModel extends ChangeNotifier {
  String? title;
  String? author;
  File? imageFile;
  bool isLoading = false;

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future addBook() async {
    if (title == null || title == "") {
      throw 'タイトルが入力されていません';
    }

    if (author == null || author!.isEmpty) {
      throw '著者が入力されていません';
    }

    final doc = FirebaseFirestore.instance.collection('books').doc();

    String? imgURL;
    if (imageFile != null) {
      // storageにアップロード
      final task = await FirebaseStorage.instance
          .ref('books/${doc.id}')
          .putFile(imageFile!);
      imgURL = await task.ref.getDownloadURL();
    }

    if (imageFile != null) {
      final task = await FirebaseStorage.instance
          .ref('book/($doc.id)')
          .putFile(imageFile!);

      imgURL = await task.ref.getDownloadURL();
    }

    // firestoreに追加
    await doc.set({
      'title': title,
      'author': author,
      'imgURL': imgURL,
    });
  }

  Future getImage(ImageSource source) async {
    // カメラロールの権限の状態を取得.
    var photoStatus = await Permission.photos.status;
    // 一度もリクエストしてないので権限のリクエスト.
    if (photoStatus != PermissionStatus.granted) {
      photoStatus = await Permission.photos.request();
    }
    // 権限がない場合の処理.
    if (photoStatus.isGranted ||
        photoStatus.isDenied ||
        photoStatus.isRestricted ||
        photoStatus.isPermanentlyDenied) {
      // 端末の設定画面へ遷移.
      await openAppSettings();
      return;
    }
    // 写真を選択
    final XFile? pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }
    notifyListeners();
  }
}
