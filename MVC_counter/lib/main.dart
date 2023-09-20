// в этом проекте пример стандартно счетчика,
// выполненый по архитектуре MVC.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:MVC_counter/counter_controller.dart';
import 'package:MVC_counter/counter_model.dart';
import 'package:MVC_counter/my_home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<CounterModel>(context);
    final counterController = CounterController(counterModel);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        controller: counterController,
      ),
    );
  }
}


