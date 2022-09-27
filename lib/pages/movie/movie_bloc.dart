import 'package:flutter/material.dart';

class MovieBloc extends ChangeNotifier {
  int currentTabIndex = 0;

  void setCurrentTabIndex(int? targetTabIndex) {
    if (targetTabIndex is int) {
      currentTabIndex = targetTabIndex;
      notifyListeners();
    }
  }
}
