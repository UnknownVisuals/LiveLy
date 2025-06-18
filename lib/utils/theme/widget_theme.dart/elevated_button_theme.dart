import 'package:flutter/material.dart';
import 'package:lively/utils/constants/colors.dart';
import 'package:lively/utils/constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class REYElevatedButtonTheme {
  REYElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: REYColors.light,
      backgroundColor: REYColors.primary,
      disabledForegroundColor: REYColors.darkGrey,
      disabledBackgroundColor: REYColors.buttonDisabled,
      side: const BorderSide(color: REYColors.primary),
      padding: const EdgeInsets.symmetric(vertical: REYSizes.buttonHeight),
      textStyle: const TextStyle(
        fontSize: 16,
        color: REYColors.textWhite,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(REYSizes.buttonRadius),
      ),
    ),
  );
}
