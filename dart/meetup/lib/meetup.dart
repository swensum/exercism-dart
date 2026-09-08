class Meetup {
  String meetup({
    required int year,
    required int month,
    required String week,
    required String dayofweek,
  }) {
    final dayNumbers = {
      "Sunday": DateTime.sunday,
      "Monday": DateTime.monday,
      "Tuesday": DateTime.tuesday,
      "Wednesday": DateTime.wednesday,
      "Thursday": DateTime.thursday,
      "Friday": DateTime.friday,
      "Saturday": DateTime.saturday,
    };

    final targetDay = dayNumbers[dayofweek]!;

    int day = 0;

    if (week == "teenth") {
      for (day = 13; day <= 19; day++) {
        final date = DateTime(year, month, day);

        if (date.weekday == targetDay) {
          return _formatDate(date);
        }
      }
    }

    if (week == "first") {
      day = _findDay(year, month, targetDay, 1);
    } else if (week == "second") {
      day = _findDay(year, month, targetDay, 8);
    } else if (week == "third") {
      day = _findDay(year, month, targetDay, 15);
    } else if (week == "fourth") {
      day = _findDay(year, month, targetDay, 22);
    } else if (week == "last") {
      final lastDay = DateTime(year, month + 1, 0).day;

      for (day = lastDay; day >= 1; day--) {
        final date = DateTime(year, month, day);

        if (date.weekday == targetDay) {
          return _formatDate(date);
        }
      }
    } else if (week != "teenth") {
      throw ArgumentError("Invalid week");
    }

    final date = DateTime(year, month, day);
    return _formatDate(date);
  }

  int _findDay(
    int year,
    int month,
    int targetDay,
    int startDay,
  ) {
    for (var day = startDay; day <= startDay + 6; day++) {
      final date = DateTime(year, month, day);

      if (date.weekday == targetDay) {
        return day;
      }
    }

    throw ArgumentError("Date not found");
  }

  String _formatDate(DateTime date) {
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');

    return "$year-$month-$day";
  }
}