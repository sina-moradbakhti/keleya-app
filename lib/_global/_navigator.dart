import 'package:flutter/material.dart';

class CustomNavigator {
  static final current = new GlobalKey<NavigatorState>();

  static void pushedTo({required String route, var args}) {
    CustomNavigator.current.currentState?.pushNamed(route, arguments: args);
  }

  static void pop() {
    if (CustomNavigator.current.currentState!.canPop())
      CustomNavigator.current.currentState!.pop();
  }

  static void changeTo({required String route, var args}) {
    CustomNavigator.current.currentState
        ?.pushNamedAndRemoveUntil(route, (route) => false, arguments: args);
  }
}
