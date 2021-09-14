import 'dart:ui';

import 'package:flutter/material.dart';

abstract class Strings {
  static const String appName = "SimpleGallery";
  static const String inDevelopment = "In development";

  static const String mainTabFeed = "Feed";
  static const String mainTabUsers = "Users";
  static const String mainTabAlbums = "Albums";
}

abstract class Styles {
  static ThemeData get lightTheme {
    ThemeData baseTheme = ThemeData.light();
    return baseTheme.copyWith(
      colorScheme: baseTheme.colorScheme.copyWith(
        primary: MyColors.primary,
        primaryVariant: MyColors.primaryVariant,
        onPrimary: MyColors.onPrimary,
        secondary: MyColors.secondary,
        secondaryVariant: MyColors.secondaryVariant,
        onSecondary: MyColors.onSecondary,
        background: MyColors.background,
        onBackground: MyColors.onBackground
      ),
      textTheme: textTheme,
    );
  }
  static TextTheme get textTheme {
    TextTheme baseTheme = ThemeData.light().textTheme;
    return baseTheme.copyWith(
      bodyText2: textCommonStyle
    );
  }
  static const TextStyle textCommonStyle = TextStyle(
    color: MyColors.onBackground,
    fontFamily: "Raleway",
    fontSize: Dimens.text
  );
  static TextStyle textHeaderStyle = textCommonStyle.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: Dimens.textHeader
  );
}

abstract class MyColors {
  static const primary = Color(0xffc62828);
  static const primaryVariant = Color(0xff8e0000);
  static const secondary = Color(0xff7cb342);
  static const secondaryVariant = Color(0xffaee571);
  static const background = Color(0xffffffff);
  static const onPrimary = Color(0xffffffff);
  static const onSecondary = Color(0xff000000);
  static const onBackground = Color(0xff000000);
}

abstract class Dimens {
  static const text = 16.0;
  static const textHeader = 18.0;

  static const marginDefault = 10.0;
}

abstract class Const {
  static const apiUrl = "https://jsonplaceholder.typicode.com";
}