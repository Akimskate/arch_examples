import 'package:MVC_counter/counter_model.dart';

class CounterController {

  final CounterModel _model;

  CounterController(this._model); 

  void incrementCounter() {
    _model.incrementCounter();
  }

  void decrementCounter() {
    _model.decrementCounter();
  }

  void resetCounter() {
    _model.resetCounter();
  }

}