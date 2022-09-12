import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviesapptv1/pages/widgets/focus_widget.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({Key? key}) : super(key: key);

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  FocusNode? _focusNode1;
  FocusNode? _focusNode2;
  FocusNode? _focusNode3;
  FocusNode? _focusNode4;
  FocusNode? _focusNode5;
  FocusNode? _focusNode6;
  FocusNode? _focusNode7;
  FocusNode? _focusNode8;

  _setFirstFocus(BuildContext context) {
    if (_focusNode1 == null) {
      _focusNode1 = FocusNode();
      _focusNode2 = FocusNode();
      _focusNode3 = FocusNode();
      _focusNode4 = FocusNode();
      _focusNode5 = FocusNode();
      _focusNode6 = FocusNode();
      _focusNode7 = FocusNode();
      _focusNode8 = FocusNode();
      FocusScope.of(context).requestFocus(_focusNode1);
    }
  }

  _changeFocus(BuildContext context, FocusNode? focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_focusNode1 == null) {
      _setFirstFocus(context);
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.arrowLeft): LeftButtonIntent(),
          LogicalKeySet(LogicalKeyboardKey.arrowRight): RightButtonIntent(),
          LogicalKeySet(LogicalKeyboardKey.arrowUp): UpButtonIntent(),
          LogicalKeySet(LogicalKeyboardKey.arrowDown): DownButtonIntent(),
          LogicalKeySet(LogicalKeyboardKey.enter): EnterButtonIntent(),
          LogicalKeySet(LogicalKeyboardKey.select): EnterButtonIntent(),
        },
        child: Row(
          children: [
            FocusWidget(
              imageUrl:
                  "https://www.themoviedb.org/t/p/w220_and_h330_face/eeRVmLGrijHpoyz5737eX40e5o0.jpg",
              myFocusNode: _focusNode1,
              changeFocusLeft: _changeFocus,
              changeFocusRight: _changeFocus,
              leftFocusNode: _focusNode8,
              rightFocusNode: _focusNode2,
            ),
            FocusWidget(
              imageUrl:
                  "https://www.themoviedb.org/t/p/w220_and_h330_face/AaI4egyV9dCMzOYoumyLMZrmRPg.jpg",
              myFocusNode: _focusNode2,
              changeFocusLeft: _changeFocus,
              changeFocusRight: _changeFocus,
              leftFocusNode: _focusNode1,
              rightFocusNode: _focusNode3,
            ),
            FocusWidget(
              imageUrl:
                  "https://www.themoviedb.org/t/p/w220_and_h330_face/30erzlzIOtOK3k3T3BAl1GiVMP1.jpg",
              myFocusNode: _focusNode3,
              changeFocusLeft: _changeFocus,
              changeFocusRight: _changeFocus,
              leftFocusNode: _focusNode2,
              rightFocusNode: _focusNode4,
            ),
            FocusWidget(
              imageUrl:
                  "https://www.themoviedb.org/t/p/w220_and_h330_face/fVzXp3NwovUlLe7fvoRynCmBPNc.jpg",
              myFocusNode: _focusNode4,
              changeFocusLeft: _changeFocus,
              changeFocusRight: _changeFocus,
              leftFocusNode: _focusNode3,
              rightFocusNode: _focusNode5,
            ),
            FocusWidget(
              imageUrl:
                  "https://www.themoviedb.org/t/p/w220_and_h330_face/eO0QV5qJaEngP1Ax9w3eV6bJG2f.jpg",
              myFocusNode: _focusNode5,
              changeFocusLeft: _changeFocus,
              changeFocusRight: _changeFocus,
              leftFocusNode: _focusNode4,
              rightFocusNode: _focusNode6,
            ),
            FocusWidget(
              imageUrl:
                  "https://www.themoviedb.org/t/p/w220_and_h330_face/ixgnqO8xhFMb1zr8RRFsyeZ9CdD.jpg",
              myFocusNode: _focusNode6,
              changeFocusLeft: _changeFocus,
              changeFocusRight: _changeFocus,
              leftFocusNode: _focusNode5,
              rightFocusNode: _focusNode7,
            ),
            FocusWidget(
              imageUrl:
                  "https://www.themoviedb.org/t/p/w220_and_h330_face/mGPFbEmWdaDVxO5V64xYwv6v8j.jpg",
              myFocusNode: _focusNode7,
              changeFocusLeft: _changeFocus,
              changeFocusRight: _changeFocus,
              leftFocusNode: _focusNode6,
              rightFocusNode: _focusNode8,
            ),
            FocusWidget(
              imageUrl:
                  "https://www.themoviedb.org/t/p/w220_and_h330_face/2pxKwxMbd5l3BxK5fBgVCWYweH2.jpg",
              myFocusNode: _focusNode8,
              changeFocusLeft: _changeFocus,
              changeFocusRight: _changeFocus,
              leftFocusNode: _focusNode7,
              rightFocusNode: _focusNode1,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode1?.dispose();
    _focusNode2?.dispose();
    _focusNode3?.dispose();
    _focusNode4?.dispose();
    _focusNode5?.dispose();
    _focusNode6?.dispose();
    _focusNode7?.dispose();
    _focusNode8?.dispose();
  }
}
