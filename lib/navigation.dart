import 'package:flutter/material.dart';
import 'package:simple_gallery/ui/screens/main_screen.dart';

abstract class Navigation {
  static String mainScreen = "/";
  static final routes = {
    mainScreen: (BuildContext context) => MainScreen()
  };
}
