import 'package:flutter/material.dart';
import 'package:keleya/_global/_navigator.dart';

class MySnackBar {
  static void snack({required String message, TextStyle? messageStyle}) {
    final snackBar = (messageStyle != null)
        ? SnackBar(content: Text(message, style: messageStyle))
        : SnackBar(content: Text(message));
    ScaffoldMessenger.of(CustomNavigator.current.currentContext!)
        .showSnackBar(snackBar);
  }
}
