import 'package:flutter/material.dart';

class GradientTheme extends ThemeExtension<GradientTheme> {
  /// The gradient.
  final Gradient gradient;

  GradientTheme({required this.gradient});

  @override
  ThemeExtension<GradientTheme> copyWith() {
    return GradientTheme(gradient: gradient);
  }

  @override
  ThemeExtension<GradientTheme> lerp(GradientTheme? other, double t) {
    return GradientTheme(
      gradient: Gradient.lerp(gradient, other?.gradient, t)!,
    );
  }

  static GradientTheme of(final BuildContext context) {
    return Theme.of(context).extension<GradientTheme>()!;
  }
}
