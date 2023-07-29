import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/home.dart';
import 'package:flutter_application_1/Screens/home_binding.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'routes/pages.dart';
import 'themes/color_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Web App',
      theme: ThemeColor().themeData,
      home: Home(),
      initialBinding: HomeBinding(),
      getPages: AppPages.pages,
    );
  }
}
