import 'package:flutter/material.dart';
import 'package:moviesapptv1/pages/details/details_page.dart';
import 'package:moviesapptv1/pages/widgets/simple_carousel_widget.dart';

class MoviesPage extends StatelessWidget {
  static var routeName = "/movies";

  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    String bannerImg = getBanners().first;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, DetailsPage.routeName,
                    arguments: {"imageUrl": bannerImg});
              },
              focusColor: Colors.orangeAccent,
              hoverColor: Colors.orangeAccent,
              child: SizedBox(
                width: width,
                height: 540 / 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.network(getBanners().first),
                  ),
                ),
              ),
            ),
            // TODO: Listview.builder
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

  List<String> getBanners() {
    List<String> images = [
      'https://thumb.mais.uol.com.br/collectionThumb/701-52.jpg',
      'https://thumb.mais.uol.com.br/collectionThumb/699-52.jpg',
      'https://thumb.mais.uol.com.br/collectionThumb/695-52.jpg',
      'https://thumb.mais.uol.com.br/collectionThumb/696-52.jpg',
    ];
    images.shuffle();
    return images;
  }
}
