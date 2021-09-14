import 'package:flutter/material.dart';
import 'package:simple_gallery/navigation.dart';

import 'const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      theme: Styles.lightTheme,
      routes: Navigation.routes,
      initialRoute: Navigation.mainScreen
    );
  }
}
