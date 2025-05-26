import 'dart:async';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomSwitch extends StatelessWidget {
  CustomSwitch({
    super.key,
    required this.icon1,
    required this.icon2,
    this.isColored = false,
    required this.onChange,
    required this.selected,
  });
  final String icon1;
  final String icon2;
  bool isColored;
  final int selected;
  FutureOr<void> Function(int) onChange;

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<int>.rolling(
      current: selected,
      values: [0, 1],
      iconList: [
        Image.asset(
          icon1,
          width: 35,
          height: 35,
          color:
              isColored
                  ? selected == 0
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.primary
                  : null,
          colorBlendMode: BlendMode.srcIn,
        ),
        Image.asset(
          icon2,
          width: 35.w,
          height: 35.h,
          color:
              isColored
                  ? selected == 1
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.primary
                  : null,
          colorBlendMode: BlendMode.srcIn,
        ),
      ],
      iconOpacity: 1,
      inactiveOpacity: 1,

      style: ToggleStyle(
        borderColor: Theme.of(context).colorScheme.primary,
        indicatorColor: Theme.of(context).colorScheme.primary,
      ),

      onChanged: onChange,
    );
  }
}
