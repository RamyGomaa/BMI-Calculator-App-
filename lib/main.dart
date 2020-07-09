import 'package:flutter/material.dart';
import 'constant.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: kActiveCardColor,
        accentColor: kSliderColor,
        scaffoldBackgroundColor: kScaffoldColor,
        appBarTheme: AppBarTheme(
          color: kActiveCardColor,
        ),
        sliderTheme: SliderThemeData(
          activeTrackColor: kCardIconColor,
          inactiveTrackColor: kScaffoldColor,
          thumbColor: Color(0xFF9EBC9F),
          overlayColor: Color(0x559EBC9F),
        ),
      ),
      home: InputPage(),
    );
  }
}
