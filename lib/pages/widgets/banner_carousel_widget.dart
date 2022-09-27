import 'package:flutter/material.dart';
import 'package:moviesapptv1/pages/series/serie_page.dart';

class BannerCarouselWidget extends StatelessWidget {
  const BannerCarouselWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height * 0.4;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: getBanners(width: width, height: height)
                .map(
                  (item) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        SeriePage.routeName,
                        arguments: {
                          "imgUrl": item,
                          "width": width,
                          "height": height,
                        },
                      );
                    },
                    focusColor: Colors.orangeAccent,
                    hoverColor: Colors.orangeAccent,
                    child: SizedBox(
                      width: width,
                      height: height,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.network(item),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  List<String> getBanners({required double width, required double height}) => [
        'https://thumb.mais.uol.com.br/collectionThumb/701-52.jpg?${resizeParams(width: width, height: height)}',
        'https://thumb.mais.uol.com.br/collectionThumb/699-52.jpg?${resizeParams(width: width, height: height)}',
        'https://thumb.mais.uol.com.br/collectionThumb/695-52.jpg?${resizeParams(width: width, height: height)}',
        'https://thumb.mais.uol.com.br/collectionThumb/696-52.jpg?${resizeParams(width: width, height: height)}',
      ];

  String resizeParams({required double width, required double height}) =>
      '?resize=${width.toInt()}x${height.toInt()}&align=right&valign=bottom';
}
