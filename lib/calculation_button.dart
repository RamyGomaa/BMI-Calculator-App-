import 'package:flutter/material.dart';
import 'constant.dart';

class CalculateButton extends StatelessWidget {
  final String label;
  final Function onTap;
  CalculateButton({@required this.label, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 70,
        color: kCalculateButton,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kCardIconColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
