
// import 'package:flutter/material.dart';

// Widget appButton(
//     BuildContext context,
//     String title,
//     double _width,
//     double _height,
//     Color bgColor,
//     //Color borderColor,
//     Color textColor,
//     double fontSize,
//     double circular,
//     bool isSelected,
//     {VoidCallback? onTap}) {
//   return Container(
//     width: _width,
//     height: _height,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.all(
//         Radius.circular(16.0),
//       ),
//     ),
//     child: Container(
//       margin: EdgeInsets.only(bottom: 5),
//       height: _height,
//       decoration: BoxDecoration(
//         color: isSelected == true ? THEME_COLOR : bgColor,
//         borderRadius: BorderRadius.all(
//           Radius.circular(12.0),
//         ),
//       ),
//       child: TextButton(
//         onPressed: onTap,
//         child: AppBoldFont(
//             msg: title,
//             color: isSelected == true ? WHITE_COLOR : textColor,
//             fontSize: fontSize,
//             textAlign: TextAlign.center),
//       ),
//     ),
//   );
// }

// Widget backButton({required VoidCallback onTap}) {
//   return Container(
//     margin: EdgeInsets.only(left: 20, bottom: 5),
//     height: 53,
//     width: 120,
//     child: ElevatedButton.icon(
//         onPressed: onTap,
//         icon: Icon(
//           Icons.arrow_back,
//           color: APP_TEXT_COLOR,
//         ),
//         //icon data for elevated button
//         label: AppMediumFont(msg: 'Back', fontSize: 17, color: APP_TEXT_COLOR),
//         //label text
//         style: ElevatedButton.styleFrom(
//           primary: WHITE_COLOR,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15.0),
//           ),
//         )),
//   );
// }

// Widget appTextButton(
//     BuildContext context,
//     String title,
//     Alignment alignment,
//     Color textColor,
//     double fontSize,
//     bool type, {
//       VoidCallback? onPressed,
//     }) {
//   return Container(
//       alignment: alignment,
//       child: TextButton(
//           child: type == true
//               ? AppMediumFont(
//               msg: title,
//               color: textColor,
//               fontSize: fontSize,
//               textAlign: TextAlign.center)
//               : AppMediumFont(
//               msg: title,
//               color: textColor,
//               fontSize: fontSize,
//               textAlign: TextAlign.center),
//           onPressed: onPressed));
// }

// Widget socialNetworkButton(String image, GestureTapCallback? ontap) {
//   return GestureDetector(
//     onTap: ontap,
//     child: Image(
//       image: AssetImage(image),
//       fit: BoxFit.fill,
//       height: 70,
//       width: 165,
//     ),
//   );
// }
