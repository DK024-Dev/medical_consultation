import 'package:flutter/material.dart';

class AppColors {
  factory AppColors() {
    return _singleton;
  }

  AppColors._internal();
  static final AppColors _singleton = AppColors._internal();
  final Color redColor = const Color(0xffE71818);
  final Color greenColor = const Color(0xff0BAC25);
  final Color accentGreyColor = const Color.fromARGB(250, 250, 250, 250);
  final Color whiteColor = Colors.white;
  final Color blackColor = Colors.black;
  final Color greyColor = Colors.grey;
  final Color blueColor = Colors.blue.shade700;
}
