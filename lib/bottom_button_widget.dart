import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smit_flutter_bmi_app/result_screen.dart';

import 'constants.dart';

class BottomButtonWidget extends StatelessWidget {
  const BottomButtonWidget(
      {super.key, required this.title, required this.onTap});

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().screenWidth,
      child: ElevatedButton(
          style: ButtonStyle(
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0))),
              backgroundColor: WidgetStateProperty.all(accentColor),
              foregroundColor: WidgetStateProperty.all(Colors.white)),
          onPressed: onTap,
          child: Text(title)),
    );
  }
}
