import 'package:flutter/material.dart';
import 'package:moviesapptv1/pages/widgets/banner_carousel_widget.dart';
import 'package:moviesapptv1/pages/widgets/simple_carousel_widget.dart';

class MoviesPage extends StatelessWidget {
  static const routeName = "/movies";

  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 960x540
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BannerCarouselWidget(),
            Align(
              alignment: Alignment.topRight,
              child: Text("screen: $width X $height"),
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
              name: "Em alta",
              type: CarouselType.popular,
            ),
            const SimpleCarouselWidget(
              name: "Adicionados recentemente",
              type: CarouselType.mylist,
            ),
          ],
        ),
      ),
    );
  }
}
