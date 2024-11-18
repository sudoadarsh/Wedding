import 'package:flutter/cupertino.dart'
    show
    BuildContext,
    Center,
    CupertinoActivityIndicator,
    StatelessWidget,
    Widget;

class RootProgressIndicator extends StatelessWidget {
  const RootProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CupertinoActivityIndicator());
  }
}
