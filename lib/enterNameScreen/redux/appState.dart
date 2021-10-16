import 'package:flutter/material.dart';

class AppState {
  TextEditingController txtName = TextEditingController();

  AppState();

  AppState.fromAppState(AppState another) {
    this.txtName = another.txtName;
  }
}
