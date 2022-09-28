import 'package:flutter/material.dart';
import 'package:moviesapptv1/pages/widgets/carousel_name_widget.dart';
import 'package:moviesapptv1/pages/widgets/carousel_widget.dart';
import 'package:moviesapptv1/repository/mocks.dart';

class SimpleCarouselWidget extends StatelessWidget {
  final String? name;
  final CarouselType type;
  const SimpleCarouselWidget({
    Key? key,
    this.name,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselName(
          name: name,
        ),
        CarouselWidget(
          items: getImages(type),
        ),
      ],
    );
  }
}
