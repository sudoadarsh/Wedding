import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wedding/config/constants/gap_constants.dart';
import 'package:wedding/extensions/context_extensions.dart';

import '../../../config/constants/padding_constants.dart';

typedef _STF = SingleTickerProviderStateMixin<FlipCard>;

class FlipCard extends StatefulWidget {
  const FlipCard({super.key, required this.value});

  /// The current value.
  final int value;

  @override
  State<FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard> with _STF {
  /// The animation controller.
  late final AnimationController _controller;

  /// The animation object.
  late final Animation<double> _animation;

  /// The old value.
  late int _oldValue;

  @override
  void initState() {
    _oldValue = widget.value;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: pi / 2, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.decelerate),
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant FlipCard oldWidget) {
    if (oldWidget.value == widget.value) return;
    _oldValue = oldWidget.value;
    // Trigger the flip animation.
    _controller.reset();
    _controller.forward();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            // The current value.
            _FlipCardComponent.top(value: _oldValue),
            // The component to be animated in.
            AnimatedBuilder(
              animation: _animation,
              builder: (context, __) {
                return Transform(
                  alignment: Alignment.bottomCenter,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.006)
                    ..rotateX(_animation.value),
                  child: _FlipCardComponent.top(value: widget.value),
                );
              },
            ),
          ],
        ),
        GapConstants.px02,
        _FlipCardComponent.bottom(value: widget.value),
      ],
    );
  }
}

class _FlipCardComponent extends StatelessWidget {
  const _FlipCardComponent.top({required this.value})
      : alignment = Alignment.topCenter;

  const _FlipCardComponent.bottom({required this.value})
      : alignment = Alignment.bottomCenter;

  /// The child.
  final int value;

  /// The alignment.
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Align(
          heightFactor: 0.5,
          alignment: alignment,
          child: _FlipContainer(value: value),
        ),
      ),
    );
  }
}

class _FlipContainer extends StatelessWidget {
  const _FlipContainer({required this.value});

  /// The value.
  final int value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: PaddingConstants.px10,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        color: Colors.grey.shade800.withOpacity(0.5),
      ),
      child: Text(
        value.toString().padLeft(2, "0"),
        style: context.text.displayLarge,
      ),
    );
  }
}
