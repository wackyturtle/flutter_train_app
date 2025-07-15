import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_app/seat/widget/Seat_Box.dart';

class SeatPage extends StatefulWidget {
  final String startStation;
  final String endStation;

  SeatPage(this.startStation, this.endStation);

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  int? selectedRow;
  int? selectedCol;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('좌석 선택'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SeatPageStation(widget.startStation),
                SizedBox(width: 50),
                Icon(Icons.arrow_circle_right_outlined, size: 30),
                SizedBox(width: 50),
                SeatPageStation(widget.endStation),
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
                  for (int i = 1; i <= 20; i++)
                    SeatPageRow(
                      rowNum: i,
                      selectedRow: selectedRow,
                      selectedCol: selectedCol,
                      onSelected: (row, col) {
                        setState(() {
                          selectedRow = row;
                          selectedCol = col;
                        });
                      },
                    ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (selectedRow == null || selectedCol == null) {
                    return;
                  }

                  showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text('예매 하시겠습니까?'),
                        content: Text(
                          '좌석 : $selectedRow-${String.fromCharCode(65 + (selectedCol ?? 1))}',
                        ),
                        actions: [
                          CupertinoDialogAction(
                            child: Text('취소'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          CupertinoDialogAction(
                            child: Text('확인'),
                            isDestructiveAction: true,
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
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
