import 'package:wedding/domain/schema/schedule_schema.dart';

abstract interface class ScheduleRepo {
  /// Fetch the schedule data.
  Future<List<ScheduleSchema>> fetch();
}
