import 'package:flutter/material.dart';
import 'package:flutter_train_app/home/Home_Page.dart';
import 'package:flutter_train_app/home/gpt.dart';
import 'package:flutter_train_app/station/Station_List_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: StationListPage());
  }
}
