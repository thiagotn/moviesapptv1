import 'package:flutter/material.dart';
import 'package:moviesapptv1/pages/player/player_mob_page.dart';

class DetailsPage extends StatelessWidget {
  static var routeName = "/details";
  final String? imageUrl;

  const DetailsPage({
    Key? key,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: width,
                height: 540 / 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.network(imgUrl.replaceAll('50.jpg', '52.jpg')),
                  ),
                ),
              ),
              InkWell(
                autofocus: true,
                focusColor: Colors.orangeAccent,
                highlightColor: Colors.orangeAccent,
                hoverColor: Colors.orangeAccent,
                onTap: () {
                  Navigator.pushNamed(context, PlayerMobPage.routeName);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.orangeAccent,
                    width: 180,
                    height: 60,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        Text(
                          "Assistir",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
