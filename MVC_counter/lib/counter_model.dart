import 'package:flutter/foundation.dart';

class CounterModel extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  incrementCounter() {
    _counter++;
    notifyListeners();
  }

  decrementCounter() {
    _counter--;
    notifyListeners();
  }

  resetCounter() {
    _counter = 0;
    notifyListeners();
  }
}