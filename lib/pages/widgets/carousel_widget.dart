import 'package:flutter/material.dart';
import 'package:moviesapptv1/pages/widgets/title_widget.dart';

class CarouselWidget extends StatelessWidget {
  final List<String> items;

  const CarouselWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items
            .map(
              (item) => TitleWidget(imageUrl: item),
            )
            .toList(),
      ),
    );
  }
}
