import 'package:flutter/cupertino.dart';
import 'dart:math';

class CalculationBrain {
  String _type;
  double _bmi;
  String _interpretation;
  int weight;
  double height;
  CalculationBrain({@required this.weight, @required this.height});

  String getInterpretation() {
    this._bmi > 25
        ? this._interpretation = "Your BMI is high, why dont you train more ?"
        : this._bmi > 18
            ? this._interpretation =
                "Your BMI is in the healthy range, good luck maintaning that"
            : this._interpretation =
                "Your BMI is low, try to eat at least 3 meals a day";
    return this._interpretation;
  }

  String getType() {
    this._bmi > 25
        ? this._type = "OverWeight"
        : this._bmi > 18 ? this._type = "Normal" : this._type = "Underweight";
    return this._type;
  }

  double getBMI() {
    this._bmi = weight / pow(height / 100, 2);
    print(this.weight);
    print(this.height);
    print(_bmi);
    return this._bmi;
  }
}
