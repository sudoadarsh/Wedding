import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/constants/icon_constants.dart';
import '../../../generated/l10n.dart';

class SuggestionCardOptions extends StatelessWidget {
  const SuggestionCardOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      visualDensity: const VisualDensity(horizontal: -4),
      onPressed: () => _openBottomSheet(context),
      icon: IconConstants.menu,
    );
  }

  // --------------------------------------------------------------------------- // Private methods.

  /// Open the bottom sheet with card options.
  Future<void> _openBottomSheet(final BuildContext context) {
    HapticFeedback.selectionClick();
    return showCupertinoModalPopup(
      context: context,
      builder: (final BuildContext sheetContext) {
        return CupertinoActionSheet(
          title: Text(S.of(context).performAnAction),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                // Close the sheet.
                Navigator.of(sheetContext).pop();
              },
              isDefaultAction: true,
              child: Text(S.of(context).reportSuggestion),
            ),
            CupertinoActionSheetAction(
              onPressed: Navigator.of(sheetContext).pop,
              isDestructiveAction: true,
              child: Text(S.of(context).cancel),
            ),
          ],
        );
      },
    );
  }
}
