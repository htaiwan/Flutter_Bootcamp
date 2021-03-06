import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MiCardApp());

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

/*
  - 文件: https://api.flutter.dev/flutter/widgets/Column-class.html
  - Column可以有多個child
  - 參考: https://medium.com/flutter-community/flutter-layout-cheat-sheet-5363348d037e
 */
class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            // 將主軸(column)的大小，剛好包住整個child內容
            // mainAxisSize: MainAxisSize.min,
            // 沿著column的底端仼上爬
            // verticalDirection: VerticalDirection.up,
            // 控制child在column的layout方式
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // 控制child的主軸的垂直方向的layout方式
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 100,
                width: 100,
                color: Colors.white,
                child: Text('Container1 !'),
              ),
              // 利用sizebox來分割2個child間距
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.yellow,
                child: Text('Container1 2'),
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.red,
                child: Text('Container1 3'),
              ),
              Container(width: double.infinity, height: 100)
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: double.infinity,
                width: 100,
                color: Colors.red,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.green,
                  )
                ],
              ),
              Container(
                height: double.infinity,
                width: 100,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MiCardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/Kai.jpg'),
              ),
              Text(
                'Kai Cheng',
                style: TextStyle(
                  fontFamily: 'LiuJianMaoCao',
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              Text(
                'Flutter Developer',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  color: Colors.teal.shade100,
                  fontSize: 20,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    title: Text(
                      '+ 886 975055210',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        color: Colors.teal.shade900,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal,
                    ),
                    title: Text(
                      'htaiwan@gmail.com',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        color: Colors.teal.shade900,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
