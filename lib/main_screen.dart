import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smit_flutter_bmi_app/constants.dart';
import 'package:smit_flutter_bmi_app/result_screen.dart';
import 'package:smit_flutter_bmi_app/weight_and_age_container_widget.dart';

import 'bottom_button_widget.dart';
import 'gender_container_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double height = 5.0;
  int weight = 50;
  int age = 30;
  double result = 0;

  String title = 'NORMAL';
  String message = 'Nothing';
  Color titleColor = Colors.white;

  Color maleContainerColor = containerInActive;
  Color femaleContainerColor = containerInActive;

  void ContainerColor(String gender) {
    if (gender == 'Male' && femaleContainerColor == containerInActive) {
      if (maleContainerColor == containerActive) {
        setState(() {
          maleContainerColor = containerInActive;
        });
      } else {
        setState(() {
          maleContainerColor = containerActive;
        });
      }
    } else if (gender == 'Female' && maleContainerColor == containerInActive) {
      if (femaleContainerColor == containerActive) {
        setState(() {
          femaleContainerColor = containerInActive;
        });
      } else {
        setState(() {
          femaleContainerColor = containerActive;
        });
      }
    }
  }

  void IncrementWeight() {
    setState(() {
      weight++;
    });
  }

  void DecrementWeight() {
    setState(() {
      weight--;
    });
  }

  void IncrementAge() {
    setState(() {
      age++;
    });
  }

  void DecrementAge() {
    setState(() {
      age--;
    });
  }

  void calculateResult() {
    double heightInMeter = height * 0.3048;

    double heightSquare = heightInMeter * heightInMeter;

    result = weight / heightSquare;

    if (result < 20) {
      titleColor = Colors.red;
      title = 'UNDERWEIGHT';
      message =
          'Danger, your BMI is very low, please take a good diet to improve your BMI';
    } else if (result > 20 && result < 26) {
      titleColor = Colors.green;
      title = 'NORMAL';
      message = 'Great, your BMI is normal, keep it up';
    } else if (result > 25 && result < 30) {
      titleColor = Colors.redAccent;
      title = 'OVERWEIGHT';
      message =
          'Danger, BMI is too high, please control your diet and do some exercise';
    } else if (result > 20 && result < 26) {
      titleColor = Colors.red;
      title = 'OBESE';
      message =
          'Danger, BMI is too high, please control your diet and do some exercise';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background1,
      appBar: AppBar(
        backgroundColor: background2,
        foregroundColor: Colors.white,
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10.r),
                    onTap: () {
                      ContainerColor('Male');
                    },
                    child: GenderContainerWidget(
                      genderIcon: Icons.male,
                      gender: 'MALE',
                      containerColor: maleContainerColor,
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10.r),
                    onTap: () {
                      ContainerColor('Female');
                    },
                    child: GenderContainerWidget(
                      genderIcon: Icons.female,
                      gender: 'FEMALE',
                      containerColor: femaleContainerColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10.h),
              width: ScreenUtil().screenWidth,
              decoration: BoxDecoration(
                  color: containerInActive,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(color: circularButton),
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: height.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: 'Foot(s)', style: TextStyle(fontSize: 10.sp))
                  ])),
                  Slider(
                      value: height.toDouble(),
                      min: 0.0,
                      max: 10.0,
                      activeColor: accentColor,
                      overlayColor:
                          WidgetStateProperty.all(accentColor.withOpacity(.2)),
                      onChanged: (value) {
                        setState(() {
                          height = double.parse(value.toStringAsFixed(2));
                        });
                      })
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: WeightAndAgeContainerWidget(
                    title: 'WEIGHT',
                    number: weight,
                    increment: IncrementWeight,
                    decrement: DecrementWeight,
                  ),
                ),
                Expanded(
                  child: WeightAndAgeContainerWidget(
                    title: 'AGE',
                    number: age,
                    increment: IncrementAge,
                    decrement: DecrementAge,
                  ),
                )
              ],
            ),
          ),
          BottomButtonWidget(
            title: 'Calculate',
            onTap: () {
              calculateResult();
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultScreen(
                  title: title,
                  message: message,
                  titleColor: titleColor,
                  result: result,
                );
              }));
            },
          ),
        ],
      ),
    );
  }
}
