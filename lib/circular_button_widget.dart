import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants.dart';

class CircularButtonWidget extends StatelessWidget {
  const CircularButtonWidget(
      {super.key, required this.icon, required this.onPress});

  final IconData icon;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(circularButton),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          shape: WidgetStateProperty.all(const CircleBorder())),
      onPressed: onPress,
      child: Icon(
        icon,
        size: 25.r,
      ),
    );
  }
}
