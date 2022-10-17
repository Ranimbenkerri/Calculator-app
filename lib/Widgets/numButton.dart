
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final String btnText;
  final buttonTapped;
  final Color color;

  const MyButton({required this.btnText,this.buttonTapped,required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(

        padding: EdgeInsets.all(8.0),
        child:  ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                btnText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}
