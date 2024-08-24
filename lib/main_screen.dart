import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smit_flutter_bmi_app/constants.dart';
import 'package:smit_flutter_bmi_app/weight_and_age_container_widget.dart';

import 'gender_container_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int height = 150;
  int weight = 50;
  int age = 30;
  Color maleContainerColor = containerInActive;
  Color femaleContainerColor = containerInActive;

  void ContainerColor(String gender) {
    if (gender == 'Male') {
      if (maleContainerColor == containerActive) {
        setState(() {
          maleContainerColor = containerInActive;
        });
      } else {
        setState(() {
          maleContainerColor = containerActive;
        });
      }
    } else if (gender == 'Female') {
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
                  Text(
                    height.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Slider(
                      value: height.toDouble(),
                      min: 10,
                      max: 300,
                      activeColor: accentColor,
                      overlayColor:
                          WidgetStateProperty.all(accentColor.withOpacity(.2)),
                      onChanged: (value) {
                        setState(() {
                          height = value.toInt();
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
          SizedBox(
            width: ScreenUtil().screenWidth,
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0))),
                    backgroundColor: WidgetStateProperty.all(accentColor),
                    foregroundColor: WidgetStateProperty.all(Colors.white)),
                onPressed: () {},
                child: Text('Calculate')),
          )
        ],
      ),
    );
  }
}
