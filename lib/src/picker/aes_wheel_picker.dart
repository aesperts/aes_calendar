import 'package:flutter/material.dart';

/// Generic wheel picker used for year and month selection.
class AesWheelPicker<T> extends StatelessWidget {
  final List<T> items;
  final T selectedItem;
  final ValueChanged<T> onChanged;
  final String Function(T) itemLabel;

  const AesWheelPicker({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
    required this.itemLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListWheelScrollView.useDelegate(
        controller: FixedExtentScrollController(
          initialItem: items.indexOf(selectedItem),
        ),
        itemExtent: 40,
        physics: const FixedExtentScrollPhysics(),
        onSelectedItemChanged: (index) =>
            onChanged(items[index]),
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: items.length,
          builder: (context, index) {
            return Center(
              child: Text(itemLabel(items[index])),
            );
          },
        ),
      ),
    );
  }
}