import 'package:flutter/material.dart';

enum RootGradientChipBorder { alignRight, alignLeft, none }

class RootGradientChip extends StatelessWidget {
  const RootGradientChip({
    super.key,
    required this.colors,
    this.stops = const [0.1, 0.8],
    required this.label,
    this.border = RootGradientChipBorder.alignRight,
    this.radius = 10,
  });

  /// The gradient colors.
  final List<Color> colors;

  /// The stops.
  final List<double> stops;

  /// The label.
  final String label;

  /// The alignment.
  final RootGradientChipBorder border;

  /// The border radius.
  final double radius;

  @override
  Widget build(BuildContext context) {
    final Radius r = Radius.circular(radius);
    final BorderRadius borderRadius;
    switch (border) {
      case RootGradientChipBorder.alignRight:
        borderRadius = BorderRadius.only(bottomLeft: r, topRight: r);
      case RootGradientChipBorder.alignLeft:
        borderRadius = BorderRadius.only(bottomRight: r, topLeft: r);
      default:
        borderRadius = BorderRadius.all(r);
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors, stops: stops),
        borderRadius: borderRadius,
      ),
      child: Text(label),
    );
  }
}
