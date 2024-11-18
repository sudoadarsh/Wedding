import 'package:flutter/material.dart';
import 'package:wedding/extensions/context_extensions.dart';

import '../tools/gradient_theme.dart';

class RootGradientFilterChip extends StatelessWidget {
  const RootGradientFilterChip({
    super.key,
    this.isActive = false,
    this.duration = const Duration(milliseconds: 300),
    this.borderPx = 2,
    this.contentPadding =
        const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 6),
    required this.child,
    this.onTap,
  });

  /// The animation duration.
  final Duration duration;

  /// The border Px.
  final double borderPx;

  /// The content padding.
  final EdgeInsets contentPadding;

  /// The child.
  final Widget child;

  /// The callback for when the chip is tapped.
  final VoidCallback? onTap;

  /// Whether the chip is active or not.
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: duration,
        padding: EdgeInsets.all(borderPx),
        decoration:   BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          gradient: isActive ? GradientTheme.of(context).gradient : null,
        ) ,
        child: Container(
          padding: contentPadding,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(18.0)),
            color: context.color.surface,
          ),
          child: DefaultTextStyle(
            style: context.text.titleSmall ?? const TextStyle(),
            child: child,
          ),
        ),
      ),
    );
  }
}
