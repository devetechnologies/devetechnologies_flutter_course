import 'dart:async';
import 'dart:math';

import 'package:devetechnologies_flutter_course/helpers/stream.dart';
import 'package:flutter/material.dart';

class StreamHomeScreen extends StatefulWidget {
  static String routName = '/stream-home-screen';
  const StreamHomeScreen({super.key});

  @override
  State<StreamHomeScreen> createState() => _StreamHomeScreenState();
}

class _StreamHomeScreenState extends State<StreamHomeScreen> {
  Color? color;
  ColorStream? colorStream;
  int? lastNumber;
  StreamController? numberStreamController;
  StreamNumber? streamNumber;

  @override
  void initState() {
    //colorStream = ColorStream();
    //changeColorScreen();
    getNumberStreamController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Stream Controller'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addRandomNumber();
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child:
            Text(lastNumber.toString() == 'null' ? "" : lastNumber.toString()),
      ),
    );
  }

  void changeColorScreen() async {
    await for (var element in colorStream!.getColors()) {
      setState(() {
        color = element;
      });
    }
  }

  void getNumberStreamController() {
    streamNumber = StreamNumber();
    numberStreamController = streamNumber!.controller;
    Stream stream = numberStreamController!.stream;

    stream.listen((event) {
      setState(() {
        lastNumber = event;
      });
    });
  }

  void addRandomNumber() {
    Random random = Random();
    int myNumber = random.nextInt(10);
    streamNumber!.addNumber(myNumber);
  }
}
