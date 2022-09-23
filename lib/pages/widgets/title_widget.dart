import 'package:flutter/material.dart';
import 'package:moviesapptv1/pages/details/details_page.dart';

class TitleWidget extends StatelessWidget {
  final double width;
  final double height;
  final String imageUrl;

  const TitleWidget({
    super.key,
    required this.imageUrl,
    // this.width = 201,
    // this.height = 291,
    this.width = 150,
    this.height = 225,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailsPage.routeName,
            arguments: {"imageUrl": imageUrl});
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
