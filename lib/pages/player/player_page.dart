import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/services.dart';
import 'package:moviesapptv1/pages/player/widgets/landscape_player_controls.dart';
import 'package:moviesapptv1/utils/mock_data.dart';
// ignore: depend_on_referenced_packages
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class PlayerPage extends StatefulWidget {
  static var routeName = "/player";
  const PlayerPage({Key? key}) : super(key: key);

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController:
            VideoPlayerController.network(mockData["items"][2]["trailer_url"]));
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlickVideoPlayer(
        flickManager: flickManager,
        preferredDeviceOrientation: const [
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft
        ],
        systemUIOverlay: const [],
        flickVideoWithControls: const FlickVideoWithControls(
          controls: LandscapePlayerControls(),
        ),
      ),
    );
  }
}
