import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  /// Access the color scheme.
  ColorScheme get color => Theme.of(this).colorScheme;

  /// The background color.
  Color get background => Theme.of(this).scaffoldBackgroundColor;

  /// Access the text theme.
  TextTheme get text => Theme.of(this).textTheme;
}
