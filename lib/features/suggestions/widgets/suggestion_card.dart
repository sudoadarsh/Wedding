import 'package:flutter/material.dart';
import 'package:wedding/config/constants/gap_constants.dart';
import 'package:wedding/config/constants/icon_constants.dart';
import 'package:wedding/extensions/context_extensions.dart';
import 'package:wedding/features/suggestions/widgets/suggestion_card_options.dart';

class SuggestionCard extends StatelessWidget {
  const SuggestionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // The OP's details.
        Row(
          children: [
            // The OP's avatar.
            CircleAvatar(
              backgroundColor: context.color.surface,
              foregroundColor: context.color.onSurface,
              child: IconConstants.person,
            ),
            GapConstants.px15,

            // The OP's name and date of submission.
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Adarsh Sudarsanan",
                    style: context.text.titleMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Fri Nov 15",
                    style: context.text.bodySmall?.copyWith(
                      color: context.color.surfaceDim,
                    ),
                  ),
                ],
              ),
            ),

            // The card options.
            const SuggestionCardOptions()
          ],
        ),
        GapConstants.px10,

        // The suggestion text.
        const Text(
            "The suggestion the user has suggested, this can be very long though."),
        GapConstants.px10,

        // The post stats.
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: () {}, icon: IconConstants.like),
            GapConstants.px05,
            IconButton(onPressed: () {}, icon: IconConstants.dislike),
          ],
        )
      ],
    );
  }
}
