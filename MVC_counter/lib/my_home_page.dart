import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:MVC_counter/counter_controller.dart';
import 'package:MVC_counter/counter_model.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  final CounterController controller;
  const MyHomePage({
    Key? key,
    required this.title,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final couterModel = Provider.of<CounterModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${couterModel.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                controller.resetCounter();
              },
              child: const Text('Reset Counter'),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        children: [
          const SizedBox(
            height: 700,
          ),
          FloatingActionButton(
            onPressed: () => controller.decrementCounter(),
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () => controller.incrementCounter(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
