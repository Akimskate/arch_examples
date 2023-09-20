class CounterModel {
  int _counter = 0;

  int get counter {
    return _counter;
  }

  void setCounter(int value) {
    _counter = value;
  }

  void incremenCounter() {
    _counter++;
  }
  void decremenCounter() {
    _counter--;
  }
  void resetcounterCounter() {
    _counter = 0;
  }
}
