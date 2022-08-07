import 'package:atplace/models/user.dart';
import 'package:atplace/models/hotel.dart';

class Video {
  final String id;
  final String videoUrl;
  final User user;
  final Hotel hotel;
  // final Hotel hotelPrice;
  // final Hotel hotelDescription;
  final String likes;
  final String shares;

  Video(this.id, this.videoUrl, this.user, this.hotel, this.likes, this.shares);
}
