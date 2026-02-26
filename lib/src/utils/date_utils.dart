/// Utility methods for date comparison and formatting.
class AesDateUtils {
  /// Removes time portion from DateTime.
  static DateTime strip(DateTime d) {
    return DateTime(d.year, d.month, d.day);
  }

  /// Compares two dates (year, month, day only).
  static bool isSameDate(DateTime a, DateTime b) {
    return a.year == b.year &&
        a.month == b.month &&
        a.day == b.day;
  }
}