part of 'schedule_bloc.dart';

sealed class ScheduleState {}

final class ScheduleInitial extends ScheduleState {}

final class FetchingScheduleState extends ScheduleState {}

final class ScheduleFetchedState extends ScheduleState {}

final class ErrorFetchingScheduleState extends ScheduleState {
  final Object? error;

  ErrorFetchingScheduleState(this.error);
}