import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smit_flutter_bmi_app/constants.dart';
import 'package:smit_flutter_bmi_app/weight_and_age_container_widget.dart';

import 'gender_container_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
                  child: GenderContainerWidget(
                    genderIcon: Icons.male,
                    gender: 'MALE',
                  ),
                ),
                Expanded(
                  child: GenderContainerWidget(
                    genderIcon: Icons.female,
                    gender: 'FEMALE',
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
              child: Text('slider'),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: WeightAndAgeContainerWidget(
                    title: 'WEIGHT',
                    number: 20,
                  ),
                ),
                Expanded(
                  child: WeightAndAgeContainerWidget(
                    title: 'AGE',
                    number: 50,
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
