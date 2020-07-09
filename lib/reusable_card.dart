import 'package:flutter/material.dart';
import 'constant.dart';

class ReusableCardChild extends StatelessWidget {
  final IconData icon;
  final String label;
  final TextStyle style;
  ReusableCardChild({this.icon, this.label, this.style});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          this.icon,
          size: 50,
          color: kCardIconColor,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          label.toUpperCase(),
          style: style,
        ),
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Widget child;
  final Color clr;
  final Function onTap;
  int flex = 1;
  ReusableCard({@required this.clr, this.child, this.onTap, this.flex});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: this.flex == null ? 1 : this.flex,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: clr,
              borderRadius: BorderRadius.circular(10),
            ),
            child: child),
      ),
    );
  }
}
