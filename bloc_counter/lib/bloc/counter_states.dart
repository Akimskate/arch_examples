class CounterStates {
}

class InitialState extends CounterStates {}

class UpdateState extends CounterStates{
  int counter = 0;
  int statusCode = 0;
  UpdateState(this.counter, this.statusCode);
}