import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'gender_card.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = 0xFF1D1E33;
const bottomContainerColor = 0xFFEB1555;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      cardChild: GenderCard(
                        icon: FontAwesomeIcons.mars,
                        title: "男生",
                      ),
                      color: Color(activeCardColor),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardChild: GenderCard(
                        icon: FontAwesomeIcons.venus,
                        title: "女生",
                      ),
                      color: Color(activeCardColor),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: Color(activeCardColor),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      color: Color(activeCardColor),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: Color(activeCardColor),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Color(bottomContainerColor),
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: bottomContainerHeight,
            ),
          ],
        ),
      ),
    );
  }
}
