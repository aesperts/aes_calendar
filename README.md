# aes_calendar

[![pub package](https://img.shields.io/pub/v/aes_calendar.svg)](https://pub.dev/packages/aes_calendar)
[![license](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

A customizable and lightweight Flutter calendar widget with:

- Dialog popup mode
- Full-screen/widget mode
- Built-in year–month selector and wheel picker support

`aes_calendar` makes it easy to integrate a clean, theme-aware calendar into your Flutter app with minimal configuration, while still allowing full color and text customization.

---

## 📸 Preview

Dialog + full-screen examples from the bundled `example` app:

![AES Calendar Example](https://raw.githubusercontent.com/aesperts/aes_calendar/refs/heads/main/assets/screenshot.png)

---

## ✨ Features

- 📅 Interactive calendar UI
- 🗓 Year & Month selector dialog with wheel pickers
- 💬 Two display modes: dialog popup and full-screen/widget
- 🎯 Date selection callback
- 🔒 Optional min/max date restriction
- 🎨 Fully themable via `AesCalendarTheme`
- 🔤 Customizable button labels via `AesCalendarTexts`
- 🧩 Lightweight and easy to integrate

---

## 📦 Installation

Add the dependency in your `pubspec.yaml`:

```yaml
dependencies:
  aes_calendar: ^0.0.7
```

Check [pub.dev](https://pub.dev/packages/aes_calendar) for the latest version.

Then run:

```bash
flutter pub get
```

---

## 🚀 Basic Usage

Import the package:

```dart
import 'package:aes_calendar/aes_calendar.dart';
```

There are two main ways to use the calendar.

### 1. Dialog popup

```dart
final selected = await AesCalendar.show(
  context,
  startDate: DateTime(2020, 1, 1),
  endDate: DateTime(2030, 12, 31),
);

if (selected != null) {
  print('Selected date: $selected');
}
```

### 2. Full-screen / embedded widget

```dart
class CalendarExample extends StatefulWidget {
  const CalendarExample({super.key});

  @override
  State<CalendarExample> createState() => _CalendarExampleState();
}

class _CalendarExampleState extends State<CalendarExample> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aes Calendar Example')),
      body: Center(
        child: AesCalendar(
          selectedDate: selectedDate,
          endDate: DateTime(2030),
          onDateSelected: (date) {
            setState(() {
              selectedDate = date;
            });
          },
        ),
      ),
    );
  }
}
```

---

## 🧩 Parameters

### `AesCalendar` widget

| Parameter           | Type                          | Required | Description |
|---------------------|-------------------------------|----------|-------------|
| `startDate`         | `DateTime?`                   | ❌ No    | Minimum selectable date |
| `endDate`           | `DateTime?`                   | ❌ No    | Maximum selectable date |
| `selectedDate`      | `DateTime?`                   | ❌ No    | Initially selected date |
| `onDateSelected`    | `ValueChanged<DateTime>?`     | ❌ No    | Callback when user selects a date |
| `showAsDialog`      | `bool`                        | ❌ No    | Internal flag for dialog mode (use `AesCalendar.show`) |
| `theme`             | `AesCalendarTheme?`           | ❌ No    | Visual customization (colors, radius, text styles, icons) |
| `texts`             | `AesCalendarTexts?`           | ❌ No    | Text customization (button labels, etc.) |
| `monthLabelBuilder` | `String Function(DateTime)?`  | ❌ No    | Custom month title builder for the header |

### `AesCalendar.show` (dialog helper)

```dart
static Future<DateTime?> show(
  BuildContext context, {
  DateTime? selectedDate,
  DateTime? startDate,
  DateTime? endDate,
  AesCalendarTheme? theme,
  AesCalendarTexts? texts,
  String Function(DateTime month)? monthLabelBuilder,
})
```

---

## 🎨 Customization

### Theme (colors, shapes, icons, text styles)

Use `AesCalendarTheme` to override visuals. Any field you omit falls back to sensible defaults based on `Theme.of(context)`:

```dart
AesCalendar(
  selectedDate: selectedDate,
  endDate: DateTime(2030),
  theme: const AesCalendarTheme(
    selectedDayBackgroundColor: Colors.teal,
    selectedDayTextColor: Colors.white,
    todayBackgroundColor: Color(0x332196F3),
    todayTextColor: Colors.black,
    disabledDayTextColor: Colors.redAccent,
    dayBorderRadius: BorderRadius.all(Radius.circular(12)),
    previousMonthIcon: Icons.arrow_back_ios_new,
    nextMonthIcon: Icons.arrow_forward_ios,
  ),
  onDateSelected: (date) => setState(() => selectedDate = date),
);
```

Key fields:

- `selectedDayBackgroundColor`, `selectedDayTextColor`
- `todayBackgroundColor`, `todayTextColor`
- `disabledDayTextColor`, `dayTextColor`
- `dayBorderRadius`
- `headerTextStyle`, `dayTextStyle`
- `previousMonthIcon`, `nextMonthIcon`

### Texts (button labels)

Use `AesCalendarTexts` to customize dialog buttons:

```dart
AesCalendar(
  texts: const AesCalendarTexts(
    cancelLabel: 'Close',
    okLabel: 'Select',
  ),
);
```

### Custom month header format

```dart
AesCalendar(
  monthLabelBuilder: (month) =>
      DateFormat('MMMM yyyy').format(month),
);
```

---

## 📁 Example Project

A full working example is available in the `/example` folder of this package.

To run it locally:

```bash
cd example
flutter run
```

---

## 📌 Version

Current version: **0.0.6**

See [CHANGELOG.md](CHANGELOG.md) for release history and changes.

---

## 🛠 Requirements

- Flutter SDK >= 3.0.0
- Dart SDK >= 3.0.0

---

## 📄 License

This project is licensed under the MIT License.

---

## 🤝 Contributions

Contributions, issues, and feature requests are welcome.

If you like this package, consider giving it a ⭐ on GitHub.