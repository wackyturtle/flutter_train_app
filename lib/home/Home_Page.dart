import 'package:flutter/material.dart';
import 'package:flutter_train_app/home/widget/Select_Station.dart';
import 'package:flutter_train_app/seat/Seat_Page.dart';
import 'package:flutter_train_app/station/Station_List_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String StartStation = '선택';
  String EndStation = '선택';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('기차 예매')),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StationListPage(
                            title: '출발역',
                            excludeStation: EndStation == '선택'
                                ? null
                                : EndStation,
                          ),
                        ),
                      );
                      setState(() {
                        StartStation = result;
                      });
                    },
                    child: SelectStation('출발역', StartStation),
                  ),
                  Container(color: Colors.grey[400], height: 50, width: 2),
                  GestureDetector(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StationListPage(
                            title: '도착역',
                            excludeStation: StartStation == '선택'
                                ? null
                                : StartStation,
                          ),
                        ),
                      );
                      setState(() {
                        EndStation = result;
                      });
                    },
                    child: SelectStation('도착역', EndStation),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (StartStation != '선택' && EndStation != '선택') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SeatPage(StartStation, EndStation);
                        },
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.purple,
                ),
                child: Text(
                  '좌석 선택',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
