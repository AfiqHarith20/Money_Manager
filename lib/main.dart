import 'package:flutter/material.dart';
import 'package:money_manager/constants.dart';
import 'package:money_manager/page/homepage.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Expense Manager',
          theme: ThemeData(
            scaffoldBackgroundColor: kScaffoldColor,
            appBarTheme: AppBarTheme(
              backgroundColor: kPrimaryColor,
              iconTheme: IconThemeData(
                size: 23,
                color: kSecondaryColor,
              ),
            ),
            iconTheme: IconThemeData(
              size: 23,
              color: kSecondaryColor,
            ),
          ),
          home: HomePage(
            expenses: [],
          ),
        );
      },
    );
  }
}
