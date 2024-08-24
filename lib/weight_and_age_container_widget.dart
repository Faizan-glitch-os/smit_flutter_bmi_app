import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'circular_button_widget.dart';
import 'constants.dart';

class WeightAndAgeContainerWidget extends StatelessWidget {
  const WeightAndAgeContainerWidget(
      {super.key, required this.title, required this.number});

  final String title;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
          color: containerInActive, borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(color: circularButton, fontSize: 15.sp),
          ),
          Text(
            number.toString(),
            style: TextStyle(
                color: Colors.white,
                fontSize: 30.sp,
                fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularButtonWiget(
                icon: Icons.add,
              ),
              CircularButtonWiget(
                icon: Icons.minus,
              )
            ],
          ),
        ],
      ),
    );
  }
}
