import 'package:flutter/material.dart';
import 'package:moviesapptv1/pages/details/details_page.dart';

class LeftButtonIntent extends Intent {}

class RightButtonIntent extends Intent {}

class UpButtonIntent extends Intent {}

class DownButtonIntent extends Intent {}

class SelectButtonIntent extends Intent {}

class EnterButtonIntent extends Intent {}

class FocusWidget extends StatefulWidget {
  final String imageUrl;
  final Function changeFocusLeft;
  final Function changeFocusRight;
  final FocusNode? myFocusNode;
  final FocusNode? leftFocusNode;
  final FocusNode? rightFocusNode;

  const FocusWidget({
    Key? key,
    required this.imageUrl,
    required this.myFocusNode,
    required this.changeFocusLeft,
    required this.changeFocusRight,
    required this.leftFocusNode,
    required this.rightFocusNode,
  }) : super(key: key);

  @override
  State<FocusWidget> createState() => _FocusWidgetState();
}

class _FocusWidgetState extends State<FocusWidget> {
  _navigateToDetails(BuildContext context, String imageUrl) {
    Navigator.pushNamed(context, DetailsPage.routeName,
        arguments: {"imageUrl": imageUrl});
  }

  @override
  Widget build(BuildContext context) {
    return Actions(
      actions: <Type, Action<Intent>>{
        RightButtonIntent: CallbackAction<RightButtonIntent>(
          onInvoke: (intent) =>
              widget.changeFocusRight(context, widget.rightFocusNode),
        ),
        LeftButtonIntent: CallbackAction<LeftButtonIntent>(
          onInvoke: (intent) =>
              widget.changeFocusLeft(context, widget.leftFocusNode),
        ),
        EnterButtonIntent: CallbackAction<EnterButtonIntent>(
          onInvoke: (intent) => _navigateToDetails(context, widget.imageUrl),
        )
      },
      child: Focus(
        focusNode: widget.myFocusNode,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            border: (widget.myFocusNode != null && widget.myFocusNode!.hasFocus)
                ? Border.all(
                    width: 5,
                    color: Colors.white,
                  )
                : null,
          ),
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, DetailsPage.routeName,
                  arguments: {"imageUrl": widget.imageUrl});
            },
            child: Image.network(
              widget.imageUrl,
              width: 150,
              height: 225,
            ),
          ),
        ),
      ),
    );
  }
}
