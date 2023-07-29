import 'dart:io';
import 'package:flutter/material.dart';

import '../Resources/ColorConstants.dart';
import '../Resources/ScreenHeightWidth.dart';
import '../Resources/StringConstants.dart';
import '../Resources/TextFontConstants.dart';


Widget AppCommonButton(BuildContext context, String title, double _width,
    double _height, Color textColor, double fontSize,
    // double circular,
    // bool isSelected,
    {VoidCallback? onTap}) {
  return Container(
    height: _height,
    alignment: Alignment.center,
    width: _width,
    decoration: const BoxDecoration(
     // color: THEME_COLOR,
      gradient: LinearGradient(
          colors: <Color>[LEFT_GRADIENT_COLOR, RIGHT_GRADIENT_COLOR]),
      borderRadius: BorderRadius.all(
        Radius.circular(12.0),
      ),
    ),
    child: AppBoldFont(msg: title, fontSize: fontSize, color: textColor),
  );
}

Widget socialNetworkButton(String image, bool scan, GestureTapCallback? ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: 60,
      decoration: colorDecoration(15),
      width: scan == true ? 160 : ScreenSize.screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: scan == true ? colorDecoration(12.0) : null,
            child: Image(
              image: AssetImage(image),
              fit: BoxFit.fill,
              height: 30,
              width: 30,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          AppRegularFont(
              msg: scan == true
                  ? "scaQR"
                  : "continueWithGoogle",
              fontSize: 18,
              color: RIGHT_GRADIENT_COLOR,
              ),
        ],
      ),
    ),
  );
}

BoxDecoration colorDecoration(double circular) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(circular),
      border: Border.all(width: 2, color: RIGHT_GRADIENT_COLOR));
}
