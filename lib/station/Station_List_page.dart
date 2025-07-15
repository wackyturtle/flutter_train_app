import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  final List<String> stations = [
    '동탄',
    '평택지제',
    '천안아산',
    '오송',
    '대전',
    '김천구미',
    '동대구',
    '경주',
    '울산',
    '부산',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('출발역'),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios_new_outlined),
      ),
      body: ListView(children: [for (var i in stations) station(i)]),
    );
  }
}

Widget station(String stationName) {
  return Container(
    height: 50,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
    ),
    child: Text(
      stationName,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}
