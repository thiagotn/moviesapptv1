import 'package:flutter/material.dart';
import 'package:moviesapptv1/pages/movie/movie_page.dart';
import 'package:moviesapptv1/pages/player/player_mob_page.dart';
import 'package:moviesapptv1/pages/widgets/button_widget.dart';
import 'package:moviesapptv1/pages/widgets/simple_carousel_widget.dart';
import 'package:moviesapptv1/repository/mocks.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // 960x540 -
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // 1920x1080
    double realWidth = MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;
    double realHeight = MediaQuery.of(context).size.height *
        MediaQuery.of(context).devicePixelRatio;

    const double paddingLeft = 50;

    String randomImg = getRandomBanner();

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              // clipBehavior: Clip.none,
              // fit: StackFit.passthrough,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Focus(
                    child: Container(
                      foregroundDecoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black
                          ],
                          begin: Alignment.bottomRight,
                          end: Alignment.bottomLeft,
                          stops: [0, 0.2, 0.2, 0.9],
                        ),
                      ),
                      child: Image.network(randomImg),
                    ),
                  ),
                ),
                Positioned(
                  top: width * 0.2, //220,
                  left: paddingLeft,
                  child: const Text(
                    "O Vampiro de Niterói",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.white),
                  ),
                ),
                Positioned(
                  top: width * 0.2 + 50,
                  left: paddingLeft,
                  child: const Text(
                    "Um menino sobrevive a um ataque brutal e leva à caçada \na um dos maiores serial killers do Brasil",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
                Positioned(
                  top: width * 0.2 + 120,
                  left: paddingLeft,
                  child: Row(
                    children: [
                      ButtonWidget(
                        actionName: "Assistir",
                        buttonColor: Colors.orangeAccent,
                        textColor: Colors.black,
                        onTap: () => Navigator.pushNamed(
                          context,
                          PlayerMobPage.routeName,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ButtonWidget(
                        actionName: "Detalhes",
                        buttonColor: Colors.grey,
                        textColor: Colors.white,
                        onTap: () => Navigator.pushNamed(
                            context, MoviePage.routeName,
                            arguments: {
                              "imgUrl": randomImg,
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Screen: ${width.toInt()}X${height.toInt()} - Real: ${realWidth.toInt()}X${realHeight.toInt()}",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  const SimpleCarouselWidget(
                    name: "Em Alta",
                    type: CarouselType.popular,
                  ),
                  const SimpleCarouselWidget(
                    name: "Séries",
                    type: CarouselType.series,
                  ),
                  const SimpleCarouselWidget(
                    name: "Filmes",
                    type: CarouselType.movies,
                  ),
                  const SimpleCarouselWidget(
                    name: "Adicionados recentemente",
                    type: CarouselType.mylist,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
