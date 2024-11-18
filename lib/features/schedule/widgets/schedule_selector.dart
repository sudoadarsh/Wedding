import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:wedding/domain/schema/schedule_schema.dart';
import 'package:wedding/extensions/context_extensions.dart';
import '../../../common/widgets/root_gradientify.dart';
import '../../../config/constants/gap_constants.dart';
import '../../../config/constants/icon_constants.dart';
import '../../../generated/l10n.dart';
import '../bloc/schedule_bloc.dart';

class ScheduleSelector extends StatelessWidget {
  const ScheduleSelector({super.key, required this.bloc, this.selected});

  /// The selected schema.
  final ScheduleSchema? selected;

  /// The schedule bloc.
  final ScheduleBloc bloc;

  @override
  Widget build(BuildContext context) {
    // The selector title.
    final String? selectorTitle = _scheduleSelectorTitle(selected);

    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        _openBottomSheet(context);
      },
      child: Row(
        children: [
          if (selectorTitle != null)
            Text(
              selectorTitle,
              style: TextStyle(color: context.color.surfaceDim),
            ),
          GapConstants.px05,
          const RootGradientify(child: IconConstants.arrowDown),
        ],
      ),
    );
  }

  /// Get the schedule day and time.
  String? _scheduleSelectorTitle(final ScheduleSchema? schema) {
    if (schema?.startTime == null) return null;
    const String format = "dd MMM, yy";
    final String formatted = DateFormat(format).format(schema!.startTime!);
    return "${schema.title} ( $formatted )";
  }

  /// Open the bottom sheet with the options.
  Future<void> _openBottomSheet(final BuildContext context) {
    return showCupertinoModalPopup(
      context: context,
      builder: (final BuildContext sheetContext) {
        return CupertinoActionSheet(
          title: Text(S.of(context).selectADay),
          actions: bloc.schedule.values.map((final ScheduleSchema x) {
            return CupertinoActionSheetAction(
              isDefaultAction: x.id == bloc.selectedScheduleId,
              onPressed: () {
                bloc.add(ChangeScheduleEvent(id: x.id));
                Navigator.of(sheetContext).pop();
              },
              child: Text(_scheduleSelectorTitle(x) ?? ""),
            );
          }).toList()
            ..add(CupertinoActionSheetAction(
              isDestructiveAction: true,
              onPressed: Navigator.of(sheetContext).pop,
              child: Text(S.of(context).cancel),
            )),
        );
      },
    );
  }
}
