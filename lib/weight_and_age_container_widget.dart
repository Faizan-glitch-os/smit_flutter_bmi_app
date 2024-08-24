import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'circular_button_widget.dart';
import 'constants.dart';

class WeightAndAgeContainerWidget extends StatelessWidget {
  const WeightAndAgeContainerWidget(
      {super.key,
      required this.title,
      required this.number,
      required this.increment,
      required this.decrement});

  final String title;
  final int number;
  final Function() increment;
  final Function() decrement;

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
                icon: FontAwesomeIcons.minus,
                onPress: decrement,
              ),
              CircularButtonWiget(
                icon: Icons.add,
                onPress: increment,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
