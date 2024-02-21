import 'package:devetechnologies_flutter_course/views/plan/plan_screen.dart';
import 'package:flutter/material.dart';

import '../views/form/login_screen.dart';
import '../views/manage-state/stop_count.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routName: (context) => const LoginScreen(),
  StopCounterState.routName: (context) => const StopCounterState(),
  PlanScreen.routName: (context) => const PlanScreen()
};
