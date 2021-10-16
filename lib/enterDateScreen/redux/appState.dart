import 'package:flutter/material.dart';

class AppState {
  TextEditingController txtBabyBirthDate = TextEditingController();
  DateTime? selectedDate;
  String _name = '';
  String get name => _name;
  setName(name) => _name = name;

  AppState({String? name}) {
    if (name != null) setName(name);
  }

  AppState.fromAppState(AppState another) {
    this.txtBabyBirthDate = another.txtBabyBirthDate;
    this.selectedDate = another.selectedDate;
    this._name = another._name;
  }
}
