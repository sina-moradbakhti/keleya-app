import 'package:flutter/material.dart';

class AppState {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtPasswordRepeat = TextEditingController();

  bool privacyPolicyChecked = false;
  bool termsConditionChecked = false;

  bool showPassword = false;
  bool showPasswordRepeat = false;
  bool isLoading = false;

  AppState();

  AppState.fromAppState(AppState another) {
    this.privacyPolicyChecked = another.privacyPolicyChecked;
    this.termsConditionChecked = another.termsConditionChecked;
    this.txtEmail = another.txtEmail;
    this.txtPassword = another.txtPassword;
    this.txtPasswordRepeat = another.txtPasswordRepeat;
    this.isLoading = another.isLoading;
    this.showPassword = another.showPassword;
    this.showPasswordRepeat = another.showPasswordRepeat;
  }
}
