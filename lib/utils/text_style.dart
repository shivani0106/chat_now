import 'package:flutter/cupertino.dart';

class CommonStyle {
  static TextStyle getAppStyle(
      {Color? color,
      double? fontSize,
      FontWeight? fontWeight,
      FontStyle? fontStyle,
      TextDecoration? decoration,
      double? height,
      double? letterSpacing}) {
    return TextStyle(
      fontFamily: "Montserrat",
      color: color,
      letterSpacing: letterSpacing == null ? 0.3 : letterSpacing,
      decoration: decoration != null ? decoration : TextDecoration.none,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle == null ? FontStyle.normal : fontStyle,
      height: height,
    );
  }

  static TextStyle getEuropaStyle(
      {Color? color,
      double? fontSize,
      FontWeight? fontWeight,
      FontStyle? fontStyle,
      TextDecoration? decoration,
      double? height,
      double? letterSpacing}) {
    return TextStyle(
      fontFamily: "Europa",
      color: color,
      letterSpacing: letterSpacing == null ? 0.3 : letterSpacing,
      decoration: decoration != null ? decoration : TextDecoration.none,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle == null ? FontStyle.normal : fontStyle,
      height: height,
    );
  }

  static TextStyle getRiftSoftStyle(
      {Color? color,
      double? fontSize,
      FontWeight? fontWeight,
      FontStyle? fontStyle,
      TextDecoration? decoration,
      double? height,
      double? letterSpacing}) {
    return TextStyle(
      fontFamily: "Rift Soft",
      color: color,
      letterSpacing: letterSpacing == null ? 0.3 : letterSpacing,
      decoration: decoration != null ? decoration : TextDecoration.none,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle == null ? FontStyle.normal : fontStyle,
      height: height,
    );
  }

  static TextStyle getGibsonStyle(
      {Color? color,
      double? fontSize,
      FontWeight? fontWeight,
      FontStyle? fontStyle,
      TextDecoration? decoration,
      double? height,
      double? letterSpacing}) {
    return TextStyle(
      fontFamily: "Gibson",
      color: color,
      letterSpacing: letterSpacing == null ? 0.3 : letterSpacing,
      decoration: decoration != null ? decoration : TextDecoration.none,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle == null ? FontStyle.normal : fontStyle,
      height: height,
    );
  }

  static TextStyle getImpactStyle(
      {Color? color,
      double? fontSize,
      FontWeight? fontWeight,
      FontStyle? fontStyle,
      TextDecoration? decoration,
      double? height,
      double? letterSpacing}) {
    return TextStyle(
      fontFamily: "impact",
      color: color,
      letterSpacing: letterSpacing == null ? 0.3 : letterSpacing,
      decoration: decoration != null ? decoration : TextDecoration.none,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle == null ? FontStyle.normal : fontStyle,
      height: height,
    );
  }

  static TextStyle getMetropolisStyle(
      {Color? color,
      double? fontSize,
      FontWeight? fontWeight,
      FontStyle? fontStyle,
      TextDecoration? decoration,
      double? height,
      double? letterSpacing}) {
    return TextStyle(
      fontFamily: "metropolis",
      color: color,
      letterSpacing: letterSpacing == null ? 0.3 : letterSpacing,
      decoration: decoration != null ? decoration : TextDecoration.none,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle == null ? FontStyle.normal : fontStyle,
      height: height,
    );
  }
}
