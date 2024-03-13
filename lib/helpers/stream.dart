import 'package:flutter/material.dart';

class ColorStream {
  //Stream? color;
  Stream<Color> getColors() async* {
    final List<Color> colors = [
      Colors.blueAccent,
      Colors.blueGrey,
      Colors.redAccent,
      Colors.greenAccent,
      Colors.purpleAccent
    ];
    yield* Stream.periodic(const Duration(seconds: 1), (int value) {
      int index = value % 5;
      return colors[index];
    });
  }
}
