import 'package:flutter/material.dart';
import 'package:keleya/_constants/_colors.dart';
import 'package:keleya/_constants/_font_sizes.dart';
import 'package:keleya/_constants/_fonts.dart';

class CustomTextStyles {
  static TextStyle title({Color color = CustomColors.black}) {
    return TextStyle(
      fontFamily: CustomFontsPath.latoBlack,
      fontSize: CustomFontSizes.large,
      color: color,
    );
  }

  static TextStyle title1_2({Color color = CustomColors.black}) {
    return TextStyle(
      fontFamily: CustomFontsPath.latoBlack,
      fontWeight: FontWeight.w600,
      fontSize: CustomFontSizes.large2,
      color: color,
    );
  }

  static TextStyle title2({Color color = CustomColors.black}) {
    return TextStyle(
      fontFamily: CustomFontsPath.latoBlack,
      fontWeight: FontWeight.w600,
      fontSize: CustomFontSizes.regularToLarge,
      color: color,
    );
  }

  static TextStyle title3({Color color = CustomColors.black}) {
    return TextStyle(
      fontFamily: CustomFontsPath.latoBlack,
      fontWeight: FontWeight.w600,
      fontSize: CustomFontSizes.mediumToRegular,
      color: color,
    );
  }

  static TextStyle button({Color color = CustomColors.black}) {
    return TextStyle(
      fontFamily: CustomFontsPath.latoRegular,
      fontWeight: FontWeight.w400,
      fontSize: CustomFontSizes.regular,
      color: color,
    );
  }

  static TextStyle error({Color color = CustomColors.grey}) {
    return TextStyle(
      fontFamily: CustomFontsPath.latoLight,
      fontWeight: FontWeight.w200,
      fontSize: CustomFontSizes.regular,
      color: color,
    );
  }

  static TextStyle caption({Color color = CustomColors.black}) {
    return TextStyle(
      fontFamily: CustomFontsPath.latoRegular,
      fontWeight: FontWeight.w400,
      fontSize: CustomFontSizes.regular,
      color: color,
    );
  }

  static const TextStyle textfieldHint = TextStyle(
    fontFamily: CustomFontsPath.latoRegular,
    fontWeight: FontWeight.w400,
    fontSize: CustomFontSizes.mediumToRegular,
    color: CustomColors.grey,
  );
  static const TextStyle textfieldLabel = TextStyle(
    fontFamily: CustomFontsPath.latoRegular,
    fontWeight: FontWeight.w400,
    fontSize: CustomFontSizes.small,
    color: CustomColors.grey,
  );
  static const TextStyle textfield = TextStyle(
    fontFamily: CustomFontsPath.latoRegular,
    fontWeight: FontWeight.w400,
    fontSize: CustomFontSizes.mediumToRegular,
    color: CustomColors.black,
  );

  static const TextStyle checkbox = TextStyle(
    fontFamily: CustomFontsPath.latoRegular,
    fontWeight: FontWeight.w500,
    fontSize: CustomFontSizes.small,
    color: CustomColors.grey,
  );
  static const TextStyle checkboxLink = TextStyle(
    fontFamily: CustomFontsPath.latoRegular,
    fontWeight: FontWeight.w500,
    fontSize: CustomFontSizes.small,
    color: CustomColors.purple,
  );

  static const TextStyle snackbar = TextStyle(
    fontFamily: CustomFontsPath.latoRegular,
    fontWeight: FontWeight.w500,
    fontSize: CustomFontSizes.medium,
    color: CustomColors.white,
  );
}
