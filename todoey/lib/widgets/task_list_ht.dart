import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data_ht.dart';

import '../widgets/task_tile_ht.dart';

class TaskListHT extends StatefulWidget {
  @override
  _TaskListHTState createState() => _TaskListHTState();
}

class _TaskListHTState extends State<TaskListHT> {
  @override
  Widget build(BuildContext context) {
    // Consumer是Provider的套件之一，利用builder來中的taskData, 表示要監聽這個taskData的變化
    return Consumer<TaskDataHT>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TaskTileHT(
            taskTitle: task.name,
            isChecked: task.isDone,
            checkboxCallback: (bool checkboxState) {
              taskData.updateTask(task);
            },
            longPressCallback: () {
              taskData.deleteTask(task);
            },
          );
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
