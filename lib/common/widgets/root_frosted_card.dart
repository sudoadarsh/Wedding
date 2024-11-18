import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wedding/config/theme/theme_constants.dart';

class RootFrostedCard extends StatelessWidget {
  const RootFrostedCard({super.key, required this.child});

  /// The child widget.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
        child: Container(
          // padding: PaddingConstants.px20,
          decoration: BoxDecoration(
            borderRadius: AppBorder.borderRadius,
            color: Colors.grey.shade800.withOpacity(0.5),
          ),
          child: child,
        ),
      ),
    );
  }
}
