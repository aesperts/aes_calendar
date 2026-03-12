import 'package:flutter/material.dart';

/// Visual customization options for [AesCalendar] and its dialogs.
///
/// All fields are optional and fall back to sensible defaults
/// derived from the current [ThemeData] when not provided.
class AesCalendarTheme {
  /// Background color of the selected day cell.
  final Color? selectedDayBackgroundColor;

  /// Text color of the selected day.
  final Color? selectedDayTextColor;

  /// Background color of the "today" cell when not selected.
  final Color? todayBackgroundColor;

  /// Text color of "today" when not selected.
  final Color? todayTextColor;

  /// Text color of disabled days (outside allowed range).
  final Color? disabledDayTextColor;

  /// Text color of normal days.
  final Color? dayTextColor;

  /// Border radius for day cells.
  final BorderRadius? dayBorderRadius;

  /// Text style for the month/year header.
  final TextStyle? headerTextStyle;

  /// Base text style for day numbers.
  final TextStyle? dayTextStyle;

  /// Icon for navigating to the previous month.
  final IconData? previousMonthIcon;

  /// Icon for navigating to the next month.
  final IconData? nextMonthIcon;

  const AesCalendarTheme({
    this.selectedDayBackgroundColor,
    this.selectedDayTextColor,
    this.todayBackgroundColor,
    this.todayTextColor,
    this.disabledDayTextColor,
    this.dayTextColor,
    this.dayBorderRadius,
    this.headerTextStyle,
    this.dayTextStyle,
    this.previousMonthIcon,
    this.nextMonthIcon,
  });
}

/// Texts used by the calendar and its dialogs.
///
/// Override these to fully customize button labels and other strings.
class AesCalendarTexts {
  /// Label for the cancel button in the year/month picker dialog.
  final String cancelLabel;

  /// Label for the OK/confirm button in the year/month picker dialog.
  final String okLabel;

  const AesCalendarTexts({
    this.cancelLabel = 'Cancel',
    this.okLabel = 'OK',
  });
}

