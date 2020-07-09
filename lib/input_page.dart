import 'package:bmi_calculator/calculation_brain.dart';
import 'package:flutter/material.dart';
import 'result_page.dart';
import 'calculation_button.dart';
import 'reusable_card.dart';
import 'constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'calculation_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double userHight = 180;
  Gender gender;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    //checks if the card is selected then returns the right color for the Label
    TextStyle correctGenderLabelColor(Gender selectedGender) {
      TextStyle tStyle;
      gender == selectedGender
          ? tStyle = kTextStyle
          : tStyle = kTextStyle.copyWith(
              color: kCardIconColor.withAlpha(28),
            );

      return tStyle;
    }

    // checks if the card is selected then returns the right color for the Card
    Color colorOfCard(Gender selectedGender) {
      Color color;
      gender == selectedGender
          ? color = kActiveCardColor
          : color = kNotActiveCardColor;

      return color;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ReusableCard(
                    onTap: () {
                      setState(
                        () {
                          gender = Gender.male;
                        },
                      );
                    },
                    clr: colorOfCard(Gender.male),
                    child: ReusableCardChild(
                      icon: FontAwesomeIcons.mars,
                      label: "male",
                      style: correctGenderLabelColor(Gender.male),
                    ),
                  ),
                  ReusableCard(
                    onTap: () {
                      setState(
                        () {
                          gender = Gender.female;
                        },
                      );
                    },
                    clr: colorOfCard(Gender.female),
                    child: ReusableCardChild(
                      icon: FontAwesomeIcons.venus,
                      label: "femal",
                      style: correctGenderLabelColor(Gender.female),
                    ),
                  ),
                ],
              ),
            ),
            ReusableCard(
              clr: kActiveCardColor,
              child: heightCardChild(),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  ReusableCard(
                    clr: kActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "weight".toUpperCase(),
                          style: kTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          textDirection: TextDirection.ltr,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: CircularButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(
                                    () {
                                      weight++;
                                    },
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              child: CircularButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(
                                    () {
                                      weight > 0 ? weight-- : weight = weight;
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  ReusableCard(
                    clr: kActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "AGE".toUpperCase(),
                          style: kTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          textDirection: TextDirection.ltr,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: CircularButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(
                                    () {
                                      age++;
                                    },
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              child: CircularButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(
                                    () {
                                      age > 0 ? age-- : age = age;
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CalculateButton(
              label: "Calculate",
              onTap: () {
                final calculator = CalculationBrain(
                    height: this.userHight, weight: this.weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            calculate: calculator,
                          )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Column heightCardChild() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "HEIGHT",
          style: kTextStyle,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              userHight.toString(),
              style: kNumberStyle,
            ),
            Text("CM"),
          ],
        ),
        Slider(
          min: 100,
          max: 250,
          divisions: 300,
          value: userHight.toDouble(),
          onChanged: (double newValue) {
            setState(
              () {
                userHight = newValue;
              },
            );
          },
        )
      ],
    );
  }
}

class BottomCards extends StatefulWidget {
  BottomCards({
    Key key,
    @required this.weight,
    @required this.label,
  }) : super(key: key);

  int weight = 50;
  String label = "default";

  @override
  _BottomCardsState createState() => _BottomCardsState();
}

class _BottomCardsState extends State<BottomCards> {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}

class CircularButton extends StatelessWidget {
  CircularButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: kScaffoldColor,
      padding: EdgeInsets.all(10),
      child: Icon(icon),
      shape: CircleBorder(),
    );
  }
}
