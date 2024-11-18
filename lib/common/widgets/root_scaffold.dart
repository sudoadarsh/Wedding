import "package:flutter/material.dart";

class RootScaffold extends StatelessWidget {
  const RootScaffold({
    super.key,
    this.padding = const EdgeInsets.only(left: 20, right: 20, top: 20),
    this.backgroundColor,
    this.appBar,
    required this.body,
    this.fab,
    this.bottomNavigationBar,
    this.safeArea = true,
    this.fabLocation,
  });

  /// The padding.
  final EdgeInsets padding;

  /// The scaffold background color.
  final Color? backgroundColor;

  /// The AppBar.
  final PreferredSizeWidget? appBar;

  /// The body.
  final Widget body;

  /// The floating action button.
  final Widget? fab;

  /// The bottom navigation bar.
  final Widget? bottomNavigationBar;

  /// Whether the safe area is require or not.
  final bool safeArea;

  /// The floating action button location.
  final FloatingActionButtonLocation? fabLocation;

  @override
  Widget build(BuildContext context) {
    final Padding child = Padding(padding: padding, child: body);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      floatingActionButton: fab,
      body: safeArea ? SafeArea(child: child) : child,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButtonLocation: fabLocation,
    );
  }
}
