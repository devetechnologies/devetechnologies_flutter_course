import 'package:flutter/material.dart';

import '../manage-state/stop_count.dart';

class LoginScreen extends StatefulWidget {
  static String routName = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emialController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Login Screen'),
        ),
        body: _buildForm());
  }

  Widget _buildForm() {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) =>
                      value!.isEmpty ? 'Enter your name' : null),
              TextFormField(
                controller: _emialController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your Email';
                  }
                  final regex = RegExp('[^@]+@[^.]+..+');
                  if (!regex.hasMatch(value)) {
                    return 'Incorrect email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    _validateForm();
                  },
                  child: const Text('Validate'))
            ],
          ),
        ));
  }

  void _validateForm() {
    final form = _formKey.currentState;
    if (!form!.validate()) {
      return;
    }

    final name = _nameController.text;
    final email = _emialController.text;

    Navigator.of(context).pushNamed(StopCounterState.routName, arguments: name);
  }
}
