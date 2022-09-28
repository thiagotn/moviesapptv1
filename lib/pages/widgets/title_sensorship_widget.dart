// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TitleCensorshipWidget extends StatelessWidget {
  late String? censorship;
  final bool onlyTag;
  EdgeInsets? padding;
  EdgeInsets? margin;
  final double width;
  final double height;
  final bool hasBorder;
  final bool isAutoClassification;

  TitleCensorshipWidget(
      {Key? key,
      this.censorship,
      this.padding,
      this.margin,
      this.height = 25,
      this.width = 25,
      this.hasBorder = true,
      this.onlyTag = false,
      required this.isAutoClassification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: padding ??
          const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
      child: _buildRating(context, censorship, onlyTag),
    );
  }

  Widget _buildRating(BuildContext context, String? censorship, bool onlyTag) {
    // Se não vier nenhum valor, não exibe o box
    if (censorship == null) {
      return Container();
    }

    int parseRating = 0;
    if (isNumeric(censorship)) {
      parseRating = int.parse(censorship);
    }

    Color ratingColor = const Color(0xFF0A7C30);
    String stringAge = censorship;
    String contentText =
        'Contém cenas inadequadas para menores de $parseRating anos.';

    if (parseRating >= 18) {
      ratingColor = const Color(0xFF202020);
    } else if (parseRating <= 17 && parseRating > 14) {
      ratingColor = const Color(0xFFEC1A23);
    } else if (parseRating <= 14 && parseRating > 12) {
      ratingColor = const Color(0xFFFF652C);
    } else if (parseRating <= 12 && parseRating > 10) {
      ratingColor = const Color(0xFFFFBC2C);
    } else if (parseRating > 0 && parseRating <= 10) {
      ratingColor = const Color(0xFF0E55A4);
    }

    if (parseRating == 0) {
      censorship = 'L';
      contentText = 'Livre para todos os públicos.';
      stringAge = censorship;
    }

    if (isAutoClassification) {
      stringAge = 'A$censorship';
    }
    if (onlyTag) {
      return Row(
        children: <Widget>[
          Container(
            width: isAutoClassification ? width + 12 : width,
            height: height,
            margin: margin ?? const EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: ratingColor,
              border: Border.all(
                width: hasBorder ? 1 : 0,
                color: hasBorder ? Colors.white : Colors.transparent,
              ),
            ),
            child: Text(
              stringAge,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              contentText,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        ],
      );
    } else {
      return Container(
        width: isAutoClassification ? width + 12 : width,
        height: height,
        margin: margin ?? const EdgeInsets.only(right: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: ratingColor,
          border: Border.all(
            width: hasBorder ? 1 : 0,
            color: hasBorder ? Colors.white : Colors.transparent,
          ),
        ),
        child: Text(
          stringAge,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
  }

  bool isNumeric(String string) {
    if (string.isEmpty) {
      return false;
    }
    final number = num.tryParse(string);
    if (number == null) {
      return false;
    }
    return true;
  }
}
