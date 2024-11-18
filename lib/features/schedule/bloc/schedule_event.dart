part of 'schedule_bloc.dart';

sealed class ScheduleEvent {}

final class FetchScheduleEvent extends ScheduleEvent {}

final class ChangeScheduleEvent extends ScheduleEvent {
  final String? id;

  ChangeScheduleEvent({required this.id});
}