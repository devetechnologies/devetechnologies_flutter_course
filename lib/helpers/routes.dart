import 'package:devetechnologies_flutter_course/views/bloc_screen/bloc_counter_screen.dart';
import 'package:devetechnologies_flutter_course/views/futures/future_builder_screen.dart';
import 'package:devetechnologies_flutter_course/views/futures/home_future_screen.dart';
import 'package:devetechnologies_flutter_course/views/plan/plan_screen.dart';
import 'package:devetechnologies_flutter_course/views/products/product_screen.dart';
import 'package:devetechnologies_flutter_course/views/stream/stream_home_scree.dart';
import 'package:flutter/material.dart';

import '../views/form/login_screen.dart';
import '../views/manage-state/stop_count.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routName: (context) => const LoginScreen(),
  StopCounterState.routName: (context) => const StopCounterState(),
  PlanScreen.routName: (context) => const PlanScreen(),
  HomeFutureScreen.routName: (context) => const HomeFutureScreen(),
  FutureBuilderScreen.routName: (context) => const FutureBuilderScreen(),
  ProductScreen.routName: (context) => const ProductScreen(),
  StreamHomeScreen.routName: (context) => const StreamHomeScreen(),
  BlocCounterScreen.routName: (context) => const BlocCounterScreen()
};
