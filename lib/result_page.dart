import 'package:flutter/material.dart';
import 'constant.dart';
import 'bottom_button.dart';
import 'input_page.dart';
import 'recycle_card.dart';

class ResultPage extends StatelessWidget {
  final String bmi;
  final String result;
  final String inter;

  ResultPage({required this.bmi, required this.inter, required this.result});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: kLableResult,
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: RecycleCard(
                colour: Colors.blueAccent,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      result,
                      style: kLableNormal,
                    ),
                    Text(
                      bmi,
                      style: kLableNumber,
                    ),
                    Text(
                      inter,
                      style: kLableText,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BottomButton(
                  colour: Colors.red,
                  text: const Text(
                    'RE-CALCULATE',
                    style: kLableBottomText,
                  ),
                  onPress: () {
                    Navigator.pop(context);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
