import 'package:flutter/material.dart';
import 'package:moviesapptv1/pages/widgets/carousel_banners_widget.dart';
import 'package:moviesapptv1/pages/widgets/simple_carousel_widget.dart';
import 'package:moviesapptv1/repository/mocks.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/home";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 960x540
    double width = MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;
    double height = MediaQuery.of(context).size.height *
        MediaQuery.of(context).devicePixelRatio;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CarouselBannerWidget(),
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
