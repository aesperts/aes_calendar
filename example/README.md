# aes_calendar

A customizable and lightweight Flutter calendar widget with built-in year–month selector and wheel picker support.

---

## 📸 Preview

![Aes Calendar Screenshot](assets/screenshot.png)

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

Run:

```bash
flutter pub get
```

---

## 🚀 Basic Usage

```dart
AesCalendar(
  selectedDate: DateTime.now(),
  endDate: DateTime(2030),
  onDateSelected: (date) {
    print(date);
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

## 📁 Example

A complete working example is available inside the `/example` folder.

To run it:

```bash
cd example
flutter run
```

---

## 🛠 Requirements

- Flutter >= 3.0.0
- Dart >= 3.0.0

---

## 📄 License

MIT License