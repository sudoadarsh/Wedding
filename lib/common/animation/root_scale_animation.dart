import 'package:flutter/material.dart';

typedef _STF = SingleTickerProviderStateMixin<RootScaleAnimation>;

class RootScaleAnimation extends StatefulWidget {
  const RootScaleAnimation({
    super.key,
    this.duration = const Duration(milliseconds: 800),
    required this.child,
    this.alignment = Alignment.centerLeft,
  });

  /// The duration.
  final Duration duration;

  /// The child.
  final Widget child;

  /// The scale alignment.
  final Alignment alignment;

  @override
  State<RootScaleAnimation> createState() => _RootScaleAnimationState();
}

class _RootScaleAnimationState extends State<RootScaleAnimation> with _STF {
  /// The animation controller.
  late final AnimationController _controller;

  /// The animation object.
  late final Animation<double> _scale;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _scale = CurvedAnimation(parent: _controller, curve: Curves.decelerate);
    // Start the animation.
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scale,
      alignment: widget.alignment,
      child: widget.child,
    );
  }
}
