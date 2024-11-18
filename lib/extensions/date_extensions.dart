import 'package:intl/intl.dart';

extension DateExtensions on DateTime {
  String get descriptive {
    if (isSameDayAs(DateTime.now())) return "Today";
    if (diffInDays(DateTime.now()) == 1) return "Tomorrow";
    if (diffInDays(DateTime.now()) == 2) return "Day after Tomorrow";
    return DateFormat("dd MMM, yyyy").format(this);
  }

  bool isSameDayAs(final DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  int diffInDays(final DateTime other) {
    final DateTime x = DateTime(year, month, day);
    final DateTime y = DateTime(other.year, other.month, other.day);
    return x.difference(y).inDays;
  }

  /// Get the day suffix.
  String get daySuffix {
    if (day >= 11 && day <= 13) {
      return 'th';
    } else {
      return switch (day % 10) { 1 => "st", 2 => "nd", 3 => "rd", _ => "th" };
    }
  }
}
