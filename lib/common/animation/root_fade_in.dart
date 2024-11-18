import "package:flutter/material.dart";

typedef _SingleTicker = SingleTickerProviderStateMixin<RootFadeIn>;

class RootFadeIn extends StatefulWidget {
  const RootFadeIn({
    super.key,
    this.duration = const Duration(milliseconds: 300),
    this.delay,
    required this.child,
  });

  /// The duration.
  final Duration duration;

  /// The delay.
  final Duration? delay;

  /// The child.
  final Widget child;

  @override
  State<RootFadeIn> createState() => _RootFadeInState();
}

class _RootFadeInState extends State<RootFadeIn> with _SingleTicker {
  /// The animation controller.
  late final AnimationController controller;

  /// The animation object.
  late final Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: widget.duration);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    if (widget.delay != null) {
      Future.delayed(widget.delay!, () => controller.forward());
    } else {
      controller.forward();
    }

    super.initState();
  }

  @override
  void didUpdateWidget(covariant RootFadeIn oldWidget) {
    if (widget.key == oldWidget.key) return;
    controller.reset();
    controller.forward();

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: animation, child: widget.child);
  }
}
