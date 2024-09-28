import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/home.dart';
import 'package:flutter_application_1/Screens/home_binding.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'routes/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'vinayak_portfolio',
      home: const Home(),
      themeMode: ThemeMode.system,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialBinding: HomeBinding(),
      getPages: AppPages.pages,
    );
  }
}
