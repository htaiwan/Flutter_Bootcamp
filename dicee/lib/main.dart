import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  // 盡量少用var, dynamic確保save type
  int leftDiceNumber = 5;
  int rightDiceNumber = 3;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          // https://api.flutter.dev/flutter/widgets/Expanded-class.html
          Expanded(
            // https://api.flutter.dev/flutter/material/FlatButton-class.html
            child: FlatButton(
              onPressed: () {
                setState(() {
                  // 在這裡會將leftDiceNumber打上dirty flag, 所以之後refresh widget tree
                  // 只會針對這些所有有用到leftDiceNumber的地方都進行更新
                  leftDiceNumber = Random().nextInt(6) + 1; // 產生1~6
                  rightDiceNumber = Random().nextInt(6) + 1;
                  print('left number = $leftDiceNumber');
                });
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          /*
            利用option + enter 叫出快捷鍵，進行intention Actions
            可以快速移動widget到tree的某一個點
           */
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  leftDiceNumber = Random().nextInt(6) + 1; // 產生1~6
                  rightDiceNumber = Random().nextInt(6) + 1;
                  print('right unmber = $rightDiceNumber');
                });
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
