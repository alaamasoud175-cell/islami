import 'dart:math';

import 'package:basics/calculator/calculator_button.dart';
import 'package:basics/calculator/calculator_colors.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  static const String routeName = "calculator";

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String restext = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CalculatorColors.blackColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  restext,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: CalculatorColors.whiteColor,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  spacing: 12,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              spacing: 18,
                              children: [
                                CalculatorButton(
                                  text: "Ac",
                                  onButtonClick: onClearClick,
                                  backgroundColor:
                                      CalculatorColors.lightGreyColor,
                                  textColor: CalculatorColors.whiteColor,
                                ),
                                CalculatorButton(
                                  text: "<",
                                  isIcon: true,
                                  onButtonClick: onBackSpaceClick,
                                  child: Icon(
                                    Icons.backspace_outlined,
                                    color: CalculatorColors.whiteColor,
                                  ),
                                  backgroundColor:
                                      CalculatorColors.lightGreyColor,
                                  textColor: CalculatorColors.whiteColor,
                                ),
                                CalculatorButton(
                                  text: "/",
                                  onButtonClick: onDigitClick,
                                  backgroundColor:
                                      CalculatorColors.darkBlueColor,
                                  textColor: CalculatorColors.whiteColor,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              spacing: 18,
                              children: [
                                CalculatorButton(
                                  text: "7",
                                  onButtonClick: onDigitClick,
                                ),

                                CalculatorButton(
                                  text: "8",
                                  onButtonClick: onDigitClick,
                                ),
                                CalculatorButton(
                                  text: "9",
                                  onButtonClick: onDigitClick,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              spacing: 18,
                              children: [
                                CalculatorButton(
                                  text: "4",
                                  onButtonClick: onDigitClick,
                                ),
                                CalculatorButton(
                                  text: "5",
                                  onButtonClick: onDigitClick,
                                ),
                                CalculatorButton(
                                  text: "6",
                                  onButtonClick: onDigitClick,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              spacing: 18,
                              children: [
                                CalculatorButton(
                                  text: "1",
                                  onButtonClick: onDigitClick,
                                ),

                                CalculatorButton(
                                  text: "2",
                                  onButtonClick: onDigitClick,
                                ),
                                CalculatorButton(
                                  text: "3",
                                  onButtonClick: onDigitClick,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              spacing: 18,
                              children: [
                                CalculatorButton(
                                  text: "0",
                                  flex: 2,
                                  onButtonClick: onDigitClick,
                                ),
                                CalculatorButton(
                                  text: ".",
                                  onButtonClick: onDigitClick,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            CalculatorButton(
                              text: "*",
                              flex: 2,
                              onButtonClick: onOperatorClick,
                              backgroundColor: CalculatorColors.darkBlueColor,
                              textColor: CalculatorColors.whiteColor,
                            ),
                            CalculatorButton(
                              text: "%",
                              flex: 2,
                              onButtonClick: onOperatorClick,
                              backgroundColor: CalculatorColors.darkBlueColor,
                              textColor: CalculatorColors.whiteColor,
                            ),
                            CalculatorButton(
                              text: "^",
                              flex: 2,
                              onButtonClick: onOperatorClick,
                              backgroundColor: CalculatorColors.darkBlueColor,
                              textColor: CalculatorColors.whiteColor,
                            ),
                            CalculatorButton(
                              text: "-",
                              flex: 2,
                              onButtonClick: onOperatorClick,
                              backgroundColor: CalculatorColors.darkBlueColor,
                              textColor: CalculatorColors.whiteColor,
                            ),
                            CalculatorButton(
                              text: "+",
                              flex: 2,
                              onButtonClick: onOperatorClick,
                              backgroundColor: CalculatorColors.darkBlueColor,
                              textColor: CalculatorColors.whiteColor,
                            ),
                            CalculatorButton(
                              text: "=",
                              flex: 2,
                              onButtonClick: onEqualClick,
                              backgroundColor: CalculatorColors.lightBlueColor,
                              textColor: CalculatorColors.whiteColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onDigitClick(String text) {
    if (text == "." && restext.contains(".")) {
      return;
    }
    restext += text;
    setState(() {});
  }

  String lhs = "";
  String operator = "";

  void onOperatorClick(String clickedOperator) {
    if (operator.isEmpty) {
      lhs = restext;
    } else {
      String rhs = restext;
      lhs = calculate(lhs, operator, rhs);
    }
    operator = clickedOperator;
    restext = "";
    setState(() {});
  }

  String calculate(String lhs, String operator, String rhs) {
    double num1 = double.parse(lhs);
    double num2 = double.parse(rhs);
    double res = 0.0;
    if (operator == "+") {
      res = num1 + num2;
    } else if (operator == "-") {
      res = num1 - num2;
    } else if (operator == "*") {
      res = num1 * num2;
    } else if (operator == "/") {
      res = num1 / num2;
    } else if (operator == "%") {
      res = num1 % num2;
    } else if (operator == "^") {
      res = pow(num1, num2).toDouble();
    }
    return res.toString();
  }

  void onEqualClick(String text) {
    String rhs = restext;
    restext = calculate(lhs, operator, rhs);
    lhs = "";
    operator = "";
    setState(() {});
  }

  void onClearClick(String text) {
    restext = "";
    lhs = "";
    operator = "";
    setState(() {});
  }

  void onBackSpaceClick(String text) {
    if (restext.isEmpty) {
      return;
    }
    restext = restext.substring(1, restext.length - 1);
    setState(() {});
  }
}
