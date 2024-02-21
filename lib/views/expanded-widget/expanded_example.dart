import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class ExpandedExample extends StatelessWidget {
  const ExpandedExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Expanded Widget'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                  height: 300,
                  color: Colors.amberAccent,
                  child: Image.network(
                    'https://media.istockphoto.com/id/1296913338/photo/sonoran-sunset.jpg?s=612x612&w=0&k=20&c=lGXd-vnDmH_bCnR53BNmwxsh3qn8MBLQoh5M926QAbY=',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  )),
            ),
            const SizedBox(
              height: 3,
            ),
            Expanded(
              child: Container(
                  height: 300,
                  color: Colors.amberAccent,
                  child: Image.network(
                    'https://www.nyip.edu/images/cms/photo-articles/the-best-place-to-focus-in-a-landscape.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  )),
            ),
            const SizedBox(
              height: 3,
            ),
            Expanded(
              child: Container(
                  color: Colors.amberAccent,
                  child: Image.network(
                    'https://www.explore.com/img/gallery/the-50-most-incredible-landscapes-in-the-whole-entire-world/intro-1672072042.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  )),
            ),
            const SizedBox(
              height: 3,
            ),
            Expanded(
              child: Container(
                height: 100,
                color: Colors.amberAccent,
                child: Image.network(
                  'https://media.istockphoto.com/id/1296913338/photo/sonoran-sunset.jpg?s=612x612&w=0&k=20&c=lGXd-vnDmH_bCnR53BNmwxsh3qn8MBLQoh5M926QAbY=',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          ],
        ));
  }
}
