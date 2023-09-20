import 'package:flutter/material.dart';
import 'package:mvvm_counter/model/counter_model.dart';


import 'package:mvvm_counter/services/server_statuse_service.dart';

class CounterViewModel extends ChangeNotifier {
  final serverStatusService = ServerStatusService();
  final CounterModel _model = CounterModel();

  int get counter => _model.counter;

  int get statusCode => _model.statusCode;

  void incrementCounter() {
    _model.counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _model.counter--;
    notifyListeners();
  }

  void resetDounter() {
    _model.counter = 0;
    notifyListeners();
  }

  void getStatusCode() async {
    final isServerOnline = await serverStatusService.fetchServerStatus();
    if (isServerOnline) {
      _model.statusCode = 200;
    } else {
      _model.statusCode = 404;
    }
    notifyListeners();
  }
}
