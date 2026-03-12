import 'package:flutter/material.dart';

import 'aes_calendar_theme.dart';

/// Central place for default colors, icons and text styles
/// used by the calendar package.
class AesCalendarDefaults {
  const AesCalendarDefaults._();

  /// Builds the default visual theme for the calendar based
  /// on the current [ThemeData].
  static AesCalendarTheme themeOf(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AesCalendarTheme(
      selectedDayBackgroundColor: colorScheme.primary,
      selectedDayTextColor: Colors.white,
      todayBackgroundColor: colorScheme.primary.withValues(alpha: 0.2),
      todayTextColor: colorScheme.onPrimary,
      disabledDayTextColor: Colors.grey,
      // Keep [dayTextColor] null by default so it falls back
      // to whatever the surrounding text style resolves to.
      dayTextColor: null,
      dayBorderRadius: BorderRadius.circular(8),
      headerTextStyle: theme.textTheme.titleMedium,
      dayTextStyle: theme.textTheme.bodyMedium,
      previousMonthIcon: Icons.chevron_left,
      nextMonthIcon: Icons.chevron_right,
    );
  }

  /// Default texts used when the caller does not provide any.
  static AesCalendarTexts texts() => const AesCalendarTexts();
}

