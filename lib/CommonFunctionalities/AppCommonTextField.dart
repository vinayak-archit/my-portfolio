
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Resources/AssetsConstants.dart';
import '../Resources/ColorConstants.dart';
import '../Resources/TextStyleConstants.dart';

bool _secureText = true;
String? countryDialCode;
String? countryCodeValue;

class AppCommonTextField extends StatefulWidget {
  TextEditingController? controller;
  bool? isShowPassword = false;
  String? labelText;
  bool? secureText;
  bool? isShowCountryCode;
  String? prefixText;
  ValueChanged<String>? onSubmitted;
  bool? isError = null;
  TextInputType? keyBoardType;
  int? maxLength;
  double? height;
  bool? isEnable;
  bool? isColor;
  ValueChanged<String>? onChanged;
  bool? isTick;
  int? maxLine;
  bool? borderRadius;
  bool? border;
  String? errorText;
  Widget? prefixIcon;
  Widget? suffixIconWidget;
  bool? calender;
  bool? surfixIconVisible;
  bool? isReadOnly;

  Function()? onTapFun;
  TextCapitalization? textCapitalization;

  AppCommonTextField({
    Key? key,
    this.isShowCountryCode,
    this.controller,
    this.labelText,
    this.secureText,
    this.prefixText,
    this.onSubmitted,
    this.isError,
    this.border,
    this.borderRadius,
    this.keyBoardType,
    this.maxLength,
    this.isShowPassword,
    this.height,
    this.isEnable,
    this.isColor,
    this.onChanged,
    this.maxLine,
    this.isTick,
    this.errorText,
    this.prefixIcon,
    this.calender,
    this.suffixIconWidget,
    this.surfixIconVisible,
    this.isReadOnly,
    this.onTapFun,
    this.textCapitalization,
  }) : super(key: key);

  @override
  _AppCommonTextFieldState createState() => _AppCommonTextFieldState();
}

class _AppCommonTextFieldState extends State<AppCommonTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
      // margin: EdgeInsets.only(left: 20, right: 20),
      height: widget.height,
      child: Theme(
        data: ThemeData(
          primaryColor: THEME_COLOR,
          disabledColor: THEME_COLOR,
          primaryColorDark: THEME_COLOR,
        ),
        child: TextField(
            maxLines: widget.maxLine,
            onChanged: widget.onChanged,
            enabled: widget.isEnable,
            onTap: widget.onTapFun,
            readOnly: widget.isReadOnly == null ? false : true,
            textCapitalization: widget.textCapitalization == null
                ? widget.textCapitalization = TextCapitalization.none
                : widget.textCapitalization!,
            cursorColor: THEME_COLOR,
            inputFormatters: [
              LengthLimitingTextInputFormatter(widget.maxLength),
            ],
            controller: widget.controller,
            style: const TextStyle(color: BUTTON_TEXT_COLOR, fontSize: 20),
            onSubmitted: widget.onSubmitted,
            decoration: InputDecoration(
              errorText: widget.errorText,
              errorStyle: TextStyleConstants.textFormFieldRICCIONEREGULAR
                  .copyWith(color: RED_COLOR, fontSize: 12),
              errorMaxLines: 3,
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: OTP_PIN_BOUNDARY_COLOR, width: 2),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: OTP_PIN_BOUNDARY_COLOR, width: 2),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(7.0)),
                borderSide: BorderSide(color: OTP_PIN_BOUNDARY_COLOR, width: 2),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(7.0)),
                borderSide: BorderSide(color: THEME_COLOR, width: 2),
              ),
              isDense: true,
              //  <- you can it to 0.0 for no space
              suffixIcon: widget.surfixIconVisible == true
                  ? widget.suffixIconWidget
                  : widget.isShowPassword == true
                      ? IconButton(
                          icon: Icon(Icons.abc),
                          // Image.asset(
                          //     _secureText != true
                          //         ? AssetsConstants.mobile_Icon
                          //         : AssetsConstants.icPasswordHide,
                          //     width: 20,
                          //     height: 25),
                          onPressed: () {
                            setState(() {
                              _secureText = !_secureText;
                            });
                          },
                        )
                      : widget.calender == true
                          ? widget.suffixIconWidget
                          // ? const Icon(Icons.calendar_month_outlined)
                          : IconButton(
                              icon: widget.isTick == false
                                  ? Container()
                                  : Container(),
                              onPressed: () {},
                            ),
              labelText: widget.labelText,
              labelStyle: TextStyleConstants.textFormFieldGILROYBold.copyWith(
                  color:
                      widget.isColor == true ? BLACK_COLOR : BUTTON_TEXT_COLOR,
                  fontSize: 17),
              prefixText: widget.prefixText,
              suffixStyle: TextStyleConstants.textFormFieldRICCIONEREGULAR
                  .copyWith(color: BLACK_COLOR, fontSize: 17),
              prefixStyle: const TextStyle(color: BLACK_COLOR, fontSize: 17),
            ),
            keyboardType: widget.keyBoardType,
            obscureText: widget.isShowPassword == true
                ? _secureText
                : widget.secureText!),
      ),
    );
  }
}
