import 'package:flutter/material.dart';

class RootShader extends StatelessWidget {
  const RootShader({super.key, required this.child, this.stops});

  /// The child.
  final Widget child;
  /// The stops.
  final List<double>? stops;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.dstOut,
      shaderCallback: (final Rect rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: const [Colors.black, Colors.transparent, Colors.transparent, Colors.black],
          stops: stops ?? [0, 0.2, 0.8, 1.0],
        ).createShader(rect);
      },
      child: child,
    );
  }
}
