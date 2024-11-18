import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../config/constants/padding_constants.dart';

class FrostedLabel extends StatelessWidget {
  const FrostedLabel({super.key, required this.label});

  /// The label.
  final String label;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -45,
      left: 0,
      right: 0,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            padding: PaddingConstants.px10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.grey.shade800.withOpacity(0.5),
            ),
            child: Center(child: Text(label)),
          ),
        ),
      ),
    );
  }
}
