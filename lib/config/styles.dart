import 'package:flutter/material.dart';
import 'package:my_words/config/size_config.dart';

class AppTheme {
  AppTheme._();

  static const Color mainBackgroundColor = Color(0xFFFFF8EC);
  static const Color topBarBackgroundColor = Color(0xFFFFD973);
  static const Color selectedTabBackgroundColor = Color(0xFFFFC444);
  static const Color unSelectedTabBackgroundColor = Color(0xFFFFFFFC);
  static const Color subTitleTextColor = Color(0xFF9F987F);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppTheme.topBarBackgroundColor,
    scaffoldBackgroundColor: AppTheme.mainBackgroundColor,
    backgroundColor: AppTheme.mainBackgroundColor,
    brightness: Brightness.light,
    textTheme: lightTextTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    //backgroundColor: Colors.grey,
    brightness: Brightness.dark,
    textTheme: darkTextTheme,
  );

  static final TextTheme lightTextTheme = TextTheme(
    headline6: _titleLight,
    subtitle2: _subTitleLight,
    button: _buttonLight,
    headline4: _greetingLight, //display1
    headline3: _searchLight, //display2
    bodyText2: _selectedTabLight, //body1
    bodyText1: _unSelectedTabLight,
  );

  static final TextTheme darkTextTheme = TextTheme(
    headline6: _titleDark,
    subtitle2: _subTitleDark,
    button: _buttonDark,
    headline4: _greetingDark,
    headline3: _searchDark,
    bodyText2: _selectedTabDark,
    bodyText1: _unSelectedTabDark,
  );

  static final TextStyle _titleLight = TextStyle(
    color: Colors.white,
    fontSize: 2.5 * SizeConfig.textMultiplier, // 2* 7.6 = 15
  );

  static final TextStyle _subTitleLight = TextStyle(
    color: subTitleTextColor, //subTitleTextColor Colors.black
    fontSize: 2 * SizeConfig.textMultiplier, //2* 7.6 = 15
    height: 1.5,
  );

  static final TextStyle _buttonLight = TextStyle(
    color: Colors.white,
    fontSize: 2.5 * SizeConfig.textMultiplier, //2.5 * 7.6
  );

  static final TextStyle _greetingLight = TextStyle(
    color: Colors.black,
    fontSize: 2.0 * SizeConfig.textMultiplier,
  );

  static final TextStyle _searchLight = TextStyle(
    color: Colors.black,
    fontSize: 2.3 * SizeConfig.textMultiplier,
  );

  static final TextStyle _selectedTabLight = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 2 * SizeConfig.textMultiplier,
  );

  static final TextStyle _unSelectedTabLight = TextStyle(
    color: Colors.grey,
    fontSize: 2 * SizeConfig.textMultiplier,
  );

  static final TextStyle _titleDark =
      _titleLight.copyWith(color: Colors.yellow);

  static final TextStyle _subTitleDark =
      _subTitleLight.copyWith(color: Colors.white70);

  static final TextStyle _buttonDark =
      _buttonLight.copyWith(color: Colors.black);

  static final TextStyle _greetingDark =
      _greetingLight.copyWith(color: Colors.black);

  static final TextStyle _searchDark =
      _searchLight.copyWith(color: Colors.black);

  static final TextStyle _selectedTabDark =
      _selectedTabLight.copyWith(color: Colors.white);

  static final TextStyle _unSelectedTabDark =
      _unSelectedTabLight.copyWith(color: Colors.white70);
}
