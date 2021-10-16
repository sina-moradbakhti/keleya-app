import 'package:flutter/material.dart';

class CustomEdges {
  static const EdgeInsets rightLeftPrimary =
      EdgeInsets.only(left: 16, right: 16);
  static const EdgeInsets rightLeftSecondary =
      EdgeInsets.only(left: 24, right: 24);
  static const EdgeInsets rightLeftLarge = EdgeInsets.only(left: 32, right: 32);
  static const EdgeInsets rightLeftVeryLarge = EdgeInsets.only(left: 52, right: 52);
  static const EdgeInsets large = EdgeInsets.all(32);
  static const EdgeInsets medium = EdgeInsets.all(20);

  static const EdgeInsets title0 =
      EdgeInsets.only(left: 32, right: 32, top: 42, bottom: 32);
      static const EdgeInsets textfield =
      EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 4);
      static const EdgeInsets textfieldNoLabel =
      EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8);

      static SizedBox vSeparator = SizedBox(height: 10);
      static SizedBox vSeparator2x = SizedBox(height: 20);
      static SizedBox vSeparator3x = SizedBox(height: 30);
      static SizedBox vSeparator6x = SizedBox(height: 60);
      static SizedBox hSeparator = SizedBox(width: 10);
      static SizedBox hSeparator2x = SizedBox(width: 20);
      static SizedBox hSeparator3x = SizedBox(width: 30);
      static SizedBox hSeparator6x = SizedBox(width: 60);
}
