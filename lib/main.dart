import 'package:flutter/material.dart';
import 'package:money_tracker/constants.dart';
import 'package:money_tracker/page/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Manager',
      theme: ThemeData(
        scaffoldBackgroundColor: kScaffoldColor,
        appBarTheme: AppBarTheme(),
      ),
      home: const HomePage(),
    );
  }
}
