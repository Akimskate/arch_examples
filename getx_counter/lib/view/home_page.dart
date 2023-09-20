import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_counter/controllers/counter_controller.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final counterController = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ],
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(
              () => Text(
                '${counterController.counter.value}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Obx(
              () => Text(
                '${counterController.statusCode.value}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                counterController.resetCounter();
              },
              child: const Text('Reset'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                counterController.fetchStatusCode();
              },
              child: const Text('send request'),
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
            onPressed: () {
              counterController.decrementCounter();
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              counterController.incrementCounter();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
