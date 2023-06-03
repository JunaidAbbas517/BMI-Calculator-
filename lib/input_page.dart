import 'package:bmi/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bottom_button.dart';
import 'constant.dart';
import 'funtionality.dart';
import 'iconData.dart';
import 'recycle_card.dart';

enum GenderType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType? selectedGender;
  int _currentSliderValue = 140;
  int weight = 50;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RecycleCard(
                      onPress: () {
                        setState(() {
                          selectedGender = GenderType.male;
                        });
                      },
                      colour: selectedGender == GenderType.male
                          ? activeColor
                          : inActiveColor,
                      cardChild: IconnData(
                        iconn: FontAwesomeIcons.mars,
                        lable: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: RecycleCard(
                      onPress: () {
                        setState(
                          () {
                            selectedGender = GenderType.female;
                          },
                        );
                      },
                      cardChild: IconnData(
                        iconn: FontAwesomeIcons.venus,
                        lable: 'FEMALE',
                      ),
                      colour: selectedGender == GenderType.female
                          ? activeColor
                          : inActiveColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: RecycleCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'HEIGHT',
                      style: kLableText,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          _currentSliderValue.toString(),
                          style: kLableNumber,
                        ),
                        const Text(
                          'cm',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: _currentSliderValue.toDouble(),
                      min: 120.0,
                      max: 250.0,
                      activeColor: const Color(0xFFEB1555),
                      inactiveColor: const Color(0xFF8D8E98),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value.round();
                        });
                      },
                    ),
                  ],
                ),
                colour: Colors.lightBlue,
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RecycleCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'WEIGHT',
                            style: kLableText,
                          ),
                          Text(
                            weight.toString(),
                            style: kLableNumber,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundButton(
                                onPresss: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                iconss: FontAwesomeIcons.minus,
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              RoundButton(
                                onPresss: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                iconss: FontAwesomeIcons.plus,
                              ),
                            ],
                          )
                        ],
                      ),
                      colour: Colors.lightBlue,
                    ),
                  ),
                  Expanded(
                    child: RecycleCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'AGE',
                            style: kLableText,
                          ),
                          Text(
                            age.toString(),
                            style: kLableNumber,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundButton(
                                onPresss: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                iconss: FontAwesomeIcons.minus,
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              RoundButton(
                                onPresss: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                iconss: FontAwesomeIcons.plus,
                              ),
                            ],
                          )
                        ],
                      ),
                      colour: Colors.lightBlue,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BottomButton(
                colour: bottomButton,
                onPress: () {
                  Funtionality fun =
                      Funtionality(height: _currentSliderValue, weigth: weight);
                  fun.bmi;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ResultPage(
                          bmi: fun.getBmi(),
                          result: fun.getResult(),
                          inter: fun.getInterperation(),
                        );
                      },
                    ),
                  );
                },
                text: const Text(
                  'Calculate',
                  style: kLableBottomText,
                ),
              ),
            )
          ],
        ));
  }
}

class RoundButton extends StatelessWidget {
  final IconData iconss;
  final VoidCallback? onPresss;
  RoundButton({required this.iconss, this.onPresss});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      onPressed: onPresss,
      elevation: 6.0,
      shape: const CircleBorder(),
      fillColor: Colors.red,
      child: Icon(
        iconss,
        color: Colors.black,
      ),
    );
  }
}
