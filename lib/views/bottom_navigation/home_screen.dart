import 'package:atplace/views/hotel_movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// StatelessWidget の代わりに Riverpod の ConsumerWidget を継承します。
class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: HotelMovieScreen(),
    );
  }
}
