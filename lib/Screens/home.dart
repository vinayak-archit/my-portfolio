import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/responsive_design.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../Resources/ColorConstants.dart';
import '../Resources/ScreenHeightWidth.dart';
import '../Resources/StringConstants.dart';
import 'home_controller.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    var height = ScreenSize.screenHeight;
    var width = ScreenSize.screenWidth;
    return GetBuilder<HomeController>(
      builder: (controller) => ResponsiveWidget(
          desktop: Scaffold(
        backgroundColor: getThemeColor(context),
        appBar: PreferredSize(
          preferredSize: Size(width!, 1000),
          child: SafeArea(
            child: Container(
              color: getThemeColor(context),
              height: height! / 10,
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: width * 0.03),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.developer_mode,
                              color: getTextColor(context),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: width * 0.01),
                              child: Text(StringConstants.name,
                                  style: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context))),
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
                                  controller.newcontroller.animateTo(
                                    0,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.fastOutSlowIn,
                                  );
                                },
                                child: Text(
                                  'Home',
                                  style:
                                      TextStyle(color: getTextColor(context)),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.04,
                              ),
                              InkWell(
                                onTap: () {
                                  controller.newcontroller.animateTo(
                                    ResponsiveWidget.isDesktop(context)
                                        ? height
                                        : height,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.fastOutSlowIn,
                                  );
                                },
                                child: Text(
                                  'Resume',
                                  style:
                                      TextStyle(color: getTextColor(context)),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.04,
                              ),
                              InkWell(
                                onTap: () {
                                  controller.newcontroller.animateTo(
                                    ResponsiveWidget.isDesktop(context)
                                        ? height * 2
                                        : height * 2,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.fastOutSlowIn,
                                  );
                                },
                                child: Text(
                                  'Projects',
                                  style:
                                      TextStyle(color: getTextColor(context)),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.04,
                              ),
                              InkWell(
                                onTap: () {
                                  controller.newcontroller.animateTo(
                                    ResponsiveWidget.isDesktop(context)
                                        ? height * 2.5
                                        : height * 2.3,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.fastOutSlowIn,
                                  );
                                },
                                child: Text(
                                  'Contact',
                                  style:
                                      TextStyle(color: getTextColor(context)),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Drawer(
                                          backgroundColor:
                                              getThemeColor(context),
                                          width: width * 0.5,
                                          child: ListView(
                                            padding: EdgeInsets.only(
                                                top: height * 0.05),
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: width * 0.03,
                                                    right: width * 0.03,
                                                    bottom: height * 0.04),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Icon(
                                                            Icons
                                                                .developer_mode,
                                                            color: getTextColor(
                                                                context),
                                                            size: width * 0.04),
                                                        Icon(Icons.close,
                                                            color: RED_COLOR,
                                                            size: width * 0.04),
                                                      ],
                                                    ),
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            top: height * 0.02),
                                                        child: Text(
                                                          StringConstants.name,
                                                          style: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context)),
                                                        )),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: height * 0.03),
                                                      child: Divider(
                                                        thickness: 0.2,
                                                        color: getTextColor(
                                                            context),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              ListTile(
                                                title: Text(
                                                  'Home',
                                                  style: TextStyle(
                                                      color: getTextColor(
                                                          context)),
                                                ),
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  controller.newcontroller
                                                      .animateTo(
                                                    ResponsiveWidget.isTablet(
                                                            context)
                                                        ? 0
                                                        : ResponsiveWidget
                                                                .isMobileLarge(
                                                                    context)
                                                            ? 0
                                                            : ResponsiveWidget
                                                                    .isMobile(
                                                                        context)
                                                                ? 0
                                                                : 0,
                                                    duration: const Duration(
                                                        seconds: 1),
                                                    curve: Curves.fastOutSlowIn,
                                                  );
                                                },
                                              ),
                                              ListTile(
                                                title: Text(
                                                  'Resume',
                                                  style: TextStyle(
                                                      color: getTextColor(
                                                          context)),
                                                ),
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  controller.newcontroller
                                                      .animateTo(
                                                    ResponsiveWidget.isTablet(
                                                            context)
                                                        ? height
                                                        : ResponsiveWidget
                                                                .isMobileLarge(
                                                                    context)
                                                            ? height * 2.3
                                                            : ResponsiveWidget
                                                                    .isMobile(
                                                                        context)
                                                                ? height * 1.7
                                                                : height,
                                                    duration: const Duration(
                                                        seconds: 1),
                                                    curve: Curves.fastOutSlowIn,
                                                  );
                                                },
                                              ),
                                              ListTile(
                                                title: Text(
                                                  'Projects',
                                                  style: TextStyle(
                                                      color: getTextColor(
                                                          context)),
                                                ),
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  controller.newcontroller
                                                      .animateTo(
                                                    ResponsiveWidget.isTablet(
                                                            context)
                                                        ? height * 2
                                                        : ResponsiveWidget
                                                                .isMobileLarge(
                                                                    context)
                                                            ? height * 2.9
                                                            : ResponsiveWidget
                                                                    .isMobile(
                                                                        context)
                                                                ? height * 2.9
                                                                : height,
                                                    duration: const Duration(
                                                        seconds: 1),
                                                    curve: Curves.fastOutSlowIn,
                                                  );
                                                },
                                              ),
                                              ListTile(
                                                title: Text(
                                                  'Contact',
                                                  style: TextStyle(
                                                      color: getTextColor(
                                                          context)),
                                                ),
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  controller.newcontroller
                                                      .animateTo(
                                                    ResponsiveWidget.isTablet(
                                                            context)
                                                        ? height * 2.3
                                                        : ResponsiveWidget
                                                                .isMobileLarge(
                                                                    context)
                                                            ? height * 3.6
                                                            : ResponsiveWidget
                                                                    .isMobile(
                                                                        context)
                                                                ? height * 3.2
                                                                : height,
                                                    duration: const Duration(
                                                        seconds: 1),
                                                    curve: Curves.fastOutSlowIn,
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    Icons.menu,
                                    color: getTextColor(context),
                                    size: ResponsiveWidget.isTablet(context)
                                        ? width * 0.03
                                        : ResponsiveWidget.isMobileLarge(
                                                context)
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
            ),
          ),
        ),
        body: Container(
          color: getThemeColor(context),
          height: height,
          width: width,
          child: ListView(controller: controller.newcontroller, children: [
            SizedBox(
              width: width,
              child: ResponsiveWidget.isDesktop(context) ||
                      ResponsiveWidget.isTablet(context)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "WELCOME TO MY WORLD",
                                style: TextStyle(
                                    color: getTextColor(context),
                                    fontSize:
                                        ResponsiveWidget.isDesktop(context)
                                            ? width * 0.01
                                            : ResponsiveWidget.isTablet(context)
                                                ? width * 0.02
                                                : ResponsiveWidget
                                                        .isMobileLarge(context)
                                                    ? width * 0.02
                                                    : ResponsiveWidget.isMobile(
                                                            context)
                                                        ? width * 0.03
                                                        : width * 0.02,
                                    letterSpacing:
                                        ResponsiveWidget.isDesktop(context)
                                            ? width * 0.003
                                            : ResponsiveWidget.isTablet(context)
                                                ? width * 0.003
                                                : ResponsiveWidget
                                                        .isMobileLarge(context)
                                                    ? width * 0.003
                                                    : ResponsiveWidget.isMobile(
                                                            context)
                                                        ? width * 0.003
                                                        : width * 0.003,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: height * 0.02),
                              child: Row(
                                children: [
                                  Text(
                                    "Hi, I'm",
                                    style: TextStyle(
                                        color: getTextColor(context),
                                        fontSize: width * 0.039,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: width * 0.01),
                                    child: Text(
                                      StringConstants.name,
                                      style: TextStyle(
                                          color: PINK_COLOR,
                                          fontSize: width * 0.039,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: height * 0.02),
                              child: AnimatedTextKit(
                                repeatForever: true,
                                animatedTexts: [
                                  TyperAnimatedText(
                                    'a Developer.',
                                    textStyle: TextStyle(
                                        color: getTextColor(context),
                                        fontSize: width * 0.039,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TyperAnimatedText(
                                    'a Professional Coder.',
                                    textStyle: TextStyle(
                                        color: getTextColor(context),
                                        fontSize: width * 0.039,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: height * 0.02),
                              width: width * 0.4,
                              child: Text(
                                "Skilled Application Developer experienced with multiple programming languages and design frameworks. Brings knowledge to contribute and skills to produce quality applications with consistent on-time deliveries. Offers eye for design details and analytical abilities to identify and prevent missteps.",
                                style: TextStyle(
                                    color: getWhiteColorLight(context),
                                    fontSize:
                                        ResponsiveWidget.isDesktop(context)
                                            ? width * 0.01
                                            : ResponsiveWidget.isTablet(context)
                                                ? width * 0.02
                                                : ResponsiveWidget
                                                        .isMobileLarge(context)
                                                    ? width * 0.02
                                                    : ResponsiveWidget.isMobile(
                                                            context)
                                                        ? width * 0.03
                                                        : width * 0.01,
                                    letterSpacing: 2.0,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: height * 0.1),
                              width: width * 0.4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "FIND WITH ME",
                                    style: TextStyle(
                                        color: getWhiteColorLight(context),
                                        fontSize: ResponsiveWidget.isDesktop(
                                                context)
                                            ? width * 0.01
                                            : ResponsiveWidget.isTablet(context)
                                                ? width * 0.015
                                                : ResponsiveWidget
                                                        .isMobileLarge(context)
                                                    ? width * 0.03
                                                    : ResponsiveWidget.isMobile(
                                                            context)
                                                        ? width * 0.03
                                                        : width * 0.03,
                                        letterSpacing: 2.0,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: height * 0.02),
                                    child: Row(
                                      children: [
                                        MouseRegion(
                                          onHover: (e) {
                                            controller.hoverFB = true;
                                            controller.update();
                                          },
                                          onExit: (event) {
                                            controller.hoverFB = false;
                                            controller.update();
                                          },
                                          child: InkWell(
                                            onTap: () {
                                              String? fb =
                                                  'https://www.facebook.com/vinayak.mishra.332345';
                                              launchUrlString(fb);
                                            },
                                            child: Container(
                                                child: FaIcon(
                                                    FontAwesomeIcons.facebook,
                                                    color: controller.hoverFB ==
                                                            true
                                                        ? PINK_COLOR
                                                        : getTextColor(
                                                            context))),
                                          ),
                                        ),
                                        MouseRegion(
                                          onHover: (e) {
                                            controller.hoverInsta = true;
                                            controller.update();
                                          },
                                          onExit: (event) {
                                            controller.hoverInsta = false;
                                            controller.update();
                                          },
                                          child: InkWell(
                                            onTap: () {
                                              String? insta =
                                                  'https://www.instagram.com/vinayak_archit/';
                                              launchUrlString(insta);
                                            },
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    left: width * 0.02),
                                                child: FaIcon(
                                                    FontAwesomeIcons.instagram,
                                                    color:
                                                        controller.hoverInsta ==
                                                                true
                                                            ? PINK_COLOR
                                                            : getTextColor(
                                                                context))),
                                          ),
                                        ),
                                        MouseRegion(
                                          onHover: (e) {
                                            controller.hoverLinked = true;
                                            controller.update();
                                          },
                                          onExit: (event) {
                                            controller.hoverLinked = false;
                                            controller.update();
                                          },
                                          child: InkWell(
                                            onTap: () {
                                              String? lin =
                                                  'https://www.linkedin.com/in/vinayak-mishra-b611b3217/';
                                              launchUrlString(lin);
                                            },
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    left: width * 0.02),
                                                child: FaIcon(
                                                    FontAwesomeIcons.linkedin,
                                                    color: controller
                                                                .hoverLinked ==
                                                            true
                                                        ? PINK_COLOR
                                                        : getTextColor(
                                                            context))),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: width * 0.03),
                          child: Container(
                            decoration: BoxDecoration(
                              color: getThemeColor(context),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 20.0,
                                  spreadRadius: 10.0,
                                  offset: Offset(
                                    1.0,
                                    1.0,
                                  ),
                                )
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5.0)),
                              image: const DecorationImage(
                                image: AssetImage(
                                  "assets/images/myimage.jpg",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            width: width * 0.4,
                            height: height * 0.8,
                          ),
                        )
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: width * 0.03),
                          child: Container(
                            decoration: BoxDecoration(
                              color: getThemeColor(context),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 20.0,
                                  spreadRadius: 10.0,
                                  offset: Offset(
                                    1.0,
                                    1.0,
                                  ),
                                )
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/myimage.jpg",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            width: width * 0.9,
                            height: height * 0.8,
                          ),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(
                              top: height * 0.06, left: width * 0.05),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  "WELCOME TO MY WORLD",
                                  style: TextStyle(
                                      color: getTextColor(context),
                                      fontSize: ResponsiveWidget.isDesktop(
                                              context)
                                          ? width * 0.01
                                          : ResponsiveWidget.isTablet(context)
                                              ? width * 0.02
                                              : ResponsiveWidget.isMobileLarge(
                                                      context)
                                                  ? width * 0.03
                                                  : ResponsiveWidget.isMobile(
                                                          context)
                                                      ? width * 0.05
                                                      : width * 0.02,
                                      letterSpacing: ResponsiveWidget.isDesktop(
                                              context)
                                          ? width * 0.04
                                          : ResponsiveWidget.isTablet(context)
                                              ? width * 0.003
                                              : ResponsiveWidget.isMobileLarge(
                                                      context)
                                                  ? width * 0.0029
                                                  : ResponsiveWidget.isMobile(
                                                          context)
                                                      ? width * 0.003
                                                      : width * 0.003,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: height * 0.02),
                                child: Row(
                                  children: [
                                    Text(
                                      "Hi, I'm",
                                      style: TextStyle(
                                          color: getTextColor(context),
                                          fontSize:
                                              ResponsiveWidget.isMobileLarge(
                                                      context)
                                                  ? width * 0.05
                                                  : ResponsiveWidget.isMobile(
                                                          context)
                                                      ? width * 0.07
                                                      : width * 0.05,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: width * 0.01),
                                      child: Text(
                                        StringConstants.name,
                                        style: TextStyle(
                                            color: PINK_COLOR,
                                            fontSize:
                                                ResponsiveWidget.isMobileLarge(
                                                        context)
                                                    ? width * 0.05
                                                    : ResponsiveWidget.isMobile(
                                                            context)
                                                        ? width * 0.07
                                                        : width * 0.05,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: height * 0.02),
                                child: AnimatedTextKit(
                                  repeatForever: true,
                                  animatedTexts: [
                                    TyperAnimatedText(
                                      'a Developer.',
                                      textStyle: TextStyle(
                                          color: getTextColor(context),
                                          fontSize:
                                              ResponsiveWidget.isMobileLarge(
                                                      context)
                                                  ? width * 0.05
                                                  : ResponsiveWidget.isMobile(
                                                          context)
                                                      ? width * 0.07
                                                      : width * 0.05,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TyperAnimatedText(
                                      'a Professional Coder.',
                                      textStyle: TextStyle(
                                          color: getTextColor(context),
                                          fontSize:
                                              ResponsiveWidget.isMobileLarge(
                                                      context)
                                                  ? width * 0.05
                                                  : ResponsiveWidget.isMobile(
                                                          context)
                                                      ? width * 0.07
                                                      : width * 0.05,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: height * 0.02),
                                width: width * 0.9,
                                child: Text(
                                  "Skilled Application Developer experienced with multiple programming languages and design frameworks. Brings knowledge to contribute and skills to produce quality applications with consistent on-time deliveries. Offers eye for design details and analytical abilities to identify and prevent missteps.",
                                  style: TextStyle(
                                      color: getWhiteColorLight(context),
                                      fontSize: ResponsiveWidget.isMobileLarge(
                                              context)
                                          ? width * 0.04
                                          : ResponsiveWidget.isMobile(context)
                                              ? width * 0.05
                                              : width * 0.05,
                                      letterSpacing: 2.0,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: height * 0.1),
                                width: width * 0.4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "FIND WITH ME",
                                      style: TextStyle(
                                          color: getWhiteColorLight(context),
                                          fontSize: ResponsiveWidget.isDesktop(
                                                  context)
                                              ? width * 0.01
                                              : ResponsiveWidget.isTablet(
                                                      context)
                                                  ? width * 0.015
                                                  : ResponsiveWidget
                                                          .isMobileLarge(
                                                              context)
                                                      ? width * 0.03
                                                      : ResponsiveWidget
                                                              .isMobile(context)
                                                          ? width * 0.03
                                                          : width * 0.03,
                                          letterSpacing: 2.0,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: height * 0.02),
                                      child: Row(
                                        children: [
                                          MouseRegion(
                                            onHover: (e) {
                                              controller.hoverFB = true;
                                              controller.update();
                                            },
                                            onExit: (event) {
                                              controller.hoverFB = false;
                                              controller.update();
                                            },
                                            child: Container(
                                                child: FaIcon(
                                                    FontAwesomeIcons.facebook,
                                                    color: controller.hoverFB ==
                                                            true
                                                        ? PINK_COLOR
                                                        : getTextColor(
                                                            context))),
                                          ),
                                          MouseRegion(
                                            onHover: (e) {
                                              controller.hoverInsta = true;
                                              controller.update();
                                            },
                                            onExit: (event) {
                                              controller.hoverInsta = false;
                                              controller.update();
                                            },
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    left: width * 0.02),
                                                child: FaIcon(
                                                    FontAwesomeIcons.instagram,
                                                    color:
                                                        controller.hoverInsta ==
                                                                true
                                                            ? PINK_COLOR
                                                            : getTextColor(
                                                                context))),
                                          ),
                                          MouseRegion(
                                            onHover: (e) {
                                              controller.hoverLinked = true;
                                              controller.update();
                                            },
                                            onExit: (event) {
                                              controller.hoverLinked = false;
                                              controller.update();
                                            },
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    left: width * 0.02),
                                                child: FaIcon(
                                                    FontAwesomeIcons.linkedin,
                                                    color: controller
                                                                .hoverLinked ==
                                                            true
                                                        ? PINK_COLOR
                                                        : getTextColor(
                                                            context))),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
            Container(
                margin: EdgeInsets.only(top: height * 0.02),
                child: Divider(
                  thickness: 0.1,
                  color: getTextColor(context),
                  indent: 20,
                  endIndent: 20,
                )),
            SizedBox(
              // height: height,
              width: width,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: height * 0.02),
                    child: Text(
                      "2.5+ Year of Experience",
                      style: TextStyle(
                        color: PINK_COLOR,
                        fontSize: ResponsiveWidget.isDesktop(context)
                            ? width * 0.01
                            : ResponsiveWidget.isTablet(context)
                                ? width * 0.02
                                : ResponsiveWidget.isMobileLarge(context)
                                    ? width * 0.03
                                    : ResponsiveWidget.isMobile(context)
                                        ? width * 0.05
                                        : width * 0.02,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height * 0.02),
                    child: Text(
                      "My Resume",
                      style: TextStyle(
                          color: getTextColor(context),
                          fontSize: width * 0.039,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      width: width,
                      height: MediaQuery.sizeOf(context).height * 0.07,
                      margin: EdgeInsets.only(top: height * 0.02),
                      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.updateActiveIndex(0);
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.3,
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.sizeOf(context).height * 0.01,
                                  horizontal:
                                      MediaQuery.sizeOf(context).width * 0.02),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(
                                        1.0,
                                        1.0,
                                      ),
                                    )
                                  ],
                                  color: getThemeColor(context)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'Education',
                                  style: TextStyle(
                                      color: controller.activeIndex == 0
                                          ? PINK_COLOR
                                          : getTextColor(context),
                                      fontSize: ResponsiveWidget.isMobile(
                                              context)
                                          ? width * 0.04
                                          : ResponsiveWidget.isMobileLarge(
                                                  context)
                                              ? width * 0.03
                                              : ResponsiveWidget.isTablet(
                                                      context)
                                                  ? width * 0.02
                                                  : ResponsiveWidget.isDesktop(
                                                          context)
                                                      ? width * 0.02
                                                      : width * 0.03),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.updateActiveIndex(1);
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.3,
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.sizeOf(context).height * 0.01,
                                  horizontal:
                                      MediaQuery.sizeOf(context).width * 0.02),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(
                                        1.0,
                                        1.0,
                                      ),
                                    )
                                  ],
                                  color: getThemeColor(context)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'Professional Skills',
                                  style: TextStyle(
                                      color: controller.activeIndex == 1
                                          ? PINK_COLOR
                                          : getTextColor(context),
                                      fontSize: ResponsiveWidget.isMobile(
                                              context)
                                          ? width * 0.04
                                          : ResponsiveWidget.isMobileLarge(
                                                  context)
                                              ? width * 0.03
                                              : ResponsiveWidget.isTablet(
                                                      context)
                                                  ? width * 0.02
                                                  : ResponsiveWidget.isDesktop(
                                                          context)
                                                      ? width * 0.02
                                                      : width * 0.03),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.updateActiveIndex(2);
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.3,
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.sizeOf(context).height * 0.01,
                                  horizontal:
                                      MediaQuery.sizeOf(context).width * 0.02),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(
                                        1.0,
                                        1.0,
                                      ),
                                    )
                                  ],
                                  color: getThemeColor(context)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'Experience',
                                  style: TextStyle(
                                      color: controller.activeIndex == 2
                                          ? PINK_COLOR
                                          : getTextColor(context),
                                      fontSize: ResponsiveWidget.isMobile(
                                              context)
                                          ? width * 0.04
                                          : ResponsiveWidget.isMobileLarge(
                                                  context)
                                              ? width * 0.03
                                              : ResponsiveWidget.isTablet(
                                                      context)
                                                  ? width * 0.02
                                                  : ResponsiveWidget.isDesktop(
                                                          context)
                                                      ? width * 0.02
                                                      : width * 0.03),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  controller.activeIndex == 0
                      ? Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.04),
                          child: education(context),
                        )
                      : controller.activeIndex == 1
                          ? Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.04),
                              child: skills(context),
                            )
                          : controller.activeIndex == 2
                              ? Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.04),
                                  child: experience(context),
                                )
                              : const SizedBox()
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: height * 0.02),
                child: Divider(
                  thickness: 0.1,
                  color: getTextColor(context),
                  indent: 20,
                  endIndent: 20,
                )),
            Container(
              margin: EdgeInsets.only(top: height * 0.02),
              width: width,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: height * 0.02),
                    child: Text(
                      "Worked on Multiple Technologies",
                      style: TextStyle(
                        color: PINK_COLOR,
                        fontSize: ResponsiveWidget.isDesktop(context)
                            ? width * 0.01
                            : ResponsiveWidget.isTablet(context)
                                ? width * 0.02
                                : ResponsiveWidget.isMobileLarge(context)
                                    ? width * 0.03
                                    : ResponsiveWidget.isMobile(context)
                                        ? width * 0.05
                                        : width * 0.02,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height * 0.02),
                    child: Text(
                      "My Projects",
                      style: TextStyle(
                          color: getTextColor(context),
                          fontSize: width * 0.039,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: height * 0.02),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.04),
                            child: Container(
                              margin: EdgeInsets.only(top: height * 0.04),
                              width: width,
                              decoration: BoxDecoration(
                                  color: getThemeColor(context),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(
                                        1.0,
                                        1.0,
                                      ),
                                    )
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
                              child: ExpansionTile(
                                initiallyExpanded: false,
                                tilePadding: EdgeInsets.symmetric(
                                    horizontal: width * 0.04,
                                    vertical: height * 0.02),
                                collapsedIconColor: getTextColor(context),
                                iconColor: getTextColor(context),
                                title: Text(
                                  ' MediMytra',
                                  style: TextStyle(
                                      color: getTextColor(context),
                                      fontSize: ResponsiveWidget.isMobile(
                                              context)
                                          ? width * 0.04
                                          : ResponsiveWidget.isMobileLarge(
                                                  context)
                                              ? width * 0.03
                                              : ResponsiveWidget.isTablet(
                                                      context)
                                                  ? width * 0.02
                                                  : ResponsiveWidget.isDesktop(
                                                          context)
                                                      ? width * 0.02
                                                      : width * 0.03),
                                ),
                                expandedAlignment: Alignment.topLeft,
                                childrenPadding: EdgeInsets.only(
                                    bottom: height * 0.04, left: width * 0.04),
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Welcome to Medimytra, an innovative and cutting-edge medical consultation comparison platform built on the power of Flutter and Dart. Medimytra is an innovative and user-friendly app designed to compare doctors available on different online consultation platforms, helping you make informed decisions based on crucial factors like price, rating, experience, and distance from your location. With Medimytra, finding the perfect doctor is a breeze. The app boasts an extensive database of doctors from various online consultation platforms, encompassing a wide range of medical specializations. Whether you need a general practitioner, a specialist, a therapist, or a counselor, Medimytra has you covered.\n\nMedimytra empowers you to make well-informed choices by offering a comprehensive comparison of essential factors:',
                                        style: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context)),
                                      ),
                                      const Text(""),
                                      Text(
                                        "Budget is crucial, and Medimytra lets you compare consultation fees for doctors across platforms. Whether you prefer an economical option or are willing to invest in premium healthcare, the app's price comparison feature has got you covered.\n\n The app compiles genuine patient reviews and ratings from various sources, giving you valuable insights into the quality of care provided by each doctor. You can read about other patients' experiences to gauge their satisfaction level and make a confident decision.\n\nMedimytra understands the importance of a doctor's experience and credentials. It provides detailed information about each doctor's qualifications, years of practice, and specialization, ensuring you find a professional that aligns perfectly with your medical requirements.",
                                        style: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.04),
                            child: Container(
                              margin: EdgeInsets.only(top: height * 0.04),
                              width: width,
                              decoration: BoxDecoration(
                                  color: getThemeColor(context),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(
                                        1.0,
                                        1.0,
                                      ),
                                    )
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
                              child: ExpansionTile(
                                initiallyExpanded: false,
                                tilePadding: EdgeInsets.symmetric(
                                    horizontal: width * 0.04,
                                    vertical: height * 0.02),
                                collapsedIconColor: getTextColor(context),
                                iconColor: getTextColor(context),
                                title: Text(
                                  ' Sales Tracky',
                                  style: TextStyle(
                                      color: getTextColor(context),
                                      fontSize: ResponsiveWidget.isMobile(
                                              context)
                                          ? width * 0.04
                                          : ResponsiveWidget.isMobileLarge(
                                                  context)
                                              ? width * 0.03
                                              : ResponsiveWidget.isTablet(
                                                      context)
                                                  ? width * 0.02
                                                  : ResponsiveWidget.isDesktop(
                                                          context)
                                                      ? width * 0.02
                                                      : width * 0.03),
                                ),
                                expandedAlignment: Alignment.topLeft,
                                childrenPadding: EdgeInsets.only(
                                    bottom: height * 0.04, left: width * 0.04),
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Sales Tracky is a powerful CRM platform designed to help businesses effectively manage their field sales team. It offers a comprehensive suite of tools, including location tracking, visit logs, reporting, and team management features. The platform streamlines sales processes, boosts team productivity, and enhances sales revenue. It enables businesses to monitor the progress of their sales personnel, manage sales pipelines, track leads, and generate accurate sales forecasts. Sales Tracky is a cloud-based platform accessible from anywhere, and it is highly customizable to fit individual business needs. With its user-friendly interface and robust features, Sales Tracky is an ideal solution for improving sales processes and increasing profitability.',
                                        style: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context)),
                                      ),
                                      const Text(""),
                                      Text(
                                        "The CRM Tracker app is a powerful tool built with Flutter framework and Dart programming language, offering seamless functionality on both Android and iOS devices. It serves as an efficient customer relationship management solution specifically tailored for businesses with field sales teams.\n\nOne of the key features of the app is its ability to track the real-time location of field sales workers, even when the app is not actively running. Through intelligent background services, the app automatically updates the worker's location every 15 minutes, ensuring accurate tracking and enabling businesses to monitor their sales team's movements efficiently.\n\nThe app provides a user-friendly interface for employees to log their activities and tasks throughout the day. Sales representatives can easily fill in their activity logs, including customer visits, meetings, and sales updates, all within the app. This streamlines the reporting process, eliminating the need for manual paperwork and ensuring accurate and timely data entry.\n\nTo promote effective team collaboration and supervision, the app allows supervisors and senior employees to access and review the activity logs of their juniors. This feature enables managers to monitor the progress of their team members, identify potential challenges, and provide necessary guidance or support as required.\n\nThe CRM Tracker app leverages the advanced capabilities of Flutter framework, providing a native-like experience on both Android and iOS platforms. It offers smooth performance, intuitive navigation, and a consistent user interface across devices, ensuring a seamless and enjoyable user experience for all users.\n\nTo enhance data security and privacy, the app employs encryption protocols to protect sensitive information, ensuring that customer and sales data remains confidential and secure at all times. Additionally, the app allows users to set access permissions, ensuring that only authorized personnel can view and edit specific logs and data.\n\nWith its cross-platform capabilities and robust functionality, the CRM Tracker app provides businesses with a comprehensive solution for effectively managing their field sales teams. It simplifies the tracking and reporting processes, promotes collaboration and supervision, and ultimately enhances overall productivity and efficiency.\n\nWhether it's tracking sales personnel locations, facilitating activity logging, or enabling seamless team communication, the CRM Tracker app built with Flutter and Dart proves to be an invaluable tool for businesses aiming to optimize their sales operations and drive success in the competitive marketplace.",
                                        style: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.04),
                            child: Container(
                              margin: EdgeInsets.only(top: height * 0.04),
                              width: width,
                              decoration: BoxDecoration(
                                  color: getThemeColor(context),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(
                                        1.0,
                                        1.0,
                                      ),
                                    )
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
                              child: ExpansionTile(
                                initiallyExpanded: false,
                                tilePadding: EdgeInsets.symmetric(
                                    horizontal: width * 0.04,
                                    vertical: height * 0.02),
                                collapsedIconColor: getTextColor(context),
                                iconColor: getTextColor(context),
                                title: Text(
                                  ' SmartCare',
                                  style: TextStyle(
                                      color: getTextColor(context),
                                      fontSize: ResponsiveWidget.isMobile(
                                              context)
                                          ? width * 0.04
                                          : ResponsiveWidget.isMobileLarge(
                                                  context)
                                              ? width * 0.03
                                              : ResponsiveWidget.isTablet(
                                                      context)
                                                  ? width * 0.02
                                                  : ResponsiveWidget.isDesktop(
                                                          context)
                                                      ? width * 0.02
                                                      : width * 0.03),
                                ),
                                expandedAlignment: Alignment.topLeft,
                                childrenPadding: EdgeInsets.only(
                                    bottom: height * 0.04, left: width * 0.04),
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'The Online Consultation app is a convenient platform designed for doctors and patients to connect seamlessly for medical consultations. Developed using Android Studio and Kotlin, this app revolutionizes the way healthcare services are delivered.',
                                        style: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context)),
                                      ),
                                      const Text(""),
                                      Text(
                                        "For patients, the app offers a user-friendly interface where they can create an account, search for doctors based on their specialization, and book appointments for virtual consultations. The app provides a comprehensive list of doctors with their profiles, including their qualifications, areas of expertise, and available time slots.",
                                        style: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context)),
                                      ),
                                      const Text(""),
                                      Text(
                                        "Patients can schedule appointments at their preferred time and date, ensuring flexibility and convenience. The app also offers the option for patients to book face-to-face consultations if they prefer an in-person visit. The booking process is straightforward, allowing patients to select the doctor, choose a suitable time slot, and confirm the appointment with just a few taps.",
                                        style: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context)),
                                      ),
                                      const Text(""),
                                      Text(
                                        "One of the standout features of the app is the built-in video calling functionality. When the scheduled consultation time arrives, patients can connect with their doctor through a secure and reliable video call. This enables a real-time interaction where patients can discuss their symptoms, receive medical advice, and ask questions directly to the doctor.",
                                        style: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context)),
                                      ),
                                      const Text(""),
                                      Text(
                                        "For doctors, the app provides an efficient platform to manage appointments and connect with patients. They can review patient profiles, access their medical history, and conduct consultations through video calls. The app also offers features for doctors to update their availability, manage their schedules, and send reminders to patients.",
                                        style: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context)),
                                      ),
                                      const Text(""),
                                      Text(
                                        "With this Online Consultation app, patients can receive medical advice from the comfort of their homes, avoiding the need to travel and wait in crowded clinics. Doctors can provide consultations remotely, ensuring access to healthcare services for patients regardless of their location.",
                                        style: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context)),
                                      ),
                                      const Text(""),
                                      Text(
                                        "Overall, this Android app developed with Android Studio and Kotlin offers a seamless and secure platform for doctors and patients to connect for online consultations. It leverages the power of technology to enhance the accessibility and convenience of healthcare services, ultimately improving the patient experience and promoting efficient healthcare delivery.",
                                        style: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.04),
                            child: Container(
                              margin: EdgeInsets.only(top: height * 0.04),
                              width: width,
                              decoration: BoxDecoration(
                                  color: getThemeColor(context),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(
                                        1.0,
                                        1.0,
                                      ),
                                    )
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
                              child: ExpansionTile(
                                initiallyExpanded: false,
                                tilePadding: EdgeInsets.symmetric(
                                    horizontal: width * 0.04,
                                    vertical: height * 0.02),
                                collapsedIconColor: getTextColor(context),
                                iconColor: getTextColor(context),
                                title: Text(
                                  ' Clouds & Dreams',
                                  style: TextStyle(
                                      color: getTextColor(context),
                                      fontSize: ResponsiveWidget.isMobile(
                                              context)
                                          ? width * 0.04
                                          : ResponsiveWidget.isMobileLarge(
                                                  context)
                                              ? width * 0.03
                                              : ResponsiveWidget.isTablet(
                                                      context)
                                                  ? width * 0.02
                                                  : ResponsiveWidget.isDesktop(
                                                          context)
                                                      ? width * 0.02
                                                      : width * 0.03),
                                ),
                                expandedAlignment: Alignment.topLeft,
                                childrenPadding: EdgeInsets.only(
                                    bottom: height * 0.04, left: width * 0.04),
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Introducing Clouds and Dreams, an exquisite online shopping website that specializes in selling a range of kitchen towels, tablecloths, and cushion covers. Each product in the collection is meticulously designed by a talented Indian designer, inspired by the beauty of clouds and dreamlike aesthetics, while incorporating traditional elements.\n\nAt Clouds and Dreams, we believe in infusing your living spaces with ethereal beauty and artistic expression. Our kitchen towels are crafted with care, offering both functionality and a touch of enchantment. Made from high-quality materials, they are designed to be durable and highly absorbent. The towels feature mesmerizing patterns and motifs inspired by the dreamlike allure of clouds, blending seamlessly with traditional Indian designs.\n\nOur tablecloths are designed to transform your dining experience into a magical realm. Whether you're hosting a lavish dinner party or enjoying a peaceful meal with your loved ones, our tablecloths create an ambiance of elegance. Each piece showcases intricate designs that evoke the whimsical nature of clouds and dreams, paying homage to India's rich cultural heritage. With various sizes and shapes available, our tablecloths cater to different dining tables and personal styles.\n\nComplementing our collection, we offer a range of cushion covers that add a touch of enchantment to your living spaces. These covers are adorned with imaginative designs inspired by dreamscapes, infused with traditional Indian aesthetics. With meticulous attention to detail and a commitment to quality, our cushion covers provide a stylish and comfortable accent to your sofas, chairs, or beds.\n\nClouds and Dreams takes pride in presenting the artistic brilliance of our Indian designer. Their creative vision captures the ethereal essence of clouds and dreams, seamlessly blending it with traditional elements. Each product tells a story, inviting you to embrace the enchantment of your surroundings and let your imagination soar.\n\nOur online shopping website provides a seamless and immersive experience. Customers can easily explore our collection, delve into the intricate designs and patterns, and make their selections with confidence. We prioritize customer satisfaction, ensuring prompt delivery and exceptional customer service.\n\nWhether you seek to create a serene kitchen, an enchanting dining experience, or a dreamy living space, Clouds and Dreams is your destination of choice. We invite you to explore our collection of kitchen towels, tablecloths, and cushion covers, meticulously designed by our Indian artist, and bring a touch of cloud-kissed dreams and whimsical beauty into your home.",
                                        style: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: height * 0.02),
                child: Divider(
                  thickness: 0.1,
                  color: getTextColor(context),
                  indent: 20,
                  endIndent: 20,
                )),
            Container(
              margin: EdgeInsets.only(top: height * 0.02),
              width: width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: height * 0.02),
                      child: Text(
                        "Contact Me",
                        style: TextStyle(
                          color: PINK_COLOR,
                          fontSize: ResponsiveWidget.isDesktop(context)
                              ? width * 0.01
                              : ResponsiveWidget.isTablet(context)
                                  ? width * 0.02
                                  : ResponsiveWidget.isMobileLarge(context)
                                      ? width * 0.03
                                      : ResponsiveWidget.isMobile(context)
                                          ? width * 0.05
                                          : width * 0.02,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.sizeOf(context).height * 0.02,
                          horizontal: MediaQuery.sizeOf(context).width * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    StringConstants.name,
                                    style: TextStyle(
                                        color: getTextColor(context),
                                        fontSize: ResponsiveWidget.isDesktop(
                                                context)
                                            ? width * 0.02
                                            : ResponsiveWidget.isTablet(context)
                                                ? width * 0.02
                                                : ResponsiveWidget
                                                        .isMobileLarge(context)
                                                    ? width * 0.02
                                                    : ResponsiveWidget.isMobile(
                                                            context)
                                                        ? width * 0.03
                                                        : width * 0.02,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: height * 0.01),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'G-mail:-',
                                        style: TextStyle(
                                            color: getTextColor(context),
                                            fontSize:
                                                ResponsiveWidget.isDesktop(
                                                        context)
                                                    ? width * 0.01
                                                    : ResponsiveWidget.isTablet(
                                                            context)
                                                        ? width * 0.02
                                                        : ResponsiveWidget
                                                                .isMobileLarge(
                                                                    context)
                                                            ? width * 0.02
                                                            : ResponsiveWidget
                                                                    .isMobile(
                                                                        context)
                                                                ? width * 0.03
                                                                : width * 0.02,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          String? mail =
                                              'vinayakarchit@gmail.com';
                                          final url = 'mailto:$mail';
                                          launchUrlString(url);
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: width * 0.01),
                                          child: Text(
                                            'vinayakarchit@gmail.com',
                                            style: TextStyle(
                                                color: PINK_COLOR,
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: ResponsiveWidget
                                                        .isDesktop(context)
                                                    ? width * 0.01
                                                    : ResponsiveWidget.isTablet(
                                                            context)
                                                        ? width * 0.02
                                                        : ResponsiveWidget
                                                                .isMobileLarge(
                                                                    context)
                                                            ? width * 0.02
                                                            : ResponsiveWidget
                                                                    .isMobile(
                                                                        context)
                                                                ? width * 0.03
                                                                : width * 0.02,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: height * 0.01),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Phone:-',
                                        style: TextStyle(
                                            color: getTextColor(context),
                                            fontSize:
                                                ResponsiveWidget.isDesktop(
                                                        context)
                                                    ? width * 0.01
                                                    : ResponsiveWidget.isTablet(
                                                            context)
                                                        ? width * 0.02
                                                        : ResponsiveWidget
                                                                .isMobileLarge(
                                                                    context)
                                                            ? width * 0.02
                                                            : ResponsiveWidget
                                                                    .isMobile(
                                                                        context)
                                                                ? width * 0.03
                                                                : width * 0.02,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          String? phone = '+91 8853516771';
                                          final url = 'tel:$phone';
                                          launchUrlString(url);
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: width * 0.01),
                                          child: Text(
                                            '+91 8853516771',
                                            style: TextStyle(
                                                color: PINK_COLOR,
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: ResponsiveWidget
                                                        .isDesktop(context)
                                                    ? width * 0.01
                                                    : ResponsiveWidget.isTablet(
                                                            context)
                                                        ? width * 0.02
                                                        : ResponsiveWidget
                                                                .isMobileLarge(
                                                                    context)
                                                            ? width * 0.02
                                                            : ResponsiveWidget
                                                                    .isMobile(
                                                                        context)
                                                                ? width * 0.03
                                                                : width * 0.02,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: height * 0.02),
                                  child: Row(
                                    children: [
                                      MouseRegion(
                                        onHover: (e) {
                                          controller.hoverFB = true;
                                          controller.update();
                                        },
                                        onExit: (event) {
                                          controller.hoverFB = false;
                                          controller.update();
                                        },
                                        child: InkWell(
                                          onTap: () {
                                            String? fb =
                                                'https://www.facebook.com/vinayak.mishra.332345';
                                            launchUrlString(fb);
                                          },
                                          child: Container(
                                              child: FaIcon(
                                                  FontAwesomeIcons.facebook,
                                                  color: controller.hoverFB ==
                                                          true
                                                      ? PINK_COLOR
                                                      : getTextColor(context))),
                                        ),
                                      ),
                                      MouseRegion(
                                        onHover: (e) {
                                          controller.hoverInsta = true;
                                          controller.update();
                                        },
                                        onExit: (event) {
                                          controller.hoverInsta = false;
                                          controller.update();
                                        },
                                        child: InkWell(
                                          onTap: () {
                                            String? insta =
                                                'https://www.instagram.com/vinayak_archit/';
                                            launchUrlString(insta);
                                          },
                                          child: Container(
                                              margin: EdgeInsets.only(
                                                  left: width * 0.02),
                                              child: FaIcon(
                                                  FontAwesomeIcons.instagram,
                                                  color: controller
                                                              .hoverInsta ==
                                                          true
                                                      ? PINK_COLOR
                                                      : getTextColor(context))),
                                        ),
                                      ),
                                      MouseRegion(
                                        onHover: (e) {
                                          controller.hoverLinked = true;
                                          controller.update();
                                        },
                                        onExit: (event) {
                                          controller.hoverLinked = false;
                                          controller.update();
                                        },
                                        child: InkWell(
                                          onTap: () {
                                            String? lin =
                                                'https://www.linkedin.com/in/vinayak-mishra-b611b3217/';
                                            launchUrlString(lin);
                                          },
                                          child: Container(
                                              margin: EdgeInsets.only(
                                                  left: width * 0.02),
                                              child: FaIcon(
                                                  FontAwesomeIcons.linkedin,
                                                  color: controller
                                                              .hoverLinked ==
                                                          true
                                                      ? PINK_COLOR
                                                      : getTextColor(context))),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: height * 0.02),
                        child: Divider(
                          thickness: 0.1,
                          color: getTextColor(context),
                          indent: 20,
                          endIndent: 20,
                        )),
                    Container(
                        margin: EdgeInsets.only(
                            top: height * 0.02, bottom: height * 0.02),
                        child: Text(
                          'Developed by ${StringConstants.name}',
                          style: TextStyle(
                            color: getTextColor(context),
                            fontSize: width * 0.01,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                ),
              ),
            )
          ]),
        ),
      )),
    );
  }

  Widget education(BuildContext context) {
    ScreenSize().init(context);
    var height = ScreenSize.screenHeight;
    var width = ScreenSize.screenWidth;
    return Container(
      width: width,
      margin: EdgeInsets.only(bottom: height! * 0.03),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            margin: EdgeInsets.only(top: height * 0.02),
            width: width,
            decoration: BoxDecoration(
                color: getThemeColor(context),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                    offset: Offset(
                      1.0,
                      1.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: ExpansionTile(
              initiallyExpanded: false,
              tilePadding: EdgeInsets.symmetric(
                  horizontal: width! * 0.04, vertical: height * 0.02),
              collapsedIconColor: getTextColor(context),
              iconColor: getTextColor(context),
              title: Row(
                children: [
                  Flexible(
                    child: Text(
                      'Bachelor of Computer Application',
                      softWrap: true,
                      // style: TextStyle(color: WHITE_COLOR,fontWeight: FontWeight.bold),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: getTextColor(context)),
                    ),
                  ),
                ],
              ),
              expandedAlignment: Alignment.topLeft,
              childrenPadding:
                  EdgeInsets.only(bottom: height * 0.04, left: width * 0.04),
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bareilly College',
                      style: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context)),
                    ),
                    Text(
                      'Bareilly, UP (2022)',
                      style: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context)),
                    ),
                    Text(
                      'Subjects - Computer Science',
                      style: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context)),
                    ),
                  ],
                )
              ],
            ),
          ),
          // Intermediate
          Container(
            margin: EdgeInsets.only(top: height * 0.02),
            width: width,
            decoration: BoxDecoration(
                color: getThemeColor(context),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                    offset: Offset(
                      1.0,
                      1.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: ExpansionTile(
              initiallyExpanded: false,
              tilePadding: EdgeInsets.symmetric(
                  horizontal: width * 0.04, vertical: height * 0.02),
              collapsedIconColor: getTextColor(context),
              iconColor: getTextColor(context),
              title: Row(
                children: [
                  Flexible(
                    child: Text(
                      'InterMediate',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: getTextColor(context)),
                    ),
                  ),
                ],
              ),
              expandedAlignment: Alignment.topLeft,
              childrenPadding:
                  EdgeInsets.only(bottom: height * 0.04, left: width * 0.04),
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sanjay Kumar Saraswati Vidya Mandir Inter College',
                      style: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context)),
                    ),
                    Text(
                      'Shahjahanpur, UP (2019)',
                      style: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context)),
                    ),
                    Text(
                      'Subjects - PCM',
                      style: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context)),
                    ),
                  ],
                )
              ],
            ),
          ),
          // HighSchool
          Container(
            margin: EdgeInsets.only(top: height * 0.02),
            width: width,
            decoration: BoxDecoration(
                color: getThemeColor(context),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                    offset: Offset(
                      1.0,
                      1.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: ExpansionTile(
              initiallyExpanded: false,
              tilePadding: EdgeInsets.symmetric(
                  horizontal: width * 0.04, vertical: height * 0.02),
              collapsedIconColor: getTextColor(context),
              iconColor: getTextColor(context),
              title: Row(
                children: [
                  Flexible(
                    child: Text(
                      'High School',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: getTextColor(context)),
                    ),
                  ),
                ],
              ),
              expandedAlignment: Alignment.topLeft,
              childrenPadding:
                  EdgeInsets.only(bottom: height * 0.04, left: width * 0.04),
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sanjay Kumar Saraswati Vidya Mandir Inter College',
                      style: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context)),
                    ),
                    Text(
                      'Shahjahanpur, UP (2017)',
                      style: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget skills(BuildContext context) {
    ScreenSize().init(context);
    var height = ScreenSize.screenHeight;
    var width = ScreenSize.screenWidth;
    return Container(
      width: width,
      margin: EdgeInsets.only(bottom: height! * 0.03),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Container(
            margin: EdgeInsets.only(top: height * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Software Development",
                  style: TextStyle(
                      color: getWhiteColorLight(context),
                      fontSize: ResponsiveWidget.isDesktop(context)
                          ? width! * 0.01
                          : ResponsiveWidget.isTablet(context)
                              ? width! * 0.015
                              : ResponsiveWidget.isMobileLarge(context)
                                  ? width! * 0.03
                                  : ResponsiveWidget.isMobile(context)
                                      ? width! * 0.03
                                      : width! * 0.03,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.normal),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.02),
                  child: LinearPercentIndicator(
                    width: width * 0.9,
                    lineHeight: height * 0.02,
                    percent: 0.9,
                    center: Text("90.0%",
                        style: TextStyle(
                            color: getWhiteColorLight(context),
                            fontSize: ResponsiveWidget.isDesktop(context)
                                ? width * 0.01
                                : ResponsiveWidget.isTablet(context)
                                    ? width * 0.013
                                    : ResponsiveWidget.isMobileLarge(context)
                                        ? width * 0.02
                                        : ResponsiveWidget.isMobile(context)
                                            ? width * 0.02
                                            : width * 0.01,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold)),
                    backgroundColor: BLACK_COLOR,
                    linearGradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(200, 25, 1, 1),
                        Color.fromRGBO(240, 41, 129, 1),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: [0, 0.6],
                    ),
                    animation: true,
                    animationDuration: 500,
                    barRadius: const Radius.circular(10.0),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: height * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Flutter and Dart",
                  style: TextStyle(
                      color: getWhiteColorLight(context),
                      fontSize: ResponsiveWidget.isDesktop(context)
                          ? width * 0.01
                          : ResponsiveWidget.isTablet(context)
                              ? width * 0.015
                              : ResponsiveWidget.isMobileLarge(context)
                                  ? width * 0.03
                                  : ResponsiveWidget.isMobile(context)
                                      ? width * 0.03
                                      : width * 0.03,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.normal),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.02),
                  child: LinearPercentIndicator(
                    width: width * 0.9,
                    lineHeight: height * 0.02,
                    percent: 0.85,
                    center: Text("85.0%",
                        style: TextStyle(
                            color: getWhiteColorLight(context),
                            fontSize: ResponsiveWidget.isDesktop(context)
                                ? width * 0.01
                                : ResponsiveWidget.isTablet(context)
                                    ? width * 0.013
                                    : ResponsiveWidget.isMobileLarge(context)
                                        ? width * 0.02
                                        : ResponsiveWidget.isMobile(context)
                                            ? width * 0.02
                                            : width * 0.01,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold)),
                    backgroundColor: BLACK_COLOR,
                    linearGradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(200, 25, 1, 1),
                        Color.fromRGBO(240, 41, 129, 1),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: [0, 0.6],
                    ),
                    animation: true,
                    animationDuration: 500,
                    barRadius: const Radius.circular(10.0),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: height * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kotlin",
                  style: TextStyle(
                      color: getWhiteColorLight(context),
                      fontSize: ResponsiveWidget.isDesktop(context)
                          ? width * 0.01
                          : ResponsiveWidget.isTablet(context)
                              ? width * 0.015
                              : ResponsiveWidget.isMobileLarge(context)
                                  ? width * 0.03
                                  : ResponsiveWidget.isMobile(context)
                                      ? width * 0.03
                                      : width * 0.03,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.normal),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.02),
                  child: LinearPercentIndicator(
                    width: width * 0.9,
                    lineHeight: height * 0.02,
                    percent: 0.8,
                    center: Text("80.0%",
                        style: TextStyle(
                            color: getWhiteColorLight(context),
                            fontSize: ResponsiveWidget.isDesktop(context)
                                ? width * 0.01
                                : ResponsiveWidget.isTablet(context)
                                    ? width * 0.013
                                    : ResponsiveWidget.isMobileLarge(context)
                                        ? width * 0.02
                                        : ResponsiveWidget.isMobile(context)
                                            ? width * 0.02
                                            : width * 0.01,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold)),
                    backgroundColor: BLACK_COLOR,
                    linearGradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(200, 25, 1, 1),
                        Color.fromRGBO(240, 41, 129, 1),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: [0, 0.6],
                    ),
                    animation: true,
                    animationDuration: 500,
                    barRadius: const Radius.circular(10.0),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: height * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "HTML",
                  style: TextStyle(
                      color: getWhiteColorLight(context),
                      fontSize: ResponsiveWidget.isDesktop(context)
                          ? width * 0.01
                          : ResponsiveWidget.isTablet(context)
                              ? width * 0.015
                              : ResponsiveWidget.isMobileLarge(context)
                                  ? width * 0.03
                                  : ResponsiveWidget.isMobile(context)
                                      ? width * 0.03
                                      : width * 0.03,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.normal),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.02),
                  child: LinearPercentIndicator(
                    width: width * 0.9,
                    lineHeight: height * 0.02,
                    percent: 0.82,
                    center: Text("82.0%",
                        style: TextStyle(
                            color: getWhiteColorLight(context),
                            fontSize: ResponsiveWidget.isDesktop(context)
                                ? width * 0.01
                                : ResponsiveWidget.isTablet(context)
                                    ? width * 0.013
                                    : ResponsiveWidget.isMobileLarge(context)
                                        ? width * 0.02
                                        : ResponsiveWidget.isMobile(context)
                                            ? width * 0.02
                                            : width * 0.01,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold)),
                    backgroundColor: BLACK_COLOR,
                    linearGradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(200, 25, 1, 1),
                        Color.fromRGBO(240, 41, 129, 1),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: [0, 0.6],
                    ),
                    animation: true,
                    animationDuration: 500,
                    barRadius: const Radius.circular(10.0),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: height * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CSS",
                  style: TextStyle(
                      color: getWhiteColorLight(context),
                      fontSize: ResponsiveWidget.isDesktop(context)
                          ? width * 0.01
                          : ResponsiveWidget.isTablet(context)
                              ? width * 0.015
                              : ResponsiveWidget.isMobileLarge(context)
                                  ? width * 0.03
                                  : ResponsiveWidget.isMobile(context)
                                      ? width * 0.03
                                      : width * 0.03,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.normal),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.02),
                  child: LinearPercentIndicator(
                    width: width * 0.9,
                    lineHeight: height * 0.02,
                    percent: 0.7,
                    center: Text("70.0%",
                        style: TextStyle(
                            color: getWhiteColorLight(context),
                            fontSize: ResponsiveWidget.isDesktop(context)
                                ? width * 0.01
                                : ResponsiveWidget.isTablet(context)
                                    ? width * 0.013
                                    : ResponsiveWidget.isMobileLarge(context)
                                        ? width * 0.02
                                        : ResponsiveWidget.isMobile(context)
                                            ? width * 0.02
                                            : width * 0.01,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold)),
                    backgroundColor: BLACK_COLOR,
                    linearGradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(200, 25, 1, 1),
                        Color.fromRGBO(240, 41, 129, 1),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: [0, 0.6],
                    ),
                    animation: true,
                    animationDuration: 500,
                    barRadius: const Radius.circular(10.0),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: height * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Wordpress",
                  style: TextStyle(
                      color: getWhiteColorLight(context),
                      fontSize: ResponsiveWidget.isDesktop(context)
                          ? width * 0.01
                          : ResponsiveWidget.isTablet(context)
                              ? width * 0.015
                              : ResponsiveWidget.isMobileLarge(context)
                                  ? width * 0.03
                                  : ResponsiveWidget.isMobile(context)
                                      ? width * 0.03
                                      : width * 0.03,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.normal),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.02),
                  child: LinearPercentIndicator(
                    width: width * 0.9,
                    lineHeight: height * 0.02,
                    percent: 0.78,
                    center: Text("78.0%",
                        style: TextStyle(
                            color: getWhiteColorLight(context),
                            fontSize: ResponsiveWidget.isDesktop(context)
                                ? width * 0.01
                                : ResponsiveWidget.isTablet(context)
                                    ? width * 0.013
                                    : ResponsiveWidget.isMobileLarge(context)
                                        ? width * 0.02
                                        : ResponsiveWidget.isMobile(context)
                                            ? width * 0.02
                                            : width * 0.01,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold)),
                    backgroundColor: BLACK_COLOR,
                    linearGradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(200, 25, 1, 1),
                        Color.fromRGBO(240, 41, 129, 1),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: [0, 0.6],
                    ),
                    animation: true,
                    animationDuration: 500,
                    barRadius: const Radius.circular(10.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Communication",
                        style: TextStyle(
                            color: getWhiteColorLight(context),
                            fontSize: ResponsiveWidget.isDesktop(context)
                                ? width * 0.01
                                : ResponsiveWidget.isTablet(context)
                                    ? width * 0.015
                                    : ResponsiveWidget.isMobileLarge(context)
                                        ? width * 0.03
                                        : ResponsiveWidget.isMobile(context)
                                            ? width * 0.03
                                            : width * 0.03,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.normal),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: height * 0.02),
                        child: LinearPercentIndicator(
                          width: width * 0.9,
                          lineHeight: height * 0.02,
                          percent: 0.88,
                          center: Text("88.0%",
                              style: TextStyle(
                                  color: getWhiteColorLight(context),
                                  fontSize: ResponsiveWidget.isDesktop(context)
                                      ? width * 0.01
                                      : ResponsiveWidget.isTablet(context)
                                          ? width * 0.013
                                          : ResponsiveWidget.isMobileLarge(
                                                  context)
                                              ? width * 0.02
                                              : ResponsiveWidget.isMobile(
                                                      context)
                                                  ? width * 0.02
                                                  : width * 0.01,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.bold)),
                          backgroundColor: BLACK_COLOR,
                          linearGradient: const LinearGradient(
                            colors: [
                              Color.fromRGBO(200, 25, 1, 1),
                              Color.fromRGBO(240, 41, 129, 1),
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            stops: [0, 0.6],
                          ),
                          animation: true,
                          animationDuration: 500,
                          barRadius: const Radius.circular(10.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Android Development",
                        style: TextStyle(
                            color: getWhiteColorLight(context),
                            fontSize: ResponsiveWidget.isDesktop(context)
                                ? width * 0.01
                                : ResponsiveWidget.isTablet(context)
                                    ? width * 0.015
                                    : ResponsiveWidget.isMobileLarge(context)
                                        ? width * 0.03
                                        : ResponsiveWidget.isMobile(context)
                                            ? width * 0.03
                                            : width * 0.03,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.normal),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: height * 0.02),
                        child: LinearPercentIndicator(
                          width: width * 0.9,
                          lineHeight: height * 0.02,
                          percent: 0.7,
                          center: Text("70.0%",
                              style: TextStyle(
                                  color: getWhiteColorLight(context),
                                  fontSize: ResponsiveWidget.isDesktop(context)
                                      ? width * 0.01
                                      : ResponsiveWidget.isTablet(context)
                                          ? width * 0.013
                                          : ResponsiveWidget.isMobileLarge(
                                                  context)
                                              ? width * 0.02
                                              : ResponsiveWidget.isMobile(
                                                      context)
                                                  ? width * 0.02
                                                  : width * 0.01,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.bold)),
                          backgroundColor: BLACK_COLOR,
                          linearGradient: const LinearGradient(
                            colors: [
                              Color.fromRGBO(200, 25, 1, 1),
                              Color.fromRGBO(240, 41, 129, 1),
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            stops: [0, 0.6],
                          ),
                          animation: true,
                          animationDuration: 500,
                          barRadius: const Radius.circular(10.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget experience(BuildContext context) {
    ScreenSize().init(context);
    var height = ScreenSize.screenHeight;
    var width = ScreenSize.screenWidth;
    return SizedBox(
      width: width,
      // height: height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Flutter Developer NPST
            Container(
              margin: EdgeInsets.only(top: height! * 0.02),
              width: width,
              decoration: BoxDecoration(
                  color: getThemeColor(context),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                      offset: Offset(
                        1.0,
                        1.0,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              child: ExpansionTile(
                initiallyExpanded: false,
                tilePadding: EdgeInsets.symmetric(
                    horizontal: width! * 0.04, vertical: height * 0.02),
                collapsedIconColor: getTextColor(context),
                iconColor: getTextColor(context),
                title: Row(
                  children: [
                    Flexible(
                      child: Text(
                        'Network People Services Technologies - Flutter Developer',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: getTextColor(context)),
                      ),
                    ),
                  ],
                ),
                subtitle: Container(
                  margin: EdgeInsets.only(top: height * 0.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Noida, India',
                          style: TextStyle(
                              color: getWhiteColorLight(context),
                              fontSize: ResponsiveWidget.isDesktop(context)
                                  ? width * 0.01
                                  : ResponsiveWidget.isTablet(context)
                                      ? width * 0.02
                                      : ResponsiveWidget.isMobileLarge(context)
                                          ? width * 0.03
                                          : ResponsiveWidget.isMobile(context)
                                              ? width * 0.03
                                              : width * 0.03,
                              fontWeight: FontWeight.bold)),
                      Text('01/2024 - Current',
                          style: TextStyle(
                              color: getWhiteColorLight(context),
                              fontSize: ResponsiveWidget.isDesktop(context)
                                  ? width * 0.01
                                  : ResponsiveWidget.isTablet(context)
                                      ? width * 0.02
                                      : ResponsiveWidget.isMobileLarge(context)
                                          ? width * 0.03
                                          : ResponsiveWidget.isMobile(context)
                                              ? width * 0.03
                                              : width * 0.03,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                expandedAlignment: Alignment.topLeft,
                childrenPadding:
                    EdgeInsets.only(bottom: height * 0.04, left: width * 0.04),
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                          child: Row(children: [
                        Flexible(
                          child: Text("\u2022  Working on Canara Ai1 App",
                              style:
                                  TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context))),
                        )
                      ])),
                      Container(
                          child: Row(children: [
                        Flexible(
                          child: Text(
                              "\u2022  Working with Mobile Team and maintaining Canara Ai1 App",
                              style:
                                  TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context))),
                        )
                      ])),
                      Container(
                          child: Row(children: [
                        Flexible(
                          child: Text("\u2022  Worked on IRCTC module",
                              style:
                                  TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context))),
                        )
                      ])),
                      Container(
                          child: Row(children: [
                        Flexible(
                          child: Text(
                              "\u2022  Implemented source code of the new application, completing it within tight deadlines.",
                              style:
                                  TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context))),
                        )
                      ])),
                    ],
                  ),
                ],
              ),
            ),
            // Application Developer Datametricks
            Container(
              margin: EdgeInsets.only(top: height * 0.02),
              width: width,
              decoration: BoxDecoration(
                  color: getThemeColor(context),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                      offset: Offset(
                        1.0,
                        1.0,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              child: ExpansionTile(
                initiallyExpanded: false,
                tilePadding: EdgeInsets.symmetric(
                    horizontal: width * 0.04, vertical: height * 0.02),
                collapsedIconColor: getTextColor(context),
                iconColor: getTextColor(context),
                title: Row(
                  children: [
                    Flexible(
                      child: Text(
                        'Datametricks Consulting Private Limited - Application Developer',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: getTextColor(context)),
                      ),
                    ),
                  ],
                ),
                subtitle: Container(
                  margin: EdgeInsets.only(top: height * 0.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Noida, India',
                          style: TextStyle(
                              color: getWhiteColorLight(context),
                              fontSize: ResponsiveWidget.isDesktop(context)
                                  ? width * 0.01
                                  : ResponsiveWidget.isTablet(context)
                                      ? width * 0.02
                                      : ResponsiveWidget.isMobileLarge(context)
                                          ? width * 0.03
                                          : ResponsiveWidget.isMobile(context)
                                              ? width * 0.03
                                              : width * 0.03,
                              fontWeight: FontWeight.bold)),
                      Text('06/2022 - 12/2023',
                          style: TextStyle(
                              color: getWhiteColorLight(context),
                              fontSize: ResponsiveWidget.isDesktop(context)
                                  ? width * 0.01
                                  : ResponsiveWidget.isTablet(context)
                                      ? width * 0.02
                                      : ResponsiveWidget.isMobileLarge(context)
                                          ? width * 0.03
                                          : ResponsiveWidget.isMobile(context)
                                              ? width * 0.03
                                              : width * 0.03,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                expandedAlignment: Alignment.topLeft,
                childrenPadding:
                    EdgeInsets.only(bottom: height * 0.04, left: width * 0.04),
                children: <Widget>[
                  Column(
                    children: [
                      Row(children: [
                        Flexible(
                          child: Text(
                              "\u2022  Worked as Application Developer using Flutter and Dart.",
                              style:
                                  TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context))),
                        )
                      ]),
                      Row(children: [
                        Flexible(
                          child: Text(
                              "\u2022  Developed an E-Commerce website named Clouds & Dreams using Wordpress.",
                              style:
                                  TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context))),
                        )
                      ]),
                      Container(
                          child: Row(children: [
                        Flexible(
                          child: Text(
                              "\u2022  Maintenance of SmartCare app using Android Studio and Kotlin.",
                              style:
                                  TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context))),
                        )
                      ])),
                      Row(children: [
                        Flexible(
                          child: Text(
                              "\u2022  Implemented source code of the new application, completing itwithin tight deadlines.",
                              style:
                                  TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context))),
                        )
                      ]),
                    ],
                  ),
                ],
              ),
            ),
            // Internship Datametricks
            Container(
              margin: EdgeInsets.only(top: height * 0.02),
              width: width,
              decoration: BoxDecoration(
                  color: getThemeColor(context),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                      offset: Offset(
                        1.0,
                        1.0,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              child: ExpansionTile(
                initiallyExpanded: false,
                tilePadding: EdgeInsets.symmetric(
                    horizontal: width * 0.04, vertical: height * 0.02),
                collapsedIconColor: getTextColor(context),
                iconColor: getTextColor(context),
                title: Row(
                  children: [
                    Flexible(
                      child: Text(
                        'Datametricks Consulting Private Limited - Internship',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: getTextColor(context)),
                      ),
                    ),
                  ],
                ),
                subtitle: Container(
                  margin: EdgeInsets.only(top: height * 0.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Noida, India',
                          style: TextStyle(
                              color: getWhiteColorLight(context),
                              fontSize: ResponsiveWidget.isDesktop(context)
                                  ? width * 0.01
                                  : ResponsiveWidget.isTablet(context)
                                      ? width * 0.02
                                      : ResponsiveWidget.isMobileLarge(context)
                                          ? width * 0.03
                                          : ResponsiveWidget.isMobile(context)
                                              ? width * 0.03
                                              : width * 0.03,
                              fontWeight: FontWeight.bold)),
                      Text('03/2022 - 05/2022',
                          style: TextStyle(
                              color: getWhiteColorLight(context),
                              fontSize: ResponsiveWidget.isDesktop(context)
                                  ? width * 0.01
                                  : ResponsiveWidget.isTablet(context)
                                      ? width * 0.02
                                      : ResponsiveWidget.isMobileLarge(context)
                                          ? width * 0.03
                                          : ResponsiveWidget.isMobile(context)
                                              ? width * 0.03
                                              : width * 0.03,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                expandedAlignment: Alignment.topLeft,
                childrenPadding:
                    EdgeInsets.only(bottom: height * 0.04, left: width * 0.04),
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                            Flexible(
                              child: Text(
                                  "\u2022  Communicated with clients regularly to gain a comprehensive understanding of program requirements.",
                                  style: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context))),
                            )
                          ])),
                      Container(
                          child: Row(children: [
                        Flexible(
                          child: Text(
                              "\u2022  Maintained in-depth knowledge of new technologies and development tools.",
                              style:
                                  TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context))),
                        )
                      ])),
                      Container(
                          child: Row(children: [
                        Flexible(
                          child: Text("\u2022  Used Android Studio and Kotlin.",
                              style:
                                  TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context))),
                        )
                      ])),
                      Container(
                          child: Row(children: [
                        Flexible(
                          child: Text(
                              "\u2022  Developed communication skills and adaptabilty in myself.",
                              style:
                                  TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: getTextColor(context))),
                        )
                      ])),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
