import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late FocusNode home;
  late FocusNode features;
  late FocusNode portfolio;
  late FocusNode resume;
  late FocusNode companies;
  late FocusNode contact;

  late ScrollController newcontroller = ScrollController();

  bool hoverFB = false;
  bool hoverInsta = false;
  bool hoverLinked = false;

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Education'),
    Tab(text: 'Professional Skills'),
    Tab(text: 'Experience'),
  ];
  late TabController tabController;
  int activeIndex = 0;

  HomeController() {
    tabController = TabController(length: myTabs.length, vsync: this);
    newcontroller = ScrollController();
  }

  @override
  void onInit() {
    home = FocusNode();
    features = FocusNode();
    portfolio = FocusNode();
    resume = FocusNode();
    companies = FocusNode();
    contact = FocusNode();
    super.onInit();
  }
}
