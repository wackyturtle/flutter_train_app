import 'package:flutter/material.dart';

class SeatPageRow extends StatelessWidget {
  final int rowNum;
  const SeatPageRow(this.rowNum);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SeatBox(),
          const SizedBox(width: 4),
          SeatBox(),
          const SizedBox(width: 4),
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            child: Text('$rowNum', style: const TextStyle(fontSize: 18)),
          ),
          const SizedBox(width: 4),
          SeatBox(),
          const SizedBox(width: 4),
          SeatBox(),
        ],
      ),
    );
  }
}

class SeatBox extends StatelessWidget {
  const SeatBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
