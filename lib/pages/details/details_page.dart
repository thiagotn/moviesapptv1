import 'package:flutter/material.dart';
import 'package:moviesapptv1/pages/player/player_page.dart';

class DetailsPage extends StatelessWidget {
  static var routeName = "/details";
  final String? imageUrl;

  const DetailsPage({
    Key? key,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    String imgUrl = (arguments["imageUrl"] == null)
        ? "https://www.themoviedb.org/t/p/w300_and_h450_bestv2_filter(blur)/z9a3b7DePtdo2E8NzyPwoGHGsYk.jpg"
        : arguments["imageUrl"]!;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(imgUrl),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, PlayerPage.routeName);
                },
                child: const Text("Assistir"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
