import 'package:atplace/models/user.dart';
import 'package:atplace/models/video.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:atplace/models/hotel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hotelProvider = ChangeNotifierProvider(
  (ref) => HotelMovieViewModel(),
);

class HotelMovieViewModel extends ChangeNotifier {
  final stateProvider = StateProvider((ref) => 0);
  int snappedPageIndex = 0;
  List<Video>? videos;

  void fetchBookList() async {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('videos').get();

    final List<Video> videos = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String videoUrl = data['videoUrl'];
      final User postedBy = data['username'];
      final Hotel of = data['hotelName'];
      final String likes = data['likes'];
      final String shares = data['shares'];
      return Video(id, videoUrl, postedBy, of, likes, shares);
    }).toList();

    this.videos = videos;
    notifyListeners();
  }
}
// ビューで取得
// final List<Hotel>? hotels = _provider.hotels;