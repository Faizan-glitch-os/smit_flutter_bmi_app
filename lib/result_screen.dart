import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smit_flutter_bmi_app/bottom_button_widget.dart';
import 'package:smit_flutter_bmi_app/constants.dart';
import 'package:smit_flutter_bmi_app/main_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key,
      required this.title,
      required this.message,
      required this.titleColor,
      required this.result});

  final String title;
  final String message;
  final Color titleColor;
  final double result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background2,
      appBar: AppBar(
        backgroundColor: background1,
        foregroundColor: Colors.white,
        title: Text(
          'Your Result',
          style: TextStyle(fontSize: 30.sp),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                  color: containerInActive,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 20.sp, color: titleColor),
                  ),
                  Text(
                    result.toStringAsFixed(2),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    message,
                    style: TextStyle(fontSize: 20.sp, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          BottomButtonWidget(
            title: 'Re-calculate',
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return MainScreen();
              }));
            },
          ),
        ],
      ),
    );
  }
}
