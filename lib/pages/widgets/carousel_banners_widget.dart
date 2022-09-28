import 'package:flutter/material.dart';
import 'package:moviesapptv1/pages/widgets/banner_item_widget.dart';

class CarouselBannerWidget extends StatelessWidget {
  const CarouselBannerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = 500; //MediaQuery.of(context).size.height * 0.3;
    final controller = PageController(viewportFraction: 1);

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            padding: const EdgeInsets.all(0),
            height: height,
            width: width,
            child: PageView.builder(
              controller: controller,
              physics: const BouncingScrollPhysics(),
              itemCount: getBanners().length,
              itemBuilder: (ctx, i) {
                BannerItemWidget carouselBannerItemWidget = BannerItemWidget(
                    title: "Lorem ipsum dolor sit amet, consetetur sadipscing",
                    type: "serie",
                    imageUrl: getBanners()[i],
                    sinopse:
                        "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed dia.");
                return carouselBannerItemWidget;
              },
            ),
          ),
          Container(
            height: 10,
          ),
        ],
      ),
    );
  }

  List<String> getBanners() => [
        'https://thumb.mais.uol.com.br/collectionThumb/701-52.jpg',
        'https://thumb.mais.uol.com.br/collectionThumb/699-52.jpg',
        'https://thumb.mais.uol.com.br/collectionThumb/695-52.jpg',
        'https://thumb.mais.uol.com.br/collectionThumb/696-52.jpg',
      ];
}
