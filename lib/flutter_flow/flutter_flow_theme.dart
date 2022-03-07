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
        fontSize: 16,
      );
  TextStyle get title2 => GoogleFonts.getFont(
        'Oswald',
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 15,
        fontStyle: FontStyle.normal,
      );
  TextStyle get title3 => GoogleFonts.getFont(
        'Oswald',
        color: primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 15,
      );
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Oswald',
        color: primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Oswald',
        color: secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
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
  Color primaryColor = const Color(0xFF245288);
  Color secondaryColor = const Color(0xFFDC5F09);
  Color tertiaryColor = const Color(0xFFE9E9E9);
  Color alternate = const Color(0xFF0D0D0D);
  Color primaryBackground = const Color(0xFFFAF8F9);
  Color secondaryBackground = const Color(0xFFFFFFFF);
  Color primaryText = const Color(0xFF141115);
  Color secondaryText = const Color(0xFFFFFFFF);

  Color font = Color(0xFF477E93);
  Color linksbuttons = Color(0xFF1D3557);
  Color dred = Color(0xFFD15E4D);
  Color customColor1 = Color(0xFFF4F1DE);
  Color silverbg = Color(0xFFE3F2FD);
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
