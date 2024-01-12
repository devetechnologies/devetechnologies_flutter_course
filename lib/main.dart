import 'package:flutter/material.dart';
import 'dart:math' as Math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyFirstWidget(),
    );
  }
}

class MyFirstWidget extends StatelessWidget {
  const MyFirstWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: const Text('My first Widget'),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(5),
            child: Icon(Icons.add_a_photo),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Icon(Icons.access_alarm_outlined),
          ),
        ],
      ),
      drawer: _drawerWidget(context),
      floatingActionButton: _floattingButtonWidget(),
      body: _boddyWidget(),
    );
  }

  Center _boddyWidget() {
    return Center(
      child: AspectRatio(
          aspectRatio: 1.0,
          child: Container(
            decoration: const BoxDecoration(color: Colors.green),
            foregroundDecoration: const BoxDecoration(
                backgroundBlendMode: BlendMode.colorBurn,
                gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xAA0d6123),
                      Color(0x00000000),
                      Color(0xAA0d6123),
                    ])),
            child: Center(
              child: Transform.rotate(
                angle: 180 / Math.pi,
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.deepPurple.withBlue(120),
                            spreadRadius: 4,
                            blurRadius: 15,
                            offset: Offset.fromDirection(1.0, 30))
                      ],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(50),
                    child: _buildCircleContainer(),
                  ),
                ),
              ),
            ),
          )),
    );
  }

  Widget _buildCircleContainer() {
    return Container(
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
              colors: [Colors.lightBlueAccent, Colors.blueAccent],
              center: Alignment(-0.3, -0.5)),
          boxShadow: [BoxShadow(blurRadius: 20)]),
    );
  }

  FloatingActionButton _floattingButtonWidget() {
    return FloatingActionButton(
      onPressed: () {
        print('Hello Print');
      },
      child: const Icon(Icons.plumbing_sharp),
    );
  }

  Drawer _drawerWidget(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [_headerMethod(context), _menuDrawer(context)],
        ),
      ),
    );
  }

  Material _headerMethod(BuildContext context) {
    return Material(
      color: Colors.blueGrey,
      child: InkWell(
        child: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            bottom: 24,
          ),
          child: const Column(
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                    'https://manuel-montolio-blog.herokuapp.com/images/profile.jpg'),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Manuel Montolio',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
              Text(
                'manuel.montolio.g@gmail.com',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _menuDrawer(BuildContext context) {
  return Column(
    children: [
      ListTile(
        leading: const Icon(Icons.home_max_outlined),
        title: const Text('Home'),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.favorite_border),
        title: const Text('Favorite'),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.workspaces),
        title: const Text('WorkFlow'),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.update),
        title: const Text('Update'),
        onTap: () {},
      ),
      const Divider(
        color: Colors.red,
      ),
      ListTile(
        leading: const Icon(Icons.account_tree_outlined),
        title: const Text('Plugins'),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.notification_add_outlined),
        title: const Text('Notifications'),
        onTap: () {},
      ),
    ],
  );
}
