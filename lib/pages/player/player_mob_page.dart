import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class PlayerMobPage extends StatelessWidget {
  static var routeName = "/playermob";
  const PlayerMobPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AspectRatio(
        aspectRatio: 16 / 9,
        child: BetterPlayer.network(
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
          betterPlayerConfiguration: const BetterPlayerConfiguration(
            aspectRatio: 16 / 9,
            autoPlay: true,
          ),
        ),
      ),
    );
  }
}