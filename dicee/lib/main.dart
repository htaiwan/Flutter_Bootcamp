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

class DicePage extends StatelessWidget {
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
                print("按左邊");
              },
              child: Image.asset('images/dice1.png'),
            ),
          ),
          /*
            利用option + enter 叫出快捷鍵，進行intention Actions
            可以快速移動widget到tree的某一個點
           */
          Expanded(
            child: FlatButton(
              onPressed: () {
                print("按右邊");
              },
              child: Image.asset('images/dice1.png'),
            ),
          ),
        ],
      ),
    );
  }
}
