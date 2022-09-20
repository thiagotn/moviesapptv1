import 'package:flutter/material.dart';
import 'package:moviesapptv1/pages/player/player_page.dart';
import 'package:moviesapptv1/pages/widgets/title_widget.dart';

class DetailsPage extends StatelessWidget {
  static var routeName = "/details";
  final String? imageUrl;

  const DetailsPage({
    Key? key,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imgUrl =
        "https://www.themoviedb.org/t/p/w300_and_h450_bestv2_filter(blur)/z9a3b7DePtdo2E8NzyPwoGHGsYk.jpg";
    var argumentsObj = ModalRoute.of(context)?.settings.arguments;
    if (argumentsObj != null) {
      Map? arguments = argumentsObj as Map;
      imgUrl = arguments["imageUrl"]!;
    }

    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop(true);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Details"),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TitleWidget(imageUrl: imgUrl),
                InkWell(
                  autofocus: true,
                  focusColor: Colors.red,
                  highlightColor: Colors.white,
                  hoverColor: Colors.orange,
                  onTap: () {
                    Navigator.pushNamed(context, PlayerPage.routeName);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      Text(
                        "Assistir",
                        style: Theme.of(context).textTheme.button,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
