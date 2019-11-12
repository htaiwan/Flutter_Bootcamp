import 'package:flutter/material.dart';

import '../widgets/task_tile_ht.dart';

class TaskListHT extends StatelessWidget {
  const TaskListHT({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        TaskTileHT(),
        TaskTileHT(),
      ],
    );
  }
}
