import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// 直接打"stless", 可以快速產生StatelessWidget樣板
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        /*
           - 文件: https://api.flutter.dev/flutter/widgets/Container-class.html
           - Container只能有一個child
           - 若Container沒有child時，則會盡量占滿全畫面
           - 若Container有child時,沒有指定size，則會自動縮小到剛剛好包括整個text
           - SafeArea: 將container放到合法範圍內
         */
        body: SafeArea(
          child: Container(
            height: 100,
            width: 100,
            // margin: Container跟外部SafeArea的間距
            margin: EdgeInsets.fromLTRB(10, 20, 30, 80),
            // padding: Container跟內部Child的間距
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Text('Hello World !'),
          ),
        ),
      ),
    );
  }
}
