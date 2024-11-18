import 'package:flutter/material.dart';
import 'package:wedding/config/theme/app_theme.dart';
import 'package:wedding/features/home/home_page.dart';
import 'package:wedding/features/injector.dart';

import 'generated/l10n.dart';

void main() {
  // Inject the dependencies.
  Injector.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.defaultDark,
      localizationsDelegates: const [S.delegate],
      home: const HomePage(),
    );
  }
}
