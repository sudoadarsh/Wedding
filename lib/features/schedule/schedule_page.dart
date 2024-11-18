import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding/common/animation/root_fade_in.dart';
import 'package:wedding/common/widgets/root_progress_indicator.dart';
import 'package:wedding/common/widgets/root_scaffold.dart';
import 'package:wedding/common/widgets/root_shader.dart';
import 'package:wedding/core/dependency_injector.dart';
import 'package:wedding/features/schedule/bloc/schedule_bloc.dart';
import 'package:wedding/features/schedule/widgets/event_card.dart';
import 'package:wedding/features/schedule/widgets/schedule_selector.dart';

import '../../domain/schema/event_schema.dart';
import '../../domain/schema/schedule_schema.dart';
import '../../generated/l10n.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  /// The schedule bloc.
  late final ScheduleBloc _bloc;

  @override
  void initState() {
    _bloc = DependencyInjector().accessLazy<ScheduleBloc>();
    _bloc.add(FetchScheduleEvent()); // Fetch the schedules.
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RootScaffold(
      // Disabled the safe area padding.
      safeArea: false,
      // The Appbar.
      appBar: AppBar(title: Text(S.of(context).theSchedule)),
      body: BlocBuilder<ScheduleBloc, ScheduleState>(
        bloc: _bloc,

        // The builder.
        builder: (context, final ScheduleState state) {
          if (state is FetchingScheduleState) {
            return const RootProgressIndicator();
          } else if (state is ScheduleFetchedState) {
            // The selected schedule.
            final ScheduleSchema? selected = _selectedSchedule;

            return RootFadeIn(
              key: ValueKey<String>(_bloc.selectedScheduleId ?? ""),
              child: Column(
                children: [
                  ScheduleSelector(bloc: _bloc, selected: selected),

                  // The schedule listing.
                  Expanded(
                    child: RootShader(
                      stops: const [0.0, 0.1, 0.8, 1.0],
                      child: ListView.separated(
                        itemCount: selected?.events?.length ?? 0,
                        padding: const EdgeInsets.only(top: 30, bottom: 100),
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (context, final int index) {
                          // The current event.
                          final EventSchema event = selected!.events![index];
                          return EventCard(event: event);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  /// Get the selected schedule.
  ScheduleSchema? get _selectedSchedule {
    return _bloc.schedule[_bloc.selectedScheduleId ?? ""];
  }
}
