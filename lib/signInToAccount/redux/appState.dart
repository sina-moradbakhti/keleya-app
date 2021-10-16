import 'package:flutter/material.dart';

class AppState {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  bool showPassword = false;
  bool isLoading = false;

  AppState();

  AppState.fromAppState(AppState another) {
    this.txtEmail = another.txtEmail;
    this.txtPassword = another.txtPassword;
    this.isLoading = another.isLoading;
    this.showPassword = another.showPassword;
  }
}
