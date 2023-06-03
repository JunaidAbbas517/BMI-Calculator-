import 'package:flutter/material.dart';

class IconnData extends StatelessWidget {
  final IconData iconn;
  final String lable;

  IconnData({required this.iconn, required this.lable});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconn,
          color: Colors.black,
          size: 80.0,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          lable,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.0,
          ),
        ),
      ],
    );
  }
}
