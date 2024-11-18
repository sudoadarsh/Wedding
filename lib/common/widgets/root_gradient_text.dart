import 'package:flutter/material.dart';

import '../tools/gradient_theme.dart';

class RootGradientText extends StatelessWidget {
  const RootGradientText(this.text, {super.key, this.style});

  /// The text.
  final String text;

  /// The style.
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (final Rect bounds) {
        return GradientTheme.of(context).gradient.createShader(bounds);
      },
      child: Text(text, style: style),
    );
  }
}
