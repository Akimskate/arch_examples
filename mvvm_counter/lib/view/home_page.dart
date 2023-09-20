import 'package:flutter/material.dart';
import 'package:mvvm_counter/view_model/counter_view_model.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CounterViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${viewModel.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              '${viewModel.statusCode}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                viewModel.resetDounter();
                viewModel.getStatusCode();
              },
              child: const Text('Resrt'),
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
            onPressed: viewModel.decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: viewModel.incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
