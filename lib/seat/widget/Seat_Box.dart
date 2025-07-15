import 'package:flutter/material.dart';

class SeatPageRow extends StatelessWidget {
  final int rowNum;
  final int? selectedRow;
  final int? selectedCol;
  final Function(int row, int col) onSelected;

  const SeatPageRow({
    required this.rowNum,
    required this.selectedRow,
    required this.selectedCol,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SeatBox(
            isSelected: selectedRow == rowNum && selectedCol == 0,
            onTap: () => onSelected(rowNum, 0),
          ),
          const SizedBox(width: 4),
          SeatBox(
            isSelected: selectedRow == rowNum && selectedCol == 1,
            onTap: () => onSelected(rowNum, 1),
          ),
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            child: Text('$rowNum', style: const TextStyle(fontSize: 18)),
          ),
          const SizedBox(width: 4),
          SeatBox(
            isSelected: selectedRow == rowNum && selectedCol == 2,
            onTap: () => onSelected(rowNum, 2),
          ),
          const SizedBox(width: 4),
          SeatBox(
            isSelected: selectedRow == rowNum && selectedCol == 3,
            onTap: () => onSelected(rowNum, 3),
          ),
        ],
      ),
    );
  }
}

class SeatBox extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const SeatBox({required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
