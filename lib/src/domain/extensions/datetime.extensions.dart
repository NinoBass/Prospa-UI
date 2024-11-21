extension DateHelpers on DateTime {
  bool get isToday {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool get isThisMonth {
    final now = DateTime.now();
    return now.month == month && now.year == year;
  }

  bool get isLastMonth {
    final now = DateTime.now();
    return ((now.month == 1) ? month == 12 : month == now.month - 1) && (now.month == 1)
        ? year == now.year - 1
        : now.year == year;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day && yesterday.month == month && yesterday.year == year;
  }
}
