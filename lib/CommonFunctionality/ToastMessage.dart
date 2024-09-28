import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Resources/ColorConstants.dart';
import '../Resources/TextFontConstants.dart';

class ToastMessage {
 

  static void message(String? message) {
    Fluttertoast.showToast(
      msg: message!,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
}

Widget customToast(String? msg) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      padding: const EdgeInsets.only(left: 15),
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0), color: TOAST_BG_COLOR),
      child: Row(
        children: [
          // Image.asset(
          //   AssetsConstants.logo,
          //   height: 22,
          //   width: 22,
          // ),
          const SizedBox(
            width: 10,
          ),
          AppMediumFont(msg: msg, color: TOAST_TEXT_COLOR, fontSize: 15)
        ],
      ),
    ),
  );
}
}