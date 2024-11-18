import 'event_schema.dart';

interface class ScheduleSchema<T extends EventSchema> {
  /// The id of the schedule.
  String? id;

  /// The title.
  String? title;

  /// The start date.
  DateTime? startTime;

  /// The events for the schedule.
  List<T>? events;
}
