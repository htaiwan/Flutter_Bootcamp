import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[700],
        appBar: AppBar(
          title: Text('I am rich'),
          backgroundColor: Colors.yellow[600],
        ),
        body: Center(
          child: Image(
            image: NetworkImage(
                'https://pngimage.net/wp-content/uploads/2018/06/online-png-4.png'),
          ),
        ),
      ),
    ),
  );
}
