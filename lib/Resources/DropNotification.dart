import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Resources/ColorConstants.dart';
import 'TextFontConstants.dart';
import 'TextStyleConstants.dart';

class CommonDropDownFour extends StatefulWidget {
  String? hintText;
  final ValueChanged<dynamic>? onChanged;
  List<dynamic>? surveyFormData;
  String? chosenValue;

  CommonDropDownFour(
      {Key? key,
      this.hintText,
      this.onChanged,
      this.surveyFormData,
      this.chosenValue})
      : super(key: key);

  @override
  _CommonDropDownFourState createState() => _CommonDropDownFourState();
}

class _CommonDropDownFourState extends State<CommonDropDownFour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: WHITE_COLOR,
            borderRadius: BorderRadius.circular(7.0),
            border: Border.all(
                color:
                    widget.chosenValue != null ? BUTTON_TEXT_COLOR : RED_COLOR,
                width: 0.85),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 5),
            child: DropdownButton<dynamic>(
              value: widget.chosenValue,
              elevation: 11,
              underline: const SizedBox(),
              isExpanded: true,
              alignment: Alignment.bottomLeft,
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              dropdownColor: WHITE_COLOR,
              onChanged: widget.onChanged,
              items: widget.surveyFormData
                  ?.map(
                    (dynamic e) => DropdownMenuItem<String>(
                        value: e.name,
                        child: Row(
                          children: [
                            e.iconImages != null
                                ? Image.network(e.iconImages.toString(),
                                    height: 25, width: 25)
                                : Container(),
                            const SizedBox(width: 10),
                            AppRegularFont(
                                msg: e.name,
                                fontSize: 16,
                                color: BUTTON_TEXT_COLOR),
                          ],
                        )),
                  )
                  .toList(),
              hint: AppRegularFont(
                msg: widget.hintText!,
                color: BUTTON_TEXT_COLOR,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NormalDropDownFour extends StatefulWidget {
  // const NormalDropDown({Key? key}) : super(key: key);
  TextEditingController? controller;
  double? height;
  String? hintText;
  final ValueChanged<dynamic>? onChanged;
  final ValueChanged<dynamic>? onSaved;
  List<dynamic>? surveyFormData;
  String? chosenValue;
  String? errorText;

  NormalDropDownFour(
      {Key? key,
      this.controller,
      this.height,
      this.hintText,
      this.onChanged,
      this.onSaved,
      this.surveyFormData,
      this.errorText,
      this.chosenValue})
      : super(key: key);

  @override
  State<NormalDropDownFour> createState() => _NormalDropDownFourState();
}

class _NormalDropDownFourState extends State<NormalDropDownFour> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
        // margin: EdgeInsets.only(left: 20, right: 20),
        height: widget.height,

        child: Theme(
          data: ThemeData(
            primaryColor: THEME_COLOR,
            disabledColor: THEME_COLOR,
            primaryColorDark: THEME_COLOR,
          ),
          child: DropdownButtonFormField2<dynamic>(
            value: widget.chosenValue,
            isExpanded: true,
            decoration: InputDecoration(
              errorText: widget.errorText,
              errorStyle:
                  TextStyleConstants.textFormFieldRICCIONEREGULAR.copyWith(
                color: BUTTON_TEXT_COLOR,
                fontSize: 12,
              ),
              errorMaxLines: 3,
              focusedErrorBorder: const UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: OTP_PIN_BOUNDARY_COLOR, width: 2),
              ),
              errorBorder: const UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: OTP_PIN_BOUNDARY_COLOR, width: 2),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: OTP_PIN_BOUNDARY_COLOR, width: 2),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: THEME_COLOR, width: 2),
              ),
              isDense: true,
            ),
            // icon: Row(
            //   children: [
            //     // VerticalDivider(width: 20,
            //     //   color: Colors.grey,
            //     //   thickness: 2,
            //     // ),
            //     IconButton(
            //       icon: Image.asset(AssetsConstants.Downarrow,
            //           width: 25, height: 25),
            //       onPressed: () {},
            //     )
            //     //    Icon(Icons.arrow_downward_sharp),
            //   ],
            // ),
            alignment: Alignment.bottomLeft,
            onChanged: widget.onChanged,
            items: widget.surveyFormData!
                .map((item) => DropdownMenuItem<String>(
                      value: item.name,
                      child: Text(item,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          )),
                    ))
                .toList(),
            hint: AppRegularFont(
              msg: widget.hintText!,
              color: BUTTON_TEXT_COLOR,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
