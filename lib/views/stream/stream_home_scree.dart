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

  @override
  void initState() {
    colorStream = ColorStream();
    changeColorScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color),
    );
  }

  void changeColorScreen() async {
    await for (var element in colorStream!.getColors()) {
      setState(() {
        color = element;
      });
    }
  }
}
