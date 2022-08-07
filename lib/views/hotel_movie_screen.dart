import 'package:atplace/components/home_side_bar.dart';
import 'package:atplace/components/video_detail.dart';
import 'package:atplace/components/video_tile.dart';
import 'package:atplace/view_models/hotel_movie_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:atplace/models/mock.dart';

class HotelMovieScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _provider = ref.watch(hotelProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: PageView.builder(
        onPageChanged: (int page) => {
          // 状態の更新
          ref
              .watch(_provider.stateProvider.state)
              .update((state) => _provider.snappedPageIndex = page)
        },
        scrollDirection: Axis.vertical,
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return Stack(alignment: Alignment.bottomCenter, children: [
            Center(child: Text('First Page')),
            VideoTile(
              video: videos[index],
              currentIndex: index,
              snappedPageIndex: _provider.snappedPageIndex,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // 詳細テキスト
                Expanded(
                  flex: 3,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 4,
                    child: VideoDetail(
                      video: videos[index],
                    ),
                  ),
                ),
                // サイドバー
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.75,
                    child: HomeSideBar(
                      video: videos[index],
                    ),
                  ),
                ),
              ],
            )
          ]);
        },
      ),
    );
  }
}
