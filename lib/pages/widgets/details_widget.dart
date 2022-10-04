import 'package:flutter/material.dart';
import 'package:moviesapptv1/pages/widgets/namevalue_widget.dart';

class DetailsWidget extends StatelessWidget {
  final String title;
  final String description;
  final String genre;
  final int year;
  final String rating;

  const DetailsWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.genre,
    required this.year,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        NameValueWidget(name: 'Sinopse', value: description),
        NameValueWidget(name: 'Gênero', value: genre),
        NameValueWidget(name: 'Ano', value: "$year"),
        NameValueWidget(name: 'Classificação etária', value: rating),
      ],
    );
  }
}
