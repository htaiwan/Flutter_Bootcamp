import 'package:flutter/material.dart';

class TaskTileHT extends StatefulWidget {
  @override
  _TaskTileHTState createState() => _TaskTileHTState();
}

class _TaskTileHTState extends State<TaskTileHT> {
  bool isChecked = false;
  void checkBoxCallback(bool checkboxState) {
    setState(() {
      isChecked = checkboxState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '項目1',
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: TaskCheckBoxHT(
        checkboxState: isChecked,
        toggleCheckboxState: checkBoxCallback,
      ),
    );
  }
}

class TaskCheckBoxHT extends StatelessWidget {
  // 要將child widget狀態回傳到parent使用
  final bool checkboxState;
  final Function toggleCheckboxState;

  TaskCheckBoxHT({this.checkboxState, this.toggleCheckboxState});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkboxState,
      onChanged: toggleCheckboxState,
    );
  }
}
