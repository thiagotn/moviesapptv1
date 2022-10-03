import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String actionName; // "Assistir"
  final Color buttonColor; // Colors.orangeAccent
  final Color textColor; // Colors.black
  final Function onTap; //

  const ButtonWidget({
    Key? key,
    required this.actionName,
    required this.buttonColor,
    required this.textColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        width: 160,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: buttonColor,
        ),
        child: Center(
            child: Text(
          actionName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: textColor,
          ),
        )),
      ),
    );
  }
}
