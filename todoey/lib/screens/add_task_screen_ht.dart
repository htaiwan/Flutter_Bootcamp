import 'package:flutter/material.dart';

class AddTaskScreenHT extends StatelessWidget {
  final Function addTaskButtonCallback;

  AddTaskScreenHT({this.addTaskButtonCallback});

  @override
  Widget build(BuildContext context) {
    String newTaskTitle;

    // 要做成有圓角的action sheet需要一些小技巧
    return Container(
      // 先一個底層container偽裝成背景色
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Column(
          children: <Widget>[
            Text(
              '增加項目',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (text) {
                newTaskTitle = text;
              },
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              child: Text(
                '增加',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                print(newTaskTitle);
              },
            ),
          ],
        ),
      ),
    );
  }
}
