import 'package:flutter/material.dart';
import 'package:mvvm_counter/view_model/counter_view_model.dart';
import 'package:mvvm_counter/view/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = CounterViewModel();
    return ChangeNotifierProvider<CounterViewModel>(
      create: (_) => viewModel,
      child: MaterialApp(
        title: 'MVVM counter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'MVVM counter'),
      ),
    );
  }
}

