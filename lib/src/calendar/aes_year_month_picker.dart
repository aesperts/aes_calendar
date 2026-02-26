import 'package:flutter/material.dart';
import '../picker/aes_wheel_picker.dart';

/// A dialog widget that allows selecting a year and month
/// using two wheel pickers.
///
/// Used internally by [AesCalendar].
class AesYearMonthPicker extends StatefulWidget {
  /// Initial displayed date (year & month will be used)
  final DateTime initialDate;

  /// Optional minimum allowed date
  final DateTime? startDate;

  /// Optional maximum allowed date
  final DateTime? endDate;

  /// Callback when user confirms selection
  final ValueChanged<DateTime> onSelected;

  const AesYearMonthPicker({
    super.key,
    required this.initialDate,
    required this.onSelected,
    this.startDate,
    this.endDate,
  });

  @override
  State<AesYearMonthPicker> createState() =>
      _AesYearMonthPickerState();
}

class _AesYearMonthPickerState
    extends State<AesYearMonthPicker> {
  late DateTime _selected;

  @override
  void initState() {
    super.initState();
    _selected = DateTime(
      widget.initialDate.year,
      widget.initialDate.month,
    );
  }

  /// Checks whether the given year-month combination
  /// is within the allowed range.
  bool _isInRange(DateTime date) {
    if (widget.startDate != null) {
      final min = DateTime(
        widget.startDate!.year,
        widget.startDate!.month,
      );

      if (date.isBefore(min)) return false;
    }

    if (widget.endDate != null) {
      final max = DateTime(
        widget.endDate!.year,
        widget.endDate!.month,
      );

      if (date.isAfter(max)) return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final minYear =
        widget.startDate?.year ?? DateTime.now().year - 50;
    final maxYear =
        widget.endDate?.year ?? DateTime.now().year + 50;

    final years = List.generate(
      maxYear - minYear + 1,
          (index) => minYear + index,
    );

    final months = List.generate(12, (index) => index + 1);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Wheel pickers row
            SizedBox(
              height: 160,
              child: Row(
                children: [
                  /// Year Picker
                  AesWheelPicker<int>(
                    items: years,
                    selectedItem: _selected.year,
                    itemLabel: (year) => year.toString(),
                    onChanged: (year) {
                      final candidate =
                      DateTime(year, _selected.month);

                      if (_isInRange(candidate)) {
                        setState(() {
                          _selected = candidate;
                        });
                      }
                    },
                  ),

                  const SizedBox(width: 12),

                  /// Month Picker
                  AesWheelPicker<int>(
                    items: months,
                    selectedItem: _selected.month,
                    itemLabel: (month) => month
                        .toString()
                        .padLeft(2, '0'),
                    onChanged: (month) {
                      final candidate =
                      DateTime(_selected.year, month);

                      if (_isInRange(candidate)) {
                        setState(() {
                          _selected = candidate;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// Action buttons
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.onSelected(_selected);
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}