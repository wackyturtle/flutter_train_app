import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  final String title;
  final String? excludeStation;

  StationListPage({required this.title, this.excludeStation});

  static const List<String> stations = [
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
    final filteredStations = excludeStation == null
        ? stations
        : stations.where((s) => s != excludeStation).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: ListView(
        children: [
          for (var station in filteredStations)
            GestureDetector(
              onTap: () => Navigator.pop(context, station),
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
                ),
                child: Text(
                  station,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

Widget station(String stationName, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pop(context, stationName);
    },
    child: Container(
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
    ),
  );
}
