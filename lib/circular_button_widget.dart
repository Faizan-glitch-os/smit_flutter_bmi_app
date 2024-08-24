import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants.dart';

class CircularButtonWiget extends StatelessWidget {
  const CircularButtonWiget({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(circularButton),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          shape: WidgetStateProperty.all(CircleBorder())),
      onPressed: () {},
      child: Icon(
        icon,
        size: 25.r,
      ),
    );
  }
}
