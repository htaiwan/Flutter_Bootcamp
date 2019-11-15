import 'package:flutter/material.dart';

import '../models/task.dart';
import '../widgets/task_tile_ht.dart';

class TaskListHT extends StatefulWidget {
  @override
  _TaskListHTState createState() => _TaskListHTState();
}

class _TaskListHTState extends State<TaskListHT> {
  List<Task> tasks = [
    Task(name: "喝飲料"),
    Task(name: "吃雞排"),
    Task(name: "去運動"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTileHT(
          taskTitle: tasks[index].name,
          isChecked: tasks[index].isDone,
          checkboxCallback: (bool checkboxState) {
            setState(() {
              tasks[index].toggleDone();
            });
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}
