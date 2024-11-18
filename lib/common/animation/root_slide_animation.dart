import 'package:flutter/material.dart';

typedef _STF = SingleTickerProviderStateMixin<RootSlideAnimation>;

class RootSlideAnimation extends StatefulWidget {
  const RootSlideAnimation({
    super.key,
    this.duration = const Duration(milliseconds: 800),
    required this.child,
    this.start = const Offset(-1, 0),
    this.end = const Offset(0, 0),
    this.delay,
  });

  /// The duration.
  final Duration duration;

  /// The start position.
  final Offset start;

  /// The end position.
  final Offset end;

  /// The initial delay.
  final Duration? delay;

  /// The child.
  final Widget child;

  @override
  State<RootSlideAnimation> createState() => _RootSlideAnimationState();
}

class _RootSlideAnimationState extends State<RootSlideAnimation> with _STF {
  /// The animation controller.
  late final AnimationController _controller;

  /// The animation object.
  late final Animation<Offset> _position;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _position = Tween<Offset>(begin: widget.start, end: widget.end).animate(
      CurvedAnimation(parent: _controller, curve: Curves.decelerate),
    );

    // Start the animation.
    if (widget.delay != null) {
      Future.delayed(widget.delay!, () => _controller.forward());
    } else {
      _controller.forward();
    }

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _position,
      builder: (_, __) {
        return SlideTransition(position: _position, child: widget.child);
      },
    );
  }
}
