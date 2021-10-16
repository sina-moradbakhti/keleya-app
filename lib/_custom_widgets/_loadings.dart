import 'package:flutter/material.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';

class MyLoadings {
  static Widget ballPalse({double? size, Color? color}) {
    return Loading(
        color: color ?? Colors.black,
        indicator: BallPulseIndicator(),
        size: size ?? 25);
  }
}
