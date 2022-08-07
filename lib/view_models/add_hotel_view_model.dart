import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:video_compress/video_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class AddHotelViewModel extends ChangeNotifier {
  String? hotelName;
  File? movieFile;
  bool isLoading = false;
  // File? imageFile;
  VideoPlayerController? videoController;

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future addHotel() async {
    if (hotelName == null || hotelName == "") {
      throw 'ホテル名が入力されていません';
    }

    final doc = FirebaseFirestore.instance.collection('hotels').doc();

    String? movieURL;
    if (movieFile != null) {
      // storageにアップロード
      final task = await FirebaseStorage.instance
          .ref('hotels/${doc.id}')
          .putFile(movieFile!);
      movieURL = await task.ref.getDownloadURL();
    }

    if (movieFile != null) {
      final task = await FirebaseStorage.instance
          .ref('hotels/($doc.id)')
          .putFile(movieFile!);

      movieURL = await task.ref.getDownloadURL();
    }

    // firestoreに追加
    await doc.set({
      'hotelName': hotelName,
      'movieURL': movieURL,
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
    // 動画を選択
    final XFile? pickedFile = await ImagePicker().pickVideo(source: source);
    if (pickedFile != null) {
      movieFile = File(pickedFile.path);

      // 動画を圧縮
      try {
        // showDialog(context: context, barrierDismissible: false, builder: (context) => Dialog(child: progessDialogWidget()));
        MediaInfo? mediaInfo = await VideoCompress.compressVideo(
          movieFile!.path,
          quality: VideoQuality.MediumQuality,
          deleteOrigin: false, // It's false by default
          includeAudio: true,
        );
        String? path = mediaInfo!.path;
        movieFile = File(path!);
      } catch (e) {
        VideoCompress.cancelCompression();
      }

      // 動画パスからサムネイル画像を生成
      final thumbnailFile =
          await VideoCompress.getFileThumbnail(movieFile!.path);

      // File型に変換
      // imageFile = File(thumbnailFile.path);

      // プレビュー再生する動画を用意
      videoController = VideoPlayerController.file(movieFile!);
      videoController?.initialize().then((_) {
        videoController?.setLooping(true);
      });

      notifyListeners();
    }
  }
}
