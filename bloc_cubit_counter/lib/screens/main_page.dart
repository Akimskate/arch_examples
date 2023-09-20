import 'package:bloc_cubit_counter/cubit/counter_cubit.dart';
import 'package:bloc_cubit_counter/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder<CounterCubit, CounterState>(builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '${state.counter}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      '${state.statusCode}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context)
                            .resetCounter();
                      },
                      child: const Text('Reset'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).fetchStatusCode();
                            
                      },
                      child: const Text('send request'),
                    ),
                  ],
          ),
        );
      }),
      floatingActionButton: Column(
        children: [
          const SizedBox(
            height: 700,
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).decrementCounter();
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).incrementCounter();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
