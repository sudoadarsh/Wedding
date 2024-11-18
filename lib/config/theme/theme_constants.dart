import 'package:flutter/material.dart';

/// The colors.
abstract class DarkThemeConstants {
  static const Color background = Color(0xff131314);
  static const Color primary = Color(0xff4a8ed7);
  static const Color secondary = Color(0xff9067bf);
  static const Color surface = Color(0xff212121);
  static const Color onSurface = Color(0xffe3e3e3);
  static const Color error = Color(0xff800000);
  static const Color onError = Color(0xff7c4a4b);
  static const Color surfaceDim = Color(0xff7d7d7d);

  static const ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: primary,
    onPrimary: onSurface,
    secondary: secondary,
    onSecondary: onSurface,
    error: error,
    onError: onError,
    surface: surface,
    onSurface: onSurface,
    surfaceTint: Colors.transparent,
    surfaceDim: surfaceDim,
  );
}

/// The borders.
abstract class AppBorder {
  /// The border radius.
  static const double radiusPx = 20.0;
  static const Radius radius = Radius.circular(radiusPx);
  static const BorderRadius borderRadius = BorderRadius.all(radius);
  static const BorderRadius borderRadius30px = BorderRadius.all(
    Radius.circular(30),
  );
  static const RoundedRectangleBorder shape30px = RoundedRectangleBorder(
    borderRadius: borderRadius30px,
  );
  static const InputBorder inputBorder = OutlineInputBorder(
    borderRadius: AppBorder.borderRadius,
    borderSide: BorderSide(color: Colors.transparent),
  );

  /// The input decoration.
  static const InputDecorationTheme decoration = InputDecorationTheme(
    enabledBorder: inputBorder,
    focusedBorder: inputBorder,
    filled: true,
    contentPadding: EdgeInsets.all(20),
    fillColor: DarkThemeConstants.surface,
    hintStyle: TextStyle(color: Colors.grey),
  );
}
