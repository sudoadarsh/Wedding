import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:wedding/data/model/schedule_model.dart';
import 'package:wedding/domain/repo/schedule_repo.dart';
import 'package:wedding/domain/schema/event_schema.dart';
import 'package:wedding/domain/schema/schedule_schema.dart';

class ScheduleMockSource implements ScheduleRepo {
  @override
  Future<List<ScheduleSchema<EventSchema>>> fetch() async {
    await Future.delayed(const Duration(seconds: 1)); // Manually delay.
    final String encoded = await rootBundle.loadString(
      "assets/mock/schedule.json",
    );
    final List decoded = jsonDecode(encoded);
    return decoded
        .map<ScheduleModel>((final json) => ScheduleModel.fromJson(json))
        .toList();
  }
}
