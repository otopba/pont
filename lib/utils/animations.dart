import 'package:flutter/material.dart';

abstract class Animations {
  static const duration = Duration(milliseconds: 300);
  static const shortDuration = Duration(milliseconds: 150);
  static const appearCurve = Curves.easeInCubic;
  static const disappearCurve = Curves.easeOutCubic;
  static const onScreenCurve = Curves.easeInOutCubic;
}
