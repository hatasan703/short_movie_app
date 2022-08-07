import 'package:atplace/models/video.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoTile extends StatefulWidget {
  const VideoTile(
      {Key? key,
      required this.video,
      required this.snappedPageIndex,
      required this.currentIndex})
      : super(key: key);
  final Video video;
  final int snappedPageIndex;
  final int currentIndex;

  @override
  State<VideoTile> createState() => _VideoTileState();
}

class _VideoTileState extends State<VideoTile> {
  late VideoPlayerController _videoController;
  late Future _initializeVideoPlayer;
  bool _isVideoPlaying = true;

  @override
  void initState() {
    _videoController =
        VideoPlayerController.asset('assets/${widget.video.videoUrl}');
    _initializeVideoPlayer = _videoController.initialize();
    _videoController.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  void _pausePlayVideo() {
    _isVideoPlaying ? _videoController.pause() : _videoController.play();
    setState(() {
      _isVideoPlaying = !_isVideoPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    (widget.snappedPageIndex == widget.currentIndex && _isVideoPlaying)
        ? _videoController.play()
        : _videoController.pause();
    return Container(
      color: Colors.black,
      child: FutureBuilder(
        future: _initializeVideoPlayer,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return GestureDetector(
              onTap: () => {_pausePlayVideo()},
              child: Stack(
                alignment: Alignment.center,
                children: [
                  VideoPlayer(_videoController),
                  IconButton(
                    onPressed: () => {_pausePlayVideo},
                    icon: Icon(Icons.play_arrow,
                        color:
                            Colors.white.withOpacity(_isVideoPlaying ? 0 : 0.5),
                        size: 60),
                  )
                ],
              ),
            );
          } else {
            return Container(color: Colors.black);
          }
        },
      ),
    );
  }
}
