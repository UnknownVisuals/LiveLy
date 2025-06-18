import 'package:flutter/material.dart';
import 'package:lively/utils/constants/colors.dart';
import 'package:lively/utils/constants/sizes.dart';

/* -- Light & Dark Outlined Button Themes -- */
class REYOutlinedButtonTheme {
  REYOutlinedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: REYColors.dark,
      side: const BorderSide(color: REYColors.borderPrimary),
      textStyle: const TextStyle(
        fontSize: 16,
        color: REYColors.black,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: REYSizes.buttonHeight,
        horizontal: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(REYSizes.buttonRadius),
      ),
    ),
  );
}
