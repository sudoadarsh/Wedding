import 'package:wedding/domain/schema/event_schema.dart';
import 'package:wedding/domain/schema/schedule_schema.dart';

class ScheduleModel implements ScheduleSchema<EventModel> {
  @override
  String? id;
  @override
  String? title;
  @override
  DateTime? startTime;
  @override
  List<EventModel>? events;

  ScheduleModel({this.id, this.title, this.startTime, this.events});

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    final String? startTime = json['startTime'];
    if (startTime != null) {
      this.startTime = DateTime.parse(startTime);
    }
    if (json['events'] != null) {
      events = <EventModel>[];
      json['events'].forEach((v) {
        events!.add(EventModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['startTime'] = startTime;
    if (events != null) {
      data['events'] = events!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EventModel implements EventSchema {
  @override
  String? id;
  @override
  String? emoji;
  @override
  String? colorCode;
  @override
  String? title;
  @override
  String? description;
  @override
  DateTime? startTime;
  @override
  DateTime? endTime;

  EventModel({
    this.id,
    this.emoji,
    this.colorCode,
    this.title,
    this.description,
    this.startTime,
    this.endTime,
  });

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    emoji = json['emoji'];
    colorCode = json['colorCode'];
    title = json['title'];
    description = json['description'];
    final String? startTime = json['startTime'];
    if (startTime != null) {
      this.startTime = DateTime.parse(startTime);
    }
    final String? endTime = json['endTime'];
    if (endTime != null) {
      this.endTime = DateTime.parse(endTime);
    }
  }

  factory EventModel.fromEntity(final EventSchema entity) {
    return EventModel(
      id: entity.id,
      description: entity.description,
      colorCode: entity.colorCode,
      emoji: entity.emoji,
      endTime: entity.endTime,
      startTime: entity.startTime,
      title: entity.title,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['emoji'] = emoji;
    data['colorCode'] = colorCode;
    data['title'] = title;
    data['description'] = description;
    data['startTime'] = startTime?.toIso8601String();
    data['endTime'] = endTime?.toIso8601String();
    return data;
  }
}
