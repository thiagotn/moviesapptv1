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
    double width = 150;
    double height = 225;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailsPage.routeName, arguments: {
          "imgUrl": imageUrl,
        });
      },
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      focusColor: Colors.orange,
      highlightColor: Colors.white,
      hoverColor: Colors.orange,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            imageUrl,
            width: width,
            height: height,
          ),
        ),
      ),
    );
  }
}
