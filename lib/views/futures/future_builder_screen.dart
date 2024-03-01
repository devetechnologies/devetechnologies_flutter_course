import 'package:flutter/material.dart';

import '../../services/future_book.dart';

class FutureBuilderScreen extends StatelessWidget {
  static String routName = '/future-builder-screen';
  const FutureBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FutureBook futureBook = FutureBook();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('FutureBuilder Screen'),
      ),
      body: Center(
        child: FutureBuilder(
          future: futureBook.getDataBooks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return Text(snapshot.data!.body.toString().substring(0, 500));
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
