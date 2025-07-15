import 'package:flutter/material.dart';

class SeatPage extends StatelessWidget {
  static const int _rowCount = 20;

  String startStation = '출발역';
  String endStation = '도착역';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('좌석 선택'),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios_new_outlined),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SeatPageStation(startStation),
                SizedBox(width: 50),
                Icon(Icons.arrow_circle_right_outlined, size: 30),
                SizedBox(width: 50),
                SeatPageStation(endStation),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                seatPageSeatState(Colors.purple),
                const SizedBox(width: 4),
                const Text('선택됨'),
                const SizedBox(width: 20),
                // 선택안됨
                seatPageSeatState(Colors.grey[300]!),
                const SizedBox(width: 4),
                const Text('선택안됨'),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SeatLabel('A'),
                      SeatLabel('B'),
                      SizedBox(width: 50, height: 50),
                      SeatLabel('C'),
                      SeatLabel('D'),
                    ],
                  ),
                  for (int i = 1; i <= 20; i++) SeatPageRow(i),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  '예매 하기',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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

Container seatPageSeatState(final Color color) {
  return Container(
    width: 24,
    height: 24,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );
}

class SeatPageStation extends StatelessWidget {
  final String station;
  const SeatPageStation(this.station);

  @override
  Widget build(BuildContext context) {
    return Text(
      station,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.purple,
      ),
    );
  }
}

class SeatLabel extends StatelessWidget {
  final String label;
  const SeatLabel(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      child: Text(label, style: const TextStyle(fontSize: 18)),
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
