import 'package:flutter/material.dart';

class UIProvider extends ChangeNotifier {
  int _selectedMenuItem = 0;

  int get selectedMenuItem {
    return _selectedMenuItem;
  }

  set selectedMenuItem(int value) {
    _selectedMenuItem = value;
    notifyListeners();
  }
}
