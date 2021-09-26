import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_package/counter_bloc/counter_event.dart';
import 'package:flutter_bloc_cubit_package/counter_bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is CounterIncrement) {
      yield CounterState(state.counter + 1);
    } else if (event is CounterDecrement) {
      yield CounterState(state.counter - 1);
    }
  }
}
