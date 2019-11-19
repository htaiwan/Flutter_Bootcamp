import 'package:flutter/material.dart';

import '../models/task.dart';
import '../screens/add_task_screen_ht.dart';
import '../widgets/task_list_ht.dart';

class TasksScreenHT extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TasksScreenHTState();
  }
}

class _TasksScreenHTState extends State<TasksScreenHT> {
  List<Task> tasks = [
//    Task(name: "喝飲料"),
//    Task(name: "吃雞排"),
//    Task(name: "去運動"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) => AddTaskScreenHT(
                      addTaskButtonCallback: (title) {
                        setState(() {
                          print(title);
                          tasks.add(Task(name: title));
                          // 移除showModalBottomSheet
                          Navigator.pop(context);
                        });
                      },
                    ));
          }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Today',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${tasks.length} tasks',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: TaskListHT(
                tasks: tasks,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
