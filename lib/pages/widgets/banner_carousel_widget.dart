import 'package:flutter/material.dart';
import 'package:moviesapptv1/pages/details/details_page.dart';

class BannerCarouselWidget extends StatelessWidget {
  const BannerCarouselWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;
    double height = MediaQuery.of(context).size.height * 0.4;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: getBanners()
                .map(
                  (item) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        DetailsPage.routeName,
                        arguments: {
                          "imgUrl": item,
                          "width": width,
                          "height": height,
                        },
                      );
                    },
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusColor: Colors.orangeAccent,
                    hoverColor: Colors.orangeAccent,
                    child: SizedBox(
                      width: width,
                      height: height,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.network(item),
                          ),
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

  List<String> getBanners() => [
        'https://thumb.mais.uol.com.br/collectionThumb/701-52.jpg',
        'https://thumb.mais.uol.com.br/collectionThumb/699-52.jpg',
        'https://thumb.mais.uol.com.br/collectionThumb/695-52.jpg',
        'https://thumb.mais.uol.com.br/collectionThumb/696-52.jpg',
      ];
}
