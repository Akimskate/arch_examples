// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mvp_counter/counter_model.dart';
import 'package:mvp_counter/counter_view.dart';

class CounterPresenter {
  final CounterModel model;
  final CounterView view;

  CounterPresenter(
    this.model,
    this.view,
  );

  void incremenCounter() {
    model.incremenCounter();
    view.displayCounter(model.counter);
  }

  void decremenCounter() {
    model.decremenCounter();
    view.displayCounter(model.counter);
  }

  void resetcounterCounter() {
    model.resetcounterCounter();
    view.displayCounter(model.counter);
  }
}
