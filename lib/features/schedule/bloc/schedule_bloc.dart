import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding/domain/repo/schedule_repo.dart';

import '../../../domain/schema/schedule_schema.dart';

part 'schedule_event.dart';

part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  /// The repo.
  final ScheduleRepo repo;

  /// The selected schedule id.
  String? selectedScheduleId;

  /// The in-memory cache of schedule.
  final Map<String, ScheduleSchema> schedule = <String, ScheduleSchema>{};

  ScheduleBloc(this.repo) : super(ScheduleInitial()) {
    // Fetch the scheduled events.
    on<FetchScheduleEvent>((event, emit) async {
      emit(FetchingScheduleState());
      try {
        final List<ScheduleSchema> response = await repo.fetch();
        for (final ScheduleSchema value in response) {
          if (value.id == null) continue;
          schedule[value.id!] = value;
        }
        selectedScheduleId = schedule.keys.first;
        emit(ScheduleFetchedState());
      } catch (error) {
        emit(ErrorFetchingScheduleState(error));
      }
    });

    on<ChangeScheduleEvent>((event, emit) {
      selectedScheduleId = event.id;
      emit(ScheduleFetchedState());
    });
  }
}
