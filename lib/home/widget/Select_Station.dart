import 'package:flutter/material.dart';

class SelectStation extends StatelessWidget {
  final String select;

  const SelectStation(this.select);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '출발역',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(select, style: TextStyle(fontSize: 40)),
      ],
    );
  }
}
