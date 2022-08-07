import 'package:atplace/models/user.dart';
import 'package:atplace/models/video.dart';
import 'package:atplace/models/hotel.dart';

User currentUser = User('stackedlist',
    'https://pbs.twimg.com/profile_images/1392164764202143750/0pwNMqq6_400x400.jpg');

User demoUser1 = User('user_1',
    'https://pbs.twimg.com/profile_images/1392164764202143750/0pwNMqq6_400x400.jpg');
User demoUser2 = User('user_2',
    'https://pbs.twimg.com/profile_images/1392164764202143750/0pwNMqq6_400x400.jpg');
User demoUser3 = User('user_3',
    'https://pbs.twimg.com/profile_images/1392164764202143750/0pwNMqq6_400x400.jpg');
User demoUser4 = User('user_4',
    'https://pbs.twimg.com/profile_images/1392164764202143750/0pwNMqq6_400x400.jpg');

Hotel hotel1 = Hotel('1', '星野リゾート宮古島', 16000, '沖縄 宮古島');
Hotel hotel2 = Hotel('2', '星野リゾート大塚', 11000, '東京 大塚');
Hotel hotel3 = Hotel('3', '星野リゾート博多', 14000, '福岡 博多');
Hotel hotel4 = Hotel('4', '星野リゾート石垣島', 21000, '沖縄 石垣島');

final List<Video> videos = [
  Video('', 'v1.mp4', demoUser1, hotel1, '12.5k', '123'),
  Video('', 'v2.mp4', demoUser2, hotel2, '12.5k', '123'),
  Video('', 'v3.mp4', demoUser3, hotel3, '12.5k', '123'),
  Video('', 'v4.mp4', demoUser4, hotel3, '12.5k', '123'),
];
