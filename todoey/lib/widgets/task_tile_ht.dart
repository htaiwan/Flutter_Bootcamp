import 'package:flutter/material.dart';

class TaskTileHT extends StatelessWidget {
  const TaskTileHT({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('項目1'),
      trailing: Checkbox(
        value: false,
      ),
    );
  }
}
