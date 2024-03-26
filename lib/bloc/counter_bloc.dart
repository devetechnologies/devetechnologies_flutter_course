import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitialState(counteNumber: 0)) {
    on<IncrementEvent>(_incrementCount);
    on<DecrementEvent>(_decrementCount);
  }

  FutureOr<void> _incrementCount(
      IncrementEvent event, Emitter<CounterState> emit) {
    emit(CounterInitialState(counteNumber: event.number + 1));
  }

  FutureOr<void> _decrementCount(
      DecrementEvent event, Emitter<CounterState> emit) {
    emit(CounterInitialState(counteNumber: event.number - 1));
  }
}
