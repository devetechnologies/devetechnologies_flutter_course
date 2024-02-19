import 'dart:async';

import 'package:flutter/material.dart';

class StopCounterState extends StatefulWidget {
  static String routName = '/stop-count-screen';

  const StopCounterState({super.key});

  @override
  State<StopCounterState> createState() => _StopCounterStateState();
}

class _StopCounterStateState extends State<StopCounterState> {
  int seconds = 0;
  Timer? timer;
  bool isClick = true;
  int milliseconds = 0;
  final listSeconds = <int>[];
  final scrollController = ScrollController();
  final itemHeig = 60.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(const Duration(microseconds: 100), _runing);
  }

  void _runing(Timer timer) {
    setState(() {
      milliseconds += 100;
    });
  }

  void _stopCount() {
    timer!.cancel();
    setState(() {
      isClick = false;
    });
  }

  @override
  void dispose() {
    timer!.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  void _restartCount() {
    timer = Timer.periodic(const Duration(microseconds: 100), _runing);
    listSeconds.clear();
    setState(() {
      milliseconds = 0;
      isClick = true;
    });
  }

  String _secondText(int microseconds) {
    final secondsText = milliseconds / 100;
    return '$secondsText seconds';
  }

  @override
  Widget build(BuildContext context) {
    final name = ModalRoute.of(context)!.settings.arguments ?? "";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(name.toString()),
      ),
      body: Column(
        children: [
          Expanded(child: _buildSecondsContainer(context)),
          Expanded(child: _buildCountList())
        ],
      ),
    );
  }

  void addValueListSeconds() {
    scrollController.animateTo(itemHeig * listSeconds.length,
        duration: const Duration(microseconds: 500), curve: Curves.easeIn);
    setState(() {
      listSeconds.add(milliseconds);
      milliseconds = 0;
    });
  }

  Widget _buildSecondsContainer(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _secondText(milliseconds),
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
              ElevatedButton(
                onPressed: isClick ? addValueListSeconds : null,
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.yellow),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white)),
                child: const Text('Add To List'),
              ),
              const SizedBox(
                width: 10,
              ),
              TextButton(
                onPressed: isClick ? null : _restartCount,
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.redAccent),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white)),
                child: const Text('Restart Count'),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCountList() {
    return ListView.builder(
      itemCount: listSeconds.length,
      controller: scrollController,
      itemExtent: itemHeig,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Count seconds ${index + 1}'),
          trailing: Text(_secondText(milliseconds)),
        );
      },
    );
  }
}
