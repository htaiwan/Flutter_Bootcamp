import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'gender_card.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inActiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

enum GenderType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender;

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
                      onTap: () {
                        setState(() {
                          selectedGender = GenderType.male;
                        });
                      },
                      cardChild: GenderCard(
                        icon: FontAwesomeIcons.mars,
                        title: "男生",
                      ),
                      color: selectedGender == GenderType.male
                          ? activeCardColor
                          : inActiveCardColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onTap: () {
                        setState(() {
                          selectedGender = GenderType.female;
                        });
                      },
                      cardChild: GenderCard(
                        icon: FontAwesomeIcons.venus,
                        title: "女生",
                      ),
                      color: selectedGender == GenderType.female
                          ? activeCardColor
                          : inActiveCardColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: inActiveCardColor,
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      color: inActiveCardColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: inActiveCardColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: bottomContainerColor,
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
