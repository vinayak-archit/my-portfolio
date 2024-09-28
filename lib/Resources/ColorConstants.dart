// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import "package:flutter/material.dart";

// Define colors based on the current theme mode
Color getThemeColor(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark
      ? Color.fromRGBO(33, 36, 40, 0.87)
      : Color(0xfff9f9f9);
}

Color getTextColor(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark
      ? Color(0xfff9f9f9)
      : Color.fromRGBO(33, 36, 40, 0.87);
}

Color getWhiteColorLight(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark
      ? Color.fromARGB(255, 199, 196, 196)
      : Color.fromRGBO(33, 36, 40, 0.87);
}

const PINK_COLOR = Color.fromRGBO(255, 1, 79, 1);

const RED_COLOR = Color(0xfff20a0a);

const BLACK_COLOR = Color(0xff2e2e2e);
