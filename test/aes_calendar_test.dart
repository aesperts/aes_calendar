import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:aes_calendar/aes_calendar.dart';

void main() {
  group('AesCalendar Widget Tests', () {

    testWidgets('renders without crashing',
            (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: Scaffold(
                body: AesCalendar(),
              ),
            ),
          );

          expect(find.byType(AesCalendar), findsOneWidget);
        });

    testWidgets('displays correct initial month header',
            (WidgetTester tester) async {
          final testDate = DateTime(2025, 5, 10);

          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: AesCalendar(
                  selectedDate: testDate,
                ),
              ),
            ),
          );

          final expectedHeader =
          DateFormat.yMMM().format(testDate);

          expect(find.text(expectedHeader), findsOneWidget);
        });

    testWidgets('calls onDateSelected when tapping a date',
            (WidgetTester tester) async {
          DateTime? selectedDate;

          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: AesCalendar(
                  selectedDate: DateTime(2025, 5, 1),
                  onDateSelected: (date) {
                    selectedDate = date;
                  },
                ),
              ),
            ),
          );

          // Tap on a visible date
          await tester.tap(find.text('15').first);
          await tester.pump();

          expect(selectedDate, isNotNull);
          expect(selectedDate!.day, 15);
        });

    testWidgets('does not allow selecting date before startDate',
            (WidgetTester tester) async {
          DateTime? selectedDate;

          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: AesCalendar(
                  startDate: DateTime(2025, 5, 10),
                  selectedDate: DateTime(2025, 5, 10),
                  onDateSelected: (date) {
                    selectedDate = date;
                  },
                ),
              ),
            ),
          );

          // Try tapping a disabled date
          await tester.tap(find.text('5').first);
          await tester.pump();

          // Should not change selection
          expect(selectedDate, isNull);
        });

    testWidgets('navigates to next month when right arrow tapped',
            (WidgetTester tester) async {
          final testDate = DateTime(2025, 5, 10);

          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: AesCalendar(
                  selectedDate: testDate,
                ),
              ),
            ),
          );

          // Tap next month arrow
          await tester.tap(find.byIcon(Icons.chevron_right));
          await tester.pump();

          final nextMonth =
          DateFormat.yMMM().format(DateTime(2025, 6));

          expect(find.text(nextMonth), findsOneWidget);
        });

    testWidgets('opens year-month picker dialog',
            (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: Scaffold(
                body: AesCalendar(),
              ),
            ),
          );

          // Tap on header text to open picker
          await tester.tap(find.byType(GestureDetector).first);
          await tester.pumpAndSettle();

          expect(find.byType(Dialog), findsOneWidget);
        });
  });
}