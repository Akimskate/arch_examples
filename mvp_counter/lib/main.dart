//Пример реализации MVP архитектуры на обычном счетчике


import 'package:flutter/material.dart';
import 'package:mvp_counter/counter_model.dart';
import 'package:mvp_counter/counter_presenter.dart';
import 'package:mvp_counter/counter_view.dart';
import 'package:mvp_counter/home_page.dart';

void main() { runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final model = CounterModel();
    final view = CounterView();
    final presenter = CounterPresenter(model, view);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(presenter: presenter),
    );
  }
}





