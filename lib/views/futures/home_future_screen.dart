import 'package:devetechnologies_flutter_course/services/future_book.dart';
import 'package:devetechnologies_flutter_course/views/futures/future_builder_screen.dart';
import 'package:flutter/material.dart';

class HomeFutureScreen extends StatefulWidget {
  static String routName = '/home-future-screen';
  const HomeFutureScreen({super.key});

  @override
  State<HomeFutureScreen> createState() => _HomeFutureScreenState();
}

class _HomeFutureScreenState extends State<HomeFutureScreen> {
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Future Screen'),
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(FutureBuilderScreen.routName);
              },
              child: const Text('Get Data'))),
    );
  }

  Widget _futureThen() {
    return Column(
      children: [
        const Spacer(),
        ElevatedButton(
            onPressed: () {
              FutureBook futureBook = FutureBook();
              result = '';
              setState(() {
                result = result;
              });
              futureBook.getDataBooks().then((value) {
                result = value.body.toString().substring(0, 500);
                setState(() {
                  result = result;
                });
              }).catchError((_) {
                result = 'Error Ocured';
                setState(() {
                  result = result;
                });
              });
            },
            child: const Text('Search')),
        const Spacer(),
        Text(result.toString()),
        const Spacer(),
        const CircularProgressIndicator(),
        // const Spacer(),
      ],
    );
  }
}
