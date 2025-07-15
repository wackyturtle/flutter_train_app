import 'package:flutter/material.dart';

class SelectStation extends StatelessWidget {
  String title;
  String station;

  SelectStation(this.title, this.station);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(station, style: TextStyle(fontSize: 40)),
      ],
    );
  }
}
