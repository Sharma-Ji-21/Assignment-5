import 'package:bmi_calculator/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final result;
  const ResultScreen({super.key, required this.result});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    var name = "normal";
    Color textColor = Colors.white;
    if (widget.result < 18.5) {
      name = "underweight";
      textColor = Colors.blue;
    } else if (widget.result >= 18.5 && widget.result < 24.9) {
      name = "normal";
      textColor = Colors.green;
    } else if (widget.result >= 25 && widget.result < 29.9) {
      name = "overweight";
      textColor = Colors.yellow;
    } else if (widget.result >= 30) {
      name = "obese";
      textColor = Colors.orange;
    }
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: darkBlueColour,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Container(
          color: darkBlueColour,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: blueColor,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                width: width,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your BMI value is",
                      style: textStyle,
                    ),
                    Text(
                      "${widget.result}",
                      style: textStyle,
                    ),
                    Text(
                      "${name.toUpperCase()}",
                      style: textStyle.copyWith(color: textColor),
                    )
                  ],
                ),
              ),
              Image(
                image: AssetImage('images/${name}.png'),
                height: height * 0.6,
              )
            ],
          ),
        ));
  }
}

// Center(
// child: Text(
// "${widget.result}",
// style: TextStyle(
// fontSize: 40,
// color: Colors.red,
// fontWeight: FontWeight.bold,
// ),
// ))
