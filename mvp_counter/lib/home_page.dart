// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mvp_counter/counter_presenter.dart';

class MyHomePage extends StatefulWidget {

  final CounterPresenter presenter;

  const MyHomePage({
    Key? key,
    required this.presenter,
}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MVP counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${widget.presenter.model.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  
                widget.presenter.resetcounterCounter();
                });
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
            onPressed: () => {
              setState(() {
              widget.presenter.decremenCounter();
              })
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () => {
              setState(() {
              widget.presenter.incremenCounter();
                
              }),
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}