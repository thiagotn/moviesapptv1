import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviesapptv1/pages/player/player_page.dart';

class SelectButtonIntent extends Intent {}

class EnterButtonIntent extends Intent {}

class BackspaceButtonIntent extends Intent {}

class DetailsPage extends StatefulWidget {
  static var routeName = "/details";
  final String? imageUrl;

  const DetailsPage({
    Key? key,
    this.imageUrl,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  FocusNode? _focusNode1;
  FocusNode? _focusNode2;

  _setFirstFocus(BuildContext context) {
    if (_focusNode1 == null) {
      _focusNode1 = FocusNode();
      _focusNode2 = FocusNode();
      FocusScope.of(context).requestFocus(_focusNode2);
    }
  }

  _changeFocus(BuildContext context, FocusNode? focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _navigateToPlayer(BuildContext context) {
      print("_navigateToPlayer...");
      Navigator.pushNamed(context, PlayerPage.routeName);
    }

    if (_focusNode1 == null) {
      _setFirstFocus(context);
    }

    var imgUrl =
        "https://www.themoviedb.org/t/p/w300_and_h450_bestv2_filter(blur)/z9a3b7DePtdo2E8NzyPwoGHGsYk.jpg";
    var argumentsObj = ModalRoute.of(context)?.settings.arguments;
    if (argumentsObj != null) {
      Map? arguments = argumentsObj as Map;
      imgUrl = arguments["imageUrl"]!;
    }

    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop(true);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Details"),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(imgUrl),
                Shortcuts(
                  shortcuts: <LogicalKeySet, Intent>{
                    LogicalKeySet(LogicalKeyboardKey.backspace):
                        BackspaceButtonIntent(),
                    LogicalKeySet(LogicalKeyboardKey.select):
                        SelectButtonIntent(),
                    LogicalKeySet(LogicalKeyboardKey.enter):
                        EnterButtonIntent(),
                  },
                  child: Actions(
                    actions: <Type, Action<Intent>>{
                      EnterButtonIntent: CallbackAction<EnterButtonIntent>(
                        onInvoke: (intent) => _navigateToPlayer(context),
                      ),
                      SelectButtonIntent: CallbackAction<SelectButtonIntent>(
                        onInvoke: (intent) => _navigateToPlayer(context),
                      ),
                      BackspaceButtonIntent:
                          CallbackAction<BackspaceButtonIntent>(
                        onInvoke: (intent) => Navigator.of(context).pop(),
                      ),
                    },
                    child: Focus(
                      focusNode: _focusNode2,
                      autofocus: true,
                      child: Container(
                        width: 180,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: (_focusNode2 != null && _focusNode2!.hasFocus)
                              ? Border.all(
                                  width: 5,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, PlayerPage.routeName);
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 30.0,
                              ),
                              Text(
                                "Assistir",
                                style: Theme.of(context).textTheme.button,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode1?.dispose();
    _focusNode2?.dispose();
  }
}
