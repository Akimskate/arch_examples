import 'package:bloc_counter/bloc/counter_block.dart';
import 'package:bloc_counter/bloc/counter_event.dart';
import 'package:bloc_counter/bloc/counter_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  int statusCode = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<CounterBloc, CounterStates>(
        builder: (context, state) {
          if (state is InitialState || state is UpdateState) {
            int counter = 0;
            if (state is UpdateState) {
              counter = state.counter;
              statusCode = state.statusCode;
            }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '$counter',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      '$statusCode',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CounterBloc>(context)
                            .add(ResetNumber());
                      },
                      child: const Text('Reset'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CounterBloc>(context)
                            .add(FetchData());
                      },
                      child: const Text('send request'),
                    ),
                  ],
                ),
              );
            } return Container();
          
          
          
        },
      ),
      floatingActionButton: Column(
        children: [
          const SizedBox(
            height: 700,
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(DecrementNumber());
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(IncrementNumber());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
