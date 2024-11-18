import 'package:flutter/material.dart';
import '../tools/gradient_theme.dart';

class RootGradientify extends StatelessWidget {
  const RootGradientify({super.key, required this.child});

  /// The child widget.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (final Rect rect) {
        return GradientTheme.of(context).gradient.createShader(rect);
      },
      child: child,
    );
  }
}
