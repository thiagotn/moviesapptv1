import 'package:flutter/material.dart';

class FlatButtonGradient extends StatelessWidget {
  final String text;
  final List<String>? gradient;
  final Color? color;
  final Color? textColor;
  final Color? activeIconColor;
  final IconData? icon;
  final VoidCallback? onPressed;
  final double? width;
  final double? fontSize;

  const FlatButtonGradient({
    Key? key,
    required this.text,
    this.icon,
    this.onPressed,
    this.color,
    this.textColor,
    this.gradient,
    this.activeIconColor,
    this.width,
    this.fontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPressed,
        focusColor: Colors.orangeAccent,
        highlightColor: Colors.orangeAccent,
        hoverColor: Colors.orangeAccent,
        child: Container(
          height: 50,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: textColor != null ? textColor! : Colors.transparent,
              width: 1,
            ),
            gradient: color == null
                ? LinearGradient(
                    colors: _buildColor(),
                  )
                : null,
            color: color,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  _icon(),
                  SizedBox(width: _sizedBoxSize()),
                ],
              ),
              Flexible(
                child: Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: textColor ?? Colors.white.withOpacity(0.8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _icon() {
    if (icon != null) {
      return Icon(
        icon,
        color: activeIconColor ?? Colors.white.withOpacity(0.8),
        size: 16,
      );
    }
    return Container();
  }

  double _sizedBoxSize() {
    return icon != null ? 3 : 0;
  }

  List<Color> _buildColor() {
    List<Color> colors = [];

    if (gradient == null) {
      colors.add(Color(int.parse('FFF07A31', radix: 16)));
      colors.add(Color(int.parse('FFF7A11D', radix: 16)));
      return colors;
    }

    for (var item in gradient!) {
      colors.add(Color(int.parse('FF$item', radix: 16)));
    }

    return colors;
  }
}
