import 'package:flutter/material.dart';
import 'package:wedding/config/theme/theme_constants.dart';

import '../../common/tools/gradient_theme.dart';

abstract class AppTheme {
  /// The default dark theme.
  static final ThemeData defaultDark = ThemeData(
    // The AppBar theme.
    appBarTheme: const AppBarTheme(
      color: DarkThemeConstants.background,
      scrolledUnderElevation: 0.0,
    ),
    // The background color.
    scaffoldBackgroundColor: DarkThemeConstants.background,
    // The color scheme.
    colorScheme: DarkThemeConstants.colorScheme,
    // The card theme.
    cardTheme: const CardTheme(
      elevation: 0.0,
      surfaceTintColor: Colors.transparent,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: AppBorder.borderRadius30px),
    ),
    // The list tile theme.
    listTileTheme: const ListTileThemeData(
      dense: false,
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      titleTextStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      subtitleTextStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w300,
        height: 1.5,
      ),
    ),
    // The input decoration theme.
    inputDecorationTheme: AppBorder.decoration,
    // The badge color.
    badgeTheme: const BadgeThemeData(
      backgroundColor: DarkThemeConstants.secondary,
    ),
    extensions: [
      GradientTheme(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [DarkThemeConstants.primary, DarkThemeConstants.secondary],
        ),
      )
    ],
  );
}
