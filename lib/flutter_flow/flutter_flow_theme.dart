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

  Color white;
  Color font;
  Color links;
  Color dred;
  Color customColor1;

  TextStyle get title1 => GoogleFonts.getFont(
        'Oswald',
        color: primaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      );
  TextStyle get title2 => GoogleFonts.getFont(
        'Oswald',
        color: primaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      );
  TextStyle get title3 => GoogleFonts.getFont(
        'Oswald',
        color: primaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      );
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Oswald',
        color: primaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      );
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Oswald',
        color: primaryColor,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Oswald',
        color: primaryColor,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Oswald',
        color: primaryColor,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
}

class LightModeTheme extends FlutterFlowTheme {
  Color primaryColor = const Color(0xFF000000);
  Color secondaryColor = const Color(0xFFD65500);
  Color tertiaryColor = const Color(0xFFFFFFFF);
  Color alternate = const Color(0x00000000);
  Color primaryBackground = const Color(0x00000000);
  Color secondaryBackground = const Color(0x00000000);
  Color primaryText = const Color(0x00000000);
  Color secondaryText = const Color(0x00000000);

  Color white = Color(0xFFFFFFFF);
  Color font = Color(0xFF333745);
  Color links = Color(0xFF0A3771);
  Color dred = Color(0xFFAF3939);
  Color customColor1 = Color(0xFFF4F1DE);
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
