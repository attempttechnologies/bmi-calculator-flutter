import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Results',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: ReusableCard(
                  color: kActiveColor,
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        this.resultText.toUpperCase(),
                        style: kResultTextStyle,
                      ),
                      Text(
                        this.bmiResult,
                        style: kBMITextStyle,
                      ),
                      Text(
                        this.interpretation,
                        textAlign: TextAlign.center,
                        style: kBodyTextStyle,
                      )
                    ],
                  ),
                ),
              ),
            ),
            new BottomButton(
              buttonTitle: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
  }
}
