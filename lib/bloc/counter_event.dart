part of 'counter_bloc.dart';

sealed class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

final class IncrementEvent extends CounterEvent {
  final int number;

  const IncrementEvent({required this.number});
}

final class DecrementEvent extends CounterEvent {
  final int number;

  const DecrementEvent({required this.number});
}
