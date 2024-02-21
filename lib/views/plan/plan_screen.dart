import 'package:devetechnologies_flutter_course/models/task_model.dart';
import 'package:flutter/material.dart';

import '../../models/plan_model.dart';

class PlanScreen extends StatefulWidget {
  static String routName = '/plan-screen';
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  final plan = Plan();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Plans'),
      ),
      body: _buildList(),
      floatingActionButton: _builAddTaskButton(),
    );
  }

  Widget _builAddTaskButton() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          plan.tasks.add(Task());
        });
      },
      child: const Icon(Icons.add),
    );
  }

  Widget _buildList() {
    return ListView.builder(
        itemBuilder: (context, index) {
          return _builTaskTitle(plan.tasks[index]);
        },
        itemCount: plan.tasks.length);
  }

  Widget _builTaskTitle(Task task) {
    return ListTile(
      leading: Checkbox(
          value: task.isComplete,
          onChanged: (value) {
            setState(() {
              task.isComplete = value!;
            });
          }),
      title: TextField(
        onChanged: (value) {
          task.description = value;
        },
      ),
    );
  }
}
