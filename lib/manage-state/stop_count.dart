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
  bool isClick = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), _runing);
  }

  void _runing(Timer timer) {
    setState(() {
      ++seconds;
    });
  }

  void _stopCount() {
    timer!.cancel();
    setState(() {
      isClick = false;
    });
  }

  void _restartCount() {
    timer = Timer.periodic(const Duration(seconds: 1), _runing);
    setState(() {
      seconds = 0;
      isClick = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('State Manage'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'seconds: $seconds',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: isClick ? _stopCount : null,
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  child: const Text('Stop Count'),
                ),
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                  onPressed: isClick ? null : _restartCount,
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blueAccent),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  child: const Text('Restart Count'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
