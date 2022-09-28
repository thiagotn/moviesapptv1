import 'package:flutter/material.dart';
import 'package:moviesapptv1/pages/player/player_mob_page.dart';
import 'package:moviesapptv1/pages/series/serie_page.dart';
import 'package:moviesapptv1/pages/widgets/flat_button_gradient_widget.dart';
import 'package:moviesapptv1/pages/widgets/title_sensorship_widget.dart';

class BannerItemWidget extends StatelessWidget {
  final String title;
  final String sinopse;
  final String type;
  final String imageUrl;

  const BannerItemWidget({
    Key? key,
    required this.title,
    required this.type,
    required this.imageUrl,
    required this.sinopse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          SeriePage.routeName,
          arguments: {
            "imgUrl": imageUrl,
          },
        );
      },
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.network(imageUrl),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.5),
                  Colors.black,
                ],
                stops: const [
                  0.55,
                  0.80,
                  1.00,
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Text(
                  title,
                  style: TextStyle(
                    shadows: <Shadow>[
                      Shadow(
                        offset: const Offset(3.0, 3.0),
                        blurRadius: 4.0,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ],
                    fontSize: 28.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          sinopse,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Color(0XFFA8A8A8),
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      TitleCensorshipWidget(
                        censorship: "16",
                        height: 18,
                        width: 18,
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        isAutoClassification: false,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 40,
                ),
                child: Row(
                  children: [
                    FlatButtonGradient(
                      width: 200,
                      text: "Detalhes",
                      gradient: const ['3333333', '4444444'],
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          SeriePage.routeName,
                          arguments: {
                            "imgUrl": imageUrl,
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    FlatButtonGradient(
                      width: 200,
                      text: "Assistir",
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          PlayerMobPage.routeName,
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ],
      ),
    );
  }
}
