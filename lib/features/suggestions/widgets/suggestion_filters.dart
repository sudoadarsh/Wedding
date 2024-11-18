import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:wedding/extensions/context_extensions.dart';

import '../../../common/widgets/root_gradientify.dart';
import '../../../config/constants/gap_constants.dart';
import '../../../config/constants/icon_constants.dart';
import '../../../generated/l10n.dart';

class SuggestionFilters extends StatelessWidget {
  const SuggestionFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openBottomSheet(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S.of(context).popular,
            style: TextStyle(color: context.color.surfaceDim),
          ),
          GapConstants.px05,
          const RootGradientify(child: IconConstants.arrowDown),
        ],
      ),
    );
  }

  // --------------------------------------------------------------------------- // Private methods.

  /// Open the bottom sheet.
  Future<void> _openBottomSheet(final BuildContext context) {
    HapticFeedback.selectionClick();
    return showCupertinoModalPopup(
      context: context,
      builder: (final BuildContext sheetContext) {
        return CupertinoActionSheet(
          title: Text(S.of(context).performAnAction),
          actions: [
            CupertinoActionSheetAction(
              onPressed: Navigator.of(sheetContext).pop,
              isDefaultAction: true,
              child: Text(S.of(context).popular),
            ),
            CupertinoActionSheetAction(
              onPressed: Navigator.of(sheetContext).pop,
              child: Text(S.of(context).latest),
            ),
            CupertinoActionSheetAction(
              onPressed: Navigator.of(sheetContext).pop,
              child: const Text("My Question(s)"),
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
