import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Color colour;
  final Widget? text;
  final VoidCallback? onPress;
  BottomButton({required this.colour, this.onPress, this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(80.0)),
        width: double.infinity,
        height: 70.0,
        child: Center(child: text),
      ),
    );
  }
}
