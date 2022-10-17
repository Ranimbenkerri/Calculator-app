import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'numButton.dart';
import '../helpers/Gradient_divider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  var userQuestion = '';
  var userAnswer = '';
  final List<String> button = [
    'C',
    '(',
    ')',
    '⌫',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '*',
    '0',
    '.',
    '=',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff171C22),
        body: Column(
          children: [
            Expanded(

              child: Column(
                children: [
                  SizedBox(height: 50.0,),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(20),
                    child: Text(
                      userQuestion,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(20),
                    child: Text(
                      userAnswer,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const GradientDivider(),
            Expanded(
              flex: 2,
                  child: GridView.builder(
                itemCount: button.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return MyButton(
                        btnText: button[index],
                        buttonTapped: () {
                          setState(() {
                            userQuestion = '';
                            userAnswer = '';
                          });
                        },
                        color: Color(0xff2E3A48));
                  }else if (index == button.length - 2) {
                    return MyButton(
                        btnText: button[index],
                        buttonTapped: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                        color: Color(0xff171C22));
                  }
                  else if (index == 3) {
                    return MyButton(
                        btnText: button[index],
                        buttonTapped: () {
                          setState(() {
                            userQuestion = userQuestion.substring(
                                0, userQuestion.length - 1);
                          });
                        },
                        color: Color(0xff2E3A48));
                  }  else if (index == 1 || index == 2) {
                    return MyButton(
                        btnText: button[index],
                        buttonTapped: () {
                          setState(() {
                            userQuestion += button[index];
                          });
                        },
                        color: Color(0xff2E3A48));
                  } else {
                    return MyButton(
                      btnText: button[index],
                      buttonTapped: () {
                        setState(() {
                          userQuestion += button[index];
                        });
                      },
                      color: isOperator(button[index])
                          ? Color(0xff6344D4)
                          : Color(0xff171C22),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '-' || x == '+' || x == '*' || x == '/') {
      return true;
    } else {
      return false;
    }
  }
  void equalPressed() {
      String finalQuestion = userQuestion;
      try{
        Parser p = Parser();
        Expression exp = p.parse(finalQuestion);
        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, cm);
        userAnswer = eval.toString();
      }catch(e){
          print(e);
      }


  }
}
