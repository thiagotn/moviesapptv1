import 'package:flutter/material.dart';
import 'package:moviesapptv1/pages/widgets/simple_carousel_widget.dart';

class MoviesPage extends StatelessWidget {
  static var routeName = "/movies";

  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies APP"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SimpleCarouselWidget(),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SimpleCarouselWidget(),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SimpleCarouselWidget(),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SimpleCarouselWidget(),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SimpleCarouselWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
