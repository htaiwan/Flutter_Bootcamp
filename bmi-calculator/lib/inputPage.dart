import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'gender_card.dart';
import 'reusable_card.dart';

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
  int height = 170;
  int weight = 75;
  int age = 40;

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
                          ? kActiveCardColor
                          : kInActiveCardColor,
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
                          ? kActiveCardColor
                          : kInActiveCardColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: kInActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '身高',
                      style: kSmallTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // 注意Alignment的使用方式，要搭配textBaseline
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kBigTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kSmallTextStyle,
                        ),
                      ],
                    ),
                    /*
                    利用SliderTheme替Slider產生更多客製化的style,
                    利用SliderTheme.of(context).copyWith替SliderTheme參數給予default,
                    只需針對想要改變進行調整
                     */
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB155),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30)),
                      child: Slider(
                        value: height.toDouble(),
                        max: 250,
                        min: 120,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        children: <Widget>[
                          Text(
                            '體重',
                            style: kSmallTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kBigTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // 客製化自己的button
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      color: kInActiveCardColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        children: <Widget>[
                          Text(
                            '年紀',
                            style: kSmallTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kBigTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                      color: kInActiveCardColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: kBottomContainerHeight,
            ),
          ],
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPress});

  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    // RawMaterialButton比FloatingButton有更多客製化的空間
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
