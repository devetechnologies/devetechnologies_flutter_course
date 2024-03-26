import 'package:devetechnologies_flutter_course/bloc/counter_bloc.dart';
import 'package:devetechnologies_flutter_course/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  static String routName = '/bloc-counter-screen';
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      buildWhen: (previous, current) => current is CounterInitialState,
      builder: (context, state) {
        state as CounterInitialState;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Bloc Counter'),
          ),
          body: Center(
            child: Text(state.counteNumber.toString()),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  context
                      .read<CounterBloc>()
                      .add(IncrementEvent(number: state.counteNumber));
                },
              ),
              const SizedBox(
                height: 5,
              ),
              FloatingActionButton(
                child: const Icon(Icons.remove),
                onPressed: () {
                  context
                      .read<CounterBloc>()
                      .add(DecrementEvent(number: state.counteNumber));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
