import 'dart:async';

import 'package:flutter/material.dart';

class StopCounterState extends StatefulWidget {
  const StopCounterState({super.key});

  @override
  State<StopCounterState> createState() => _StopCounterStateState();
}

class _StopCounterStateState extends State<StopCounterState> {
  int seconds = 0;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), _runing);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('State Manage'),
      ),
      body: Center(
        child: Text(
          'seconds: $seconds',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }

  void _runing(Timer timer) {
    setState(() {
      ++seconds;
    });
  }
}
