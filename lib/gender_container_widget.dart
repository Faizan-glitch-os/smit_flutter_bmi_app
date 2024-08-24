import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants.dart';

class GenderContainerWidget extends StatelessWidget {
  const GenderContainerWidget(
      {super.key,
      required this.genderIcon,
      required this.gender,
      required this.containerColor});

  final IconData genderIcon;
  final String gender;
  final Color containerColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
          color: containerColor, borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            genderIcon,
            color: Colors.white,
            size: 80.r,
          ),
          Text(
            gender,
            style: TextStyle(color: circularButton, fontSize: 20.sp),
          )
        ],
      ),
    );
  }
}
