import 'package:flutter/material.dart';

import '../models/task.dart';
import '../widgets/task_tile_ht.dart';

class TaskListHT extends StatefulWidget {
  final List<Task> tasks;

  TaskListHT({this.tasks});

  @override
  _TaskListHTState createState() => _TaskListHTState();
}

class _TaskListHTState extends State<TaskListHT> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTileHT(
          taskTitle: widget.tasks[index].name,
          isChecked: widget.tasks[index].isDone,
          checkboxCallback: (bool checkboxState) {
            setState(() {
              widget.tasks[index].toggleDone();
            });
          },
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
