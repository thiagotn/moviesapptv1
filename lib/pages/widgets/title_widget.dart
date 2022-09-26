import 'package:flutter/material.dart';
import 'package:moviesapptv1/pages/details/details_page.dart';
import 'package:moviesapptv1/utils/proportional_dimensions.dart';

class TitleWidget extends StatelessWidget {
  final String imageUrl;

  const TitleWidget({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    double width = ProportionalDimensions.getWidth(context);
    double height = ProportionalDimensions.getHeight(context);

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
        padding:
            const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
        child: Image.network(
          imageUrl,
          width: width,
          height: height,
        ),
      ),
    );
  }
}
