import 'package:flutter/material.dart';
import 'package:moviesapptv1/pages/details/details_page.dart';

class TitleWidget extends StatelessWidget {
  final String imageUrl;

  const TitleWidget({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    double width = 201;
    double height = 283;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailsPage.routeName, arguments: {
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
          width: width,
          height: height,
        ),
      ),
    );
  }
}
