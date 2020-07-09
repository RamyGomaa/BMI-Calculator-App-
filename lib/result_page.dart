import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'calculation_button.dart';
import 'constant.dart';
import 'calculation_brain.dart';

class ResultPage extends StatelessWidget {
  CalculationBrain calculate;
  ResultPage({this.calculate});

  @override
  Widget build(BuildContext context) {
    String bmi = calculate.getBMI().toStringAsFixed(1);
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
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Your Result",
                  textAlign: TextAlign.center,
                  style: kNumberStyle,
                ),
              ),
            ),
            ReusableCard(
              flex: 6,
              clr: kActiveCardColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    calculate.getType(),
                    style: checkColor(calculate.getType()),
                  ),
                  Text(
                    bmi,
                    style: kNumberStyle.copyWith(fontSize: 80),
                  ),
                  Text(
                    calculate.getInterpretation(),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            CalculateButton(
              label: "Re-Calculate",
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  TextStyle checkColor(String type) {
    Color selectedColor;
    type == "Normal"
        ? selectedColor = kSliderColor
        : selectedColor = Colors.red[600];
    return kTextStyle.copyWith(
      color: selectedColor,
    );
  }
}
