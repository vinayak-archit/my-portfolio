import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ColorConstants.dart';
import 'TextStyleConstants.dart';

bool _secureText = true;
String? countryDialCode;
String? countryCodeValue;

class AppTextField extends StatefulWidget {
  TextEditingController? controller;
  bool? isShowPassword = false;
  String? labelText;
  bool? secureText;
  bool? isShowCountryCode;
  String? prefixText;
  ValueChanged<String>? onSubmitted;
  bool? isError;
  TextInputType? keyBoardType;
  int? maxLength;
  double? height;
  bool? isEnable;
  bool? isReadOnly;
  bool? isColor;
  ValueChanged<String>? onChanged;
  bool? isTick;
  int? maxLine;
  String? errorText;
  Widget? prefixIcon;
  Widget? suffixIconWidget;
  bool? calender;
  bool? surfixIconVisible;

  TextCapitalization? textCapitalization;

  AppTextField(
      {Key? key,
      this.isShowCountryCode,
      required this.controller,
      this.labelText,
      this.secureText,
      this.prefixText,
      this.onSubmitted,
      this.isError,
      this.keyBoardType,
      this.maxLength,
      this.isShowPassword,
      this.height,
      this.isEnable,
      this.isReadOnly,
      this.isColor,
      this.onChanged,
      this.maxLine,
      required this.isTick,
      this.errorText,
      this.prefixIcon,
      this.calender,
      this.suffixIconWidget,
      this.surfixIconVisible,
      this.textCapitalization,
      Image,
      child})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<AppTextField> {
  FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
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
            readOnly: widget.isReadOnly == null ? false : true,
            textCapitalization: widget.textCapitalization == null
                ? widget.textCapitalization = TextCapitalization.none
                : widget.textCapitalization!,
            cursorColor: THEME_COLOR,
            inputFormatters: [
              LengthLimitingTextInputFormatter(widget.maxLength),
            ],
            controller: widget.controller,
            style: const TextStyle(color: APP_TEXT_COLOR, fontSize: 18),
            onSubmitted: widget.onSubmitted,
            decoration: InputDecoration(
              errorText: widget.errorText,
              errorStyle: TextStyleConstants.textFormFieldGILROYMedium
                  .copyWith(color: RED_COLOR, fontSize: 12),
              errorMaxLines: 3,

              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: RED_COLOR, width: 2),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: RED_COLOR, width: 2),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: TEXTFIELD_BORDER_COLOR, width: 2),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: THEME_COLOR, width: 2),
              ),
              disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: TEXTFIELD_BORDER_COLOR, width: 2),
              ),
              isDense: true,
              //  <- you can it to 0.0 for no space
              suffixIcon: widget.surfixIconVisible == true
                  ? widget.suffixIconWidget
                  : widget.isShowPassword == true
                      ? IconButton(
                          icon: const Icon(Icons.abc),
                          // Image.asset(
                          //     _secureText != true
                          //         ? AssetsConstants.mobile_Icon
                          //         : AssetsConstants.icPasswordHide,
                          //     width: 25,
                          //     height: 25),
                          onPressed: () {
                            setState(() {
                              _secureText = !_secureText;
                            });
                          },
                        )
                      : widget.calender == true
                          ? widget.suffixIconWidget
                          : IconButton(
                              icon: widget.isTick == false
                                  ? Container()
                                  : Container(),
                              onPressed: () {},
                            ),
              labelText: widget.labelText,
              focusColor: THEME_COLOR,

              contentPadding: const EdgeInsets.only(left: 25.0, top: 20),
              //  labelStyle: TextStyle( color: myFocusNode.hasFocus ? Colors.grey
              // : Colors.blue ,),
              labelStyle: TextStyleConstants.textFormFieldGILROYMedium.copyWith(
                  color: myFocusNode.hasFocus
                      ? THEME_COLOR
                      : TEXTFIELD_BORDER_COLOR,
                  fontSize: 17),

              // (widget.prefixIcon == null)?:
              // prefixIcon:Image.asset(
              //        widget.prefixIcon!),
              //  prefixIcon: Image.asset(widget.prefixIcon==null?:widget.prefixIcon),
              suffixStyle: TextStyleConstants.textFormFieldGILROYMedium
                  .copyWith(color: APP_TEXT_COLOR, fontSize: 17),
              prefixStyle: const TextStyle(color: APP_TEXT_COLOR, fontSize: 20),
            ),
            keyboardType: widget.keyBoardType,
            obscureText: widget.isShowPassword == false
            // ? _secureText
            // : widget.secureText!
            ),
      ),
    );
  }
}
