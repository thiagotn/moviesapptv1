import 'package:flutter/material.dart';
import 'package:moviesapptv1/pages/widgets/banner_item_widget.dart';
import 'package:moviesapptv1/repository/mocks.dart';

class CarouselBannerWidget extends StatelessWidget {
  const CarouselBannerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;
    double height = MediaQuery.of(context).size.height *
        MediaQuery.of(context).devicePixelRatio *
        0.3;
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
                    title: "O Vampiro de Niterói",
                    type: "serie",
                    imageUrl: getBanners()[i],
                    sinopse:
                        "Suspense, Documentários, Suspense e terror, 1 temporada");
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
}
