part of 'counter_bloc.dart';

sealed class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object> get props => [];
}

final class CounterInitialState extends CounterState {
  final int counteNumber;

  const CounterInitialState({required this.counteNumber});
  @override
  List<Object> get props => [counteNumber];
}
