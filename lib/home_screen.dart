import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int heightSlider = 120;
  int age = 18;
  int weight = 45;
  Color maleColor = Color(0xff033e66);
  Color femaleColor = Color(0xff033e66);

  CalculateBMI() {
    var heightInUnit = heightSlider / 100;
    var weightInUnit = weight;
    var bmi = weightInUnit / (heightInUnit * heightInUnit);
    print("BMI: ${bmi.round()}");
    return bmi.round();
  }

  void selectGender(bool gender) {
    if (gender) {
      maleColor = blueColor;
      femaleColor = selectedColor;
    } else {
      maleColor = selectedColor;
      femaleColor = blueColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlueColour,
      appBar: AppBar(
          title: Text(
            "BMI Calculator",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: darkBlueColour),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectGender(true);
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: maleColor,
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.male,
                              color: Colors.white,
                              size: 120,
                            ),
                            Text("Male", style: textStyle)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectGender(false);
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: femaleColor,
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.female,
                              color: Colors.white,
                              size: 120,
                            ),
                            Text("Female", style: textStyle)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: blueColor,
                ),
                child: Column(
                  children: [
                    Text("Height", style: textStyle),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "$heightSlider",
                          style: textStyle,
                        ),
                        Text(
                          " cm",
                          style: textStyle,
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Slider(
                      min: 100,
                      max: 220,
                      activeColor: Colors.blue,
                      value: heightSlider.toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          heightSlider = value.toInt();
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: blueColor,
                      ),
                      child: Column(
                        children: [
                          Text("AGE", style: textStyle),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RoundButton(
                                  icon: Icons.exposure_minus_1,
                                  onPressed: () {
                                    setState(() {
                                      if (age > 0) {
                                        age--;
                                      }
                                    });
                                  }),
                              Text(
                                "$age",
                                style: textStyle,
                              ),
                              RoundButton(
                                  icon: Icons.plus_one,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: blueColor,
                      ),
                      child: Column(
                        children: [
                          Text("Weight", style: textStyle),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RoundButton(
                                  icon: Icons.exposure_minus_1,
                                  onPressed: () {
                                    setState(() {
                                      if (weight > 0) {
                                        weight--;
                                      }
                                    });
                                  }),
                              Text(
                                "$weight",
                                style: textStyle,
                              ),
                              RoundButton(
                                  icon: Icons.plus_one,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                var bmi = CalculateBMI();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultScreen(
                              result: bmi,
                            )));
              },
              child: Container(
                height: 50,
                margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.pink,
                ),
                child: Center(
                  child: Text("Calculate BMI",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  const RoundButton({super.key, required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: onPressed,
        constraints: BoxConstraints(minWidth: 36.0, minHeight: 36.0),
        shape: CircleBorder(),
        fillColor: selectedColor,
        child: Icon(
          icon,
          color: Colors.white,
        ));
  }
}
