import 'package:bloc_counter/bloc/counter_event.dart';
import 'package:bloc_counter/bloc/counter_states.dart';
import 'package:bloc_counter/data/data_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  int counter = 0;
  int statusCode = 0;

  final dataRepository = DataRepository();

  CounterBloc() : super(InitialState()) {
    on<IncrementNumber>(onIncrementNumber);
    on<DecrementNumber>(onDecrementNumber);
    on<ResetNumber>(onResetNumber);
    on<FetchData>(onSendRequest);
  }

  void onIncrementNumber(
      IncrementNumber event, Emitter<CounterStates> emit) async {
    counter = counter + 1;
    emit(UpdateState(counter, statusCode));
  }

  void onDecrementNumber(
      DecrementNumber event, Emitter<CounterStates> emit) async {
    counter = counter - 1;
    emit(UpdateState(counter, statusCode));
  }

  void onResetNumber(ResetNumber event, Emitter<CounterStates> emit) async {
    counter = 0;
    emit(UpdateState(counter, statusCode));
  }

  void onSendRequest(FetchData event, Emitter<CounterStates> emit) async {
    int newStatusCode = await dataRepository.fetchData();
    statusCode = newStatusCode;
    emit(UpdateState(counter, statusCode));
  }
}
