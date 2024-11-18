import 'package:flutter/material.dart';
import 'package:wedding/extensions/context_extensions.dart';

import '../../config/constants/gap_constants.dart';
import '../../config/constants/padding_constants.dart';

class RootButton extends StatelessWidget {
  const RootButton({super.key, required this.child, this.onTap}) : icon = null;

  const RootButton.icon({
    super.key,
    required this.child,
    this.icon,
    this.onTap,
  });

  /// The callback for when the button is tapped.
  final VoidCallback? onTap;

  /// The child.
  final Widget child;

  /// The icon widget.
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    const BorderRadius radius = BorderRadius.all(Radius.circular(25.0));
    return InkWell(
      onTap: onTap,
      borderRadius: radius,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: radius,
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [context.color.primary, context.color.secondary],
          ),
        ),
        padding: PaddingConstants.px15,
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          child: icon != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [child, GapConstants.px10, icon!],
                )
              : child,
        ),
      ),
    );
  }
}
