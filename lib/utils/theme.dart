import 'package:flutter/material.dart';
import 'package:lively/utils/constants/colors.dart';
import 'package:lively/utils/theme/widget_theme.dart/checkbox_theme.dart';
import 'package:lively/utils/theme/widget_theme.dart/elevated_button_theme.dart';
import 'package:lively/utils/theme/widget_theme.dart/outline_button_theme.dart';
import 'package:lively/utils/theme/widget_theme.dart/text_field_theme.dart';
import 'package:lively/utils/theme/widget_theme.dart/text_theme.dart';

class REYAppTheme {
  REYAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: REYColors.grey,
    brightness: Brightness.light,
    primaryColor: REYColors.primary,
    textTheme: REYTextTheme.lightTextTheme,
    scaffoldBackgroundColor: REYColors.white,
    checkboxTheme: REYCheckboxTheme.lightCheckboxTheme,
    elevatedButtonTheme: REYElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: REYOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: REYTextFormFieldTheme.lightInputDecorationTheme,
  );
}
