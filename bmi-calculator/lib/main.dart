import 'package:flutter/material.dart';

import 'pages/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // https://flutter.dev/docs/cookbook/design/themes
      theme: ThemeData.dark().copyWith(
        // 沒有定義以外的東西，都是用ThemeData所定義的東西
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        accentColor: Colors.red,
      ),
      // home跟initialRoute不能同時並存
      home: InputPage(),
    );
  }
}
