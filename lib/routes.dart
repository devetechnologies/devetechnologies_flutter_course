import 'package:devetechnologies_flutter_course/form/login_screen.dart';
import 'package:devetechnologies_flutter_course/manage-state/stop_count.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routName: (context) => const LoginScreen(),
  StopCounterState.routName: (context) => const StopCounterState(),
};
