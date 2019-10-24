import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blueAccent[300],
      appBar: AppBar(
        title: Text('I am poor'),
        backgroundColor: Colors.deepOrangeAccent[700],
      ),
      body: Center(
        child: Image(
          image: AssetImage('images/cherry-success.png'),
        ),
      ),
    ),
  ));
}
