import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utils/date_utils.dart';
import 'aes_year_month_picker.dart';

/// A customizable calendar widget with:
/// - Month navigation
/// - Swipe support
/// - Date range restriction
/// - Optional dialog mode
class AesCalendar extends StatefulWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? selectedDate;
  final ValueChanged<DateTime>? onDateSelected;
  final bool showAsDialog;

  const AesCalendar({
    super.key,
    this.startDate,
    this.endDate,
    this.selectedDate,
    this.onDateSelected,
    this.showAsDialog = false,
  });

  /// Opens calendar as dialog and returns selected date.
  static Future<DateTime?> show(
      BuildContext context, {
        DateTime? selectedDate,
        DateTime? startDate,
        DateTime? endDate,
      }) {
    return showDialog(
      context: context,
      builder: (_) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: AesCalendar(
            selectedDate: selectedDate,
            startDate: startDate,
            endDate: endDate,
            showAsDialog: true,
            onDateSelected: (date) =>
                Navigator.pop(context, date),
          ),
        ),
      ),
    );
  }

  @override
  State<AesCalendar> createState() => _AesCalendarState();
}

class _AesCalendarState extends State<AesCalendar> {
  late DateTime _currentMonth;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.selectedDate ?? widget.startDate ?? DateTime.now();
    _currentMonth = DateTime(_selectedDate!.year, _selectedDate!.month);
  }

  bool _isDisabled(DateTime date) {
    final stripped = AesDateUtils.strip(date);

    if (widget.startDate != null &&
        stripped.isBefore(AesDateUtils.strip(widget.startDate!))) {
      return true;
    }

    if (widget.endDate != null &&
        stripped.isAfter(AesDateUtils.strip(widget.endDate!))) {
      return true;
    }

    return false;
  }

  bool _canMoveTo(DateTime month) {
    final first = DateTime(month.year, month.month, 1);
    final last = DateTime(month.year, month.month + 1, 0);

    if (widget.startDate != null &&
        last.isBefore(widget.startDate!)) {
      return false;
    }

    if (widget.endDate != null &&
        first.isAfter(widget.endDate!)) {
      return false;
    }

    return true;
  }

  List<DateTime> _monthDays(DateTime month) {
    final first = DateTime(month.year, month.month, 1);
    final last = DateTime(month.year, month.month + 1, 0);
    final weekdayOffset = first.weekday - 1;

    return [
      ...List.generate(
        weekdayOffset,
            (i) => first.subtract(Duration(days: weekdayOffset - i)),
      ),
      ...List.generate(
        last.day,
            (i) => DateTime(month.year, month.month, i + 1),
      ),
    ];
  }

  void _openYearMonthPicker() {
    showDialog(
      context: context,
      builder: (_) => AesYearMonthPicker(
        initialDate: _currentMonth,
        startDate: widget.startDate,
        endDate: widget.endDate,
        onSelected: (date) {
          setState(() => _currentMonth = date);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final days = _monthDays(_currentMonth);
    final today = AesDateUtils.strip(DateTime.now());

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: _canMoveTo(
                  DateTime(_currentMonth.year, _currentMonth.month - 1))
                  ? () => setState(() {
                _currentMonth = DateTime(
                  _currentMonth.year,
                  _currentMonth.month - 1,
                );
              })
                  : null,
            ),

            GestureDetector(
              onTap: _openYearMonthPicker,
              child: Text(
                DateFormat.yMMM().format(_currentMonth),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),

            IconButton(
              icon: const Icon(Icons.chevron_right),
              onPressed: _canMoveTo(
                  DateTime(_currentMonth.year, _currentMonth.month + 1))
                  ? () => setState(() {
                _currentMonth = DateTime(
                  _currentMonth.year,
                  _currentMonth.month + 1,
                );
              })
                  : null,
            ),
          ],
        ),

        const SizedBox(height: 12),

        /// Calendar Grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
          ),
          itemCount: days.length,
          itemBuilder: (context, index) {
            final date = days[index];
            final isDisabled = _isDisabled(date);
            final isToday =
            AesDateUtils.isSameDate(date, today);
            final isSelected = _selectedDate != null &&
                AesDateUtils.isSameDate(date, _selectedDate!);

            return GestureDetector(
              onTap: isDisabled
                  ? null
                  : () {
                setState(() => _selectedDate = date);
                widget.onDateSelected?.call(date);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : isToday
                      ? Theme.of(context)
                      .colorScheme
                      .primary
                      .withOpacity(0.2)
                      : null,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${date.day}',
                  style: TextStyle(
                    color: isDisabled
                        ? Colors.grey
                        : isSelected
                        ? Colors.white
                        : null,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}