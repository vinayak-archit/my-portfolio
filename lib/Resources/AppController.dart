import 'package:flutter/material.dart';

final appController = Appcontroller();

class Appcontroller {
  static final Appcontroller _singleton = Appcontroller._internal();

  Appcontroller._internal() {}

  factory Appcontroller() {
    return _singleton;
  }
  
  ThemeMode themeMode = ThemeMode.system;
}
