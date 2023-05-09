// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/constants.dart';
import 'package:money_manager/page/homepage.dart';
import 'package:money_manager/widget/icon_btn.dart';
import 'package:sizer/sizer.dart';

class CustomChart extends StatelessWidget {
  final List<double> expenses;
  CustomChart({
    Key? key,
    required this.expenses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    expenses.forEach((double price) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    });
    return Padding(
      padding: EdgeInsets.all(
        1.w,
      ),
      child: Column(
        children: [
          Text(
            'Weekly Spending',
            style: GoogleFonts.abel(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: kTextColor,
              letterSpacing: 1.0,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomBtn(onPress: () {}, iconData: Icons.arrow_back_outlined),
              Text(
                "10 Nov 2023 - 18 Nov 2023",
                style: GoogleFonts.atma(
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp,
                  color: kTextColor,
                ),
              ),
              CustomBtn(onPress: () {}, iconData: Icons.arrow_forward_outlined),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomBar(
                day: 'Mon',
                amountSpent: expenses[0],
                expensive: mostExpensive,
              ),
              CustomBar(
                day: 'Tue',
                amountSpent: expenses[1],
                expensive: mostExpensive,
              ),
              CustomBar(
                day: 'Wed',
                amountSpent: expenses[2],
                expensive: mostExpensive,
              ),
              CustomBar(
                day: 'Thur',
                amountSpent: expenses[3],
                expensive: mostExpensive,
              ),
              CustomBar(
                day: 'Fri',
                amountSpent: expenses[4],
                expensive: mostExpensive,
              ),
              CustomBar(
                day: 'Sat',
                amountSpent: expenses[5],
                expensive: mostExpensive,
              ),
              CustomBar(
                day: 'Sun',
                amountSpent: expenses[6],
                expensive: mostExpensive,
              )
            ],
          )
        ],
      ),
    );
  }
}

class CustomBar extends StatelessWidget {
  final String day;
  final double amountSpent;
  final double expensive;
  final double _maxBarHeight = 20.h;
  CustomBar({
    Key? key,
    required this.day,
    required this.amountSpent,
    required this.expensive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / expensive * _maxBarHeight;
    return Column(
      children: [
        Text(
          "RM${amountSpent.toStringAsFixed(2)}",
          style: GoogleFonts.aubrey(
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
            color: kTextColor,
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Container(
          height: barHeight,
          width: 3.w,
          decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(1.h),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          day,
          style: GoogleFonts.aubrey(
            fontSize: 11.sp,
            fontWeight: FontWeight.w600,
            color: kTextColor,
          ),
        ),
      ],
    );
  }
}
