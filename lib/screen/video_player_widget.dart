import 'package:drive_deneme/extensions/birinci.dart'
    hide NumberParsing2, NumberParsing3;
import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key, required this.uri});
  final String uri;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late Future<void> _initializeVideoPlayerFuture;
  late PodPlayerController _podPlayerController;
  yeniMethod() {
    String bir = '';
    bir.parseInt();
  }

  @override
  void initState() {
    //_videoPlayerController = VideoPlayerController.networkUrl(widget.uri);
    _podPlayerController = PodPlayerController(
      playVideoFrom: PlayVideoFrom.youtube(widget.uri),
    );
    _initializeVideoPlayerFuture = _podPlayerController.initialise();
    super.initState();
  }

  @override
  void dispose() {
    _podPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: _podPlayerController.videoPlayerValue!.aspectRatio,
            child: PodVideoPlayer(controller: _podPlayerController),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        }
      },
    );
  }
}
