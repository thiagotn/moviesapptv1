import 'package:flutter/material.dart';
import 'package:moviesapptv1/pages/movie/movie_page.dart';
import 'package:moviesapptv1/utils/proportional_dimensions.dart';

class TitleWidget extends StatelessWidget {
  final String imageUrl;

  const TitleWidget({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    // double width = 201;
    // double height = 283;

    double width = ProportionalDimensions.getWidth(context);
    double height = ProportionalDimensions.getHeight(context);

    print("$width X $height");

    return InkWell(
      onTap: () {
        print("test...");
        Navigator.pushNamed(context, MoviePage.routeName, arguments: {
          "imgUrl": imageUrl,
        });
      },
      focusColor: Colors.orange,
      highlightColor: Colors.white,
      hoverColor: Colors.orange,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(
          imageUrl,
          width: ProportionalDimensions.getWidth(context),
          height: ProportionalDimensions.getHeight(context),
        ),
      ),
    );
  }
}
