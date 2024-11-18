import 'package:wedding/core/dependency_injector.dart';
import 'package:wedding/data/source/schedule_source.dart';
import 'package:wedding/data/source/suggestion_mock_source.dart';
import 'package:wedding/domain/repo/schedule_repo.dart';
import 'package:wedding/domain/repo/suggestion_repo.dart';
import 'package:wedding/features/home/bloc/home_bloc.dart';
import 'package:wedding/features/schedule/bloc/schedule_bloc.dart';
import 'package:wedding/features/suggestions/bloc/suggestion_bloc.dart';

class Injector {
  Injector.init() {
    final DependencyInjector di = DependencyInjector();
    // Register the repos first.
    _registerRepo(di);
  }

  /// Register the repos.
  void _registerRepo(final DependencyInjector di) {
    // The schedule repo.
    di.registerLazy<ScheduleRepo>(() => ScheduleMockSource());

    // The suggestion repo.
    di.registerLazy<SuggestionRepo>(() => SuggestionSource());

    // Now register all the blocs.
    _registerBloc(di);
  }

  /// Register the blocs.
  void _registerBloc(final DependencyInjector di) {
    // The schedule bloc.
    di.registerLazy<ScheduleBloc>(
      () => ScheduleBloc(di.accessLazy<ScheduleRepo>()),
    );

    // The suggestions bloc.
    di.registerLazy<SuggestionBloc>(() => SuggestionBloc());

    // The home bloc.
    di.registerLazy<HomeBloc>(() => HomeBloc());
  }
}
