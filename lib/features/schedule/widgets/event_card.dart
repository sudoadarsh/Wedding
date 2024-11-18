import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wedding/config/constants/gap_constants.dart';
import 'package:wedding/domain/schema/event_schema.dart';
import 'package:wedding/extensions/context_extensions.dart';

class EventCard extends StatelessWidget {
  /// The event.
  final EventSchema event;

  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    // The card radius.
    const BorderRadius borderRadius = BorderRadius.all(Radius.circular(6));
    // The width of the vertical divider.
    const double dividerWidth = 2;
    // The space between the card and the vertical divider.
    const double spacing = 5;
    // The size of the leading widget.
    const double leadingSize = 30;
    // The default subtitle text style.
    final TextStyle subtitleStyle = context.text.bodySmall?.copyWith(
          color: context.color.surfaceDim,
        ) ??
        const TextStyle();

    return Container(
      decoration: BoxDecoration(
        // The custom color for the event.
        color: Color(int.parse(event.colorCode ?? "", radix: 16)),
        // borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      padding: const EdgeInsets.only(left: dividerWidth),
      child: ColoredBox(
        color: context.background,
        child: Container(
          margin: const EdgeInsets.only(left: spacing),
          decoration: BoxDecoration(
            color: context.color.surface,
            borderRadius: borderRadius,
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: Container(
              height: leadingSize,
              width: leadingSize,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: context.background,
              ),

              // The event emoji.
              child: Center(child: Text(event.emoji ?? "✨")),
            ),

            // The event title.
            title: Text(event.title ?? ""),
            subtitle: DefaultTextStyle(
              style: subtitleStyle,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GapConstants.px05,
                  // The event description.
                  Text(event.description ?? ""),
                  GapConstants.px02,
                  Text(_durationAndTime ?? "")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Get the event duration and time.
  String? get _durationAndTime {
    if (event.startTime == null || event.endTime == null) return null;
    final String startTime = DateFormat.jm().format(event.startTime!);
    final String endTime = DateFormat.jm().format(event.endTime!);
    return "$startTime - $endTime";
  }
}
