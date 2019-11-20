import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data_ht.dart';
import 'package:todoey_flutter/screens/tasks_screen_ht.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => TaskDataHT(),
      child: MaterialApp(
        home: TasksScreenHT(),
      ),
    );
  }
}
