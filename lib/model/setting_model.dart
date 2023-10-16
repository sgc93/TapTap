import 'package:flutter/material.dart';

class Settings with ChangeNotifier {
  int level = 2;
  int duration = 5;

  void increaseLevel() {
    level++;
    notifyListeners();
  }

  void decreaseLevel() {
    level--;
    notifyListeners();
  }

  void increaseDuration() {
    duration++;
    notifyListeners();
  }

  void decreaseDuration() {
    duration--;
    notifyListeners();
  }
}
