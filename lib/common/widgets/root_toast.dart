import 'package:flutter/material.dart';

abstract class RootToast {
  /// Toast like SnackBar.
  static void small(
    final BuildContext context, {
    required Widget child,
    Color? background,
  }) {
    final ScaffoldMessengerState? state = ScaffoldMessenger.maybeOf(context);
    state?.clearSnackBars();
    state?.showSnackBar(
      SnackBar(
        elevation: 0.0,
        content: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: background ?? Theme.of(context).colorScheme.surface,
            ),
            child: DefaultTextStyle(
              style: Theme.of(context).textTheme.titleMedium!,
              child: child,
            ),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
      ),
      snackBarAnimationStyle: AnimationStyle(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      )
    );
  }
}
