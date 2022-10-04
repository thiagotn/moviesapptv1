import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
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
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.orangeAccent,
      highlightColor: Colors.orangeAccent,
      hoverColor: Colors.orangeAccent,
      onTap: () => widget.onTap(),
      child: Focus(
        onFocusChange: ((value) =>
            debugPrint("(${widget.actionName}) FocusChanged: $value")),
        child: Container(
          width: 160,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: widget.buttonColor,
          ),
          child: Center(
              child: Text(
            widget.actionName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: widget.textColor,
            ),
          )),
        ),
      ),
    );
  }
}
