import 'package:flutter/cupertino.dart';

class ScreenSize {
  static MediaQueryData? _mediaQuery;
  static double? screenWidth;
  static double? screenHeight;
  static double? screenHorizontal;
  static double? screenVertical;

  static double? _Horizontal;
  static double? _Vertical;
  static double? Horizontal;
  static double? Vertical;

  void init(BuildContext context) {
    _mediaQuery = MediaQuery.of(context);
    screenWidth = _mediaQuery!.size.width;
    screenHeight = _mediaQuery!.size.height;
    screenHorizontal = screenWidth! / 100;
    screenVertical = screenHeight! / 100;

    _Horizontal = _mediaQuery!.padding.left +
        _mediaQuery!.padding.right;
    _Vertical = _mediaQuery!.padding.top +
        _mediaQuery!.padding.bottom;
    Horizontal = (screenWidth! -
        _Horizontal!) / 100;
    Vertical = (screenHeight! -
        _Vertical!) / 100;
  }
}