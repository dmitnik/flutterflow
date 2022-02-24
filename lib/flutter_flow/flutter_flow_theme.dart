// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) => LightModeTheme();

  Color primaryColor;
  Color secondaryColor;
  Color tertiaryColor;
  Color alternate;
  Color primaryBackground;
  Color secondaryBackground;
  Color primaryText;
  Color secondaryText;

  Color font;
  Color linksbuttons;
  Color dred;
  Color customColor1;
  Color silverbg;

  TextStyle get title1 => GoogleFonts.getFont(
        'Oswald',
        color: primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      );
  TextStyle get title2 => GoogleFonts.getFont(
        'Oswald',
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 16,
        fontStyle: FontStyle.normal,
      );
  TextStyle get title3 => GoogleFonts.getFont(
        'Oswald',
        color: primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      );
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Oswald',
        color: primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 15,
      );
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Oswald',
        color: secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 15,
      );
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Oswald',
        color: primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12,
      );
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Oswald',
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 12,
      );
}

class LightModeTheme extends FlutterFlowTheme {
  Color primaryColor = const Color(0xFF225580);
  Color secondaryColor = const Color(0xFFFF5722);
  Color tertiaryColor = const Color(0xFFFFFFFF);
  Color alternate = const Color(0xFF0D0D0D);
  Color primaryBackground = const Color(0xFFFAF8F9);
  Color secondaryBackground = const Color(0xFF2D2F45);
  Color primaryText = const Color(0xFF141115);
  Color secondaryText = const Color(0xFFFAF8F9);

  Color font = Color(0xFF477E93);
  Color linksbuttons = Color(0xFF023E8A);
  Color dred = Color(0xFFD15E4D);
  Color customColor1 = Color(0xFFF4F1DE);
  Color silverbg = Color(0xFFADB9AE);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String fontFamily,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    bool useGoogleFonts = true,
    double lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              height: lineHeight,
            );
}
