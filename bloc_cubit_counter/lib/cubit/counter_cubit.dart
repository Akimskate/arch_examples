import 'package:bloc_cubit_counter/cubit/counter_state.dart';
import 'package:bloc_cubit_counter/data/data_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState());

  final dataRepository = DataRepository();

  void incrementCounter() {
    final counter = state.counter + 1;
    final updatedCounter = CounterState(
      counter: counter,
      statusCode: state.statusCode,
    );
    emit(updatedCounter);
  }

  void decrementCounter() {
    final counter = state.counter - 1;
    final updatedCounter = CounterState(
      counter: counter,
      statusCode: state.statusCode,
    );
    emit(updatedCounter);
  }

  void resetCounter() {
    const counter = 0;
    final updatedCounter = CounterState(
      counter: counter,
      statusCode: state.statusCode,
    );
    emit(updatedCounter);
  }

  void fetchStatusCode() async {
    try {
      final statusCode = await dataRepository.fetchData();
      final updatedState =
          CounterState(counter: state.counter, statusCode: statusCode);
      emit(updatedState);
    } catch (e) {
      print('Ошибка при выполнении запроса: $e');
    }
  }
}
