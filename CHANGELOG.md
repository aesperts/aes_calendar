## 0.0.3 (unreleased)

### ✨ Features
- **Two display modes**: dialog popup via `AesCalendar.show()` and full-screen/embedded widget via `AesCalendar`
- **Full customization**: optional `AesCalendarTheme` for colors, text styles, icons, and day cell border radius
- **Text customization**: optional `AesCalendarTexts` for year/month picker button labels (e.g. Cancel, OK)
- **Custom month header**: optional `monthLabelBuilder` for custom month title format/locale
- **Theme-aware defaults**: `AesCalendarDefaults.themeOf(context)` and `AesCalendarDefaults.texts()` provide defaults from `Theme.of(context)`; all colors and text styles can be overridden per instance

### 🎨 API
- `AesCalendar`: new optional params `theme`, `texts`, `monthLabelBuilder`; `startDate` for min date
- `AesCalendar.show(context, ...)`: static helper for dialog mode with same optional theme/texts/monthLabelBuilder
- `AesYearMonthPicker` and `AesWheelPicker`: accept theme/texts and use shared defaults

### 📦 Package
- New files: `lib/src/calendar/aes_calendar_theme.dart` (theme + texts), `lib/src/calendar/aes_calendar_defaults.dart`
- Main export now includes `aes_calendar_theme.dart`
- Replaced deprecated `Color.withOpacity` with `withValues(alpha: ...)`; removed unnecessary library directive

### 📱 Example
- Example app restyled: gradient header, two cards (“Open Popup Window” / “Open Full Screen”)
- Demonstrates dialog calendar and full-screen calendar with `Theme.of(context)` and optional theme/texts
- Example `pubspec.yaml`: added `flutter_lints` dev dependency for analyzer

### 📄 Documentation
- README: preview section with three screenshots (home, dialog, full screen)
- README: usage for dialog vs full-screen, parameters table, customization (theme, texts, monthLabelBuilder)

---

## 0.0.2

### ✨ Improvements
- Added complete example project inside `/example` folder
- Added screenshot preview to README
- Improved documentation and usage guide
- Enhanced pub.dev package score

---

## 0.0.1

- Initial release
- Basic calendar implementation
- Year and month picker support