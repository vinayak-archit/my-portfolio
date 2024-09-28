
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Resources/StringConstants.dart';
import 'package:flutter_application_1/Resources/TextStyleConstants.dart';
import '../Resources/ColorConstants.dart';
import '../Resources/ScreenHeightWidth.dart';
import '../responsive_design.dart';

Future<void> ShowEndDrawer(BuildContext context) async {
  showDialog(
      context: context, builder: (BuildContext context) => buildPopUp(context));
}

Widget buildPopUp(BuildContext context) {
  ScreenSize().init(context);
  var height = ScreenSize.screenHeight;
  var width = ScreenSize.screenWidth;
  return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: THEME_COLOR,
        body: Drawer(
          backgroundColor: THEME_COLOR,
          width: width! * 0.5,
          child: ListView(
            padding: EdgeInsets.only(top: height! * 0.05),
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: width * 0.03,
                    right: width * 0.03,
                    bottom: height * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.person,
                            color: WHITE_COLOR, size: width * 0.04),
                        Icon(Icons.close, color: RED_COLOR, size: width * 0.04),
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.only(top: height * 0.02),
                        child: Text(
                          StringConstants.name,
                          style: TextStyleConstants.textStyleWhitecolor14w500,
                        )),
                    Container(
                      margin: EdgeInsets.only(top: height * 0.03),
                      child: const Divider(
                        thickness: 0.2,
                        color: WHITE_COLOR,
                      ),
                    )
                  ],
                ),
              ),
              ListTile(
                title: const Text(
                  'Home',
                  style: TextStyle(color: WHITE_COLOR),
                ),
                onTap: () {
                  // Get.to(NewPage());
                },
              ),
              ListTile(
                title: const Text(
                  'Resume',
                  style: TextStyle(color: WHITE_COLOR),
                ),
                onTap: () {
                  // navigationPushReplacement(context, HomePage());
                },
              ),
              ListTile(
                title: const Text(
                  'Projects',
                  style: TextStyle(color: WHITE_COLOR),
                ),
                onTap: () {
                  // Get.to(LogInSignUp());
                },
              ),
              ListTile(
                title: const Text(
                  'Contact',
                  style: TextStyle(color: WHITE_COLOR),
                ),
                onTap: () {
                  // Get.to(LogInSignUp());
                },
              ),
            ],
          ),
        ),
      ));
}

Widget Header(BuildContext context) {
  ScreenSize().init(context);
  var height = ScreenSize.screenHeight;
  var width = ScreenSize.screenWidth;
  return Container(
    color: THEME_COLOR,
    height: height! / 10,
    width: width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            margin: EdgeInsets.only(left: width! * 0.03),
            child: InkWell(
              onTap: () {},
              child: Row(
                children: [
                  const Icon(
                    Icons.person,
                    color: WHITE_COLOR,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width * 0.01),
                    child: Text(StringConstants.name,
                        style: TextStyleConstants.textStyleWhitecolor14w500),
                  )
                ],
              ),
              // child: ClipOval(child: Image.asset(AssetsConstants.profile)),
            )),
        Container(
          margin: EdgeInsets.only(right: width * 0.03),
          child: ResponsiveWidget.isDesktop(context)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        // Get.to(NewPage());
                      },
                      child: const Text(
                        'Home',
                        style: TextStyle(color: WHITE_COLOR),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'Features',
                        style: TextStyle(color: WHITE_COLOR),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    InkWell(
                      onTap: () {
                        // Get.toNamed(AppRoutes.loginsignup);
                      },
                      child: const Text(
                        'Portfolio',
                        style: TextStyle(color: WHITE_COLOR),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    InkWell(
                      onTap: () {
                        // Get.toNamed(AppRoutes.loginsignup);
                      },
                      child: const Text(
                        'Resume',
                        style: TextStyle(color: WHITE_COLOR),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    InkWell(
                      onTap: () {
                        // Get.toNamed(AppRoutes.loginsignup);
                      },
                      child: const Text(
                        'Companies',
                        style: TextStyle(color: WHITE_COLOR),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    InkWell(
                      onTap: () {
                        // Get.toNamed(AppRoutes.loginsignup);
                      },
                      child: const Text(
                        'Contact',
                        style: TextStyle(color: WHITE_COLOR),
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          ShowEndDrawer(context);
                        },
                        child: Icon(
                          Icons.menu,
                          color: WHITE_COLOR,
                          size: ResponsiveWidget.isTablet(context)
                              ? width * 0.03
                              : ResponsiveWidget.isMobileLarge(context)
                                  ? width * 0.05
                                  : ResponsiveWidget.isMobile(context)
                                      ? width * 0.05
                                      : width * 0.32,
                        )),
                  ],
                ),
        ),
      ],
    ),
  );
}
