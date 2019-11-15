import 'package:flutter/material.dart';

class TaskTileHT extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;

  TaskTileHT({this.taskTitle, this.isChecked, this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
