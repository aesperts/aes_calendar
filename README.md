# aes_calendar

A customizable and lightweight Flutter calendar widget with built-in year–month selector and wheel picker support.

`aes_calendar` makes it easy to integrate a clean, interactive calendar into your Flutter app with minimal configuration.

---

## ✨ Features

- 📅 Interactive calendar UI
- 🗓 Year & Month selector
- 🎡 Wheel-style date picker
- 🎯 Date selection callback
- 🔒 Optional maximum date restriction
- 🧩 Lightweight and easy to integrate

---

## 📦 Installation

Add the dependency in your `pubspec.yaml`:

```yaml
dependencies:
  aes_calendar: ^0.0.1
```

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

Use `AesCalendar` inside your widget:

```dart
AesCalendar(
  selectedDate: DateTime.now(),
  endDate: DateTime(2030),
  onDateSelected: (date) {
    print("Selected Date: $date");
  },
)
```

---

## 🧩 Parameters

| Parameter        | Type                     | Required | Description |
|------------------|--------------------------|----------|-------------|
| `selectedDate`   | `DateTime`               | ✅ Yes   | Initially selected date |
| `endDate`        | `DateTime?`              | ❌ No    | Maximum selectable date |
| `onDateSelected` | `ValueChanged<DateTime>` | ✅ Yes   | Callback when date changes |

---

## 🏗 Complete Example

```dart
import 'package:flutter/material.dart';
import 'package:aes_calendar/aes_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalendarExample(),
    );
  }
}

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

## 📁 Example Project

A full working example is available in the `/example` folder of this package.

To run it locally:

```bash
cd example
flutter run
```

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