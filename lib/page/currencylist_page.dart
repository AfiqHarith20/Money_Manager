import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/constants.dart';
import 'package:sizer/sizer.dart';

class CurrencyList extends StatefulWidget {
  const CurrencyList({Key? key}) : super(key: key);

  @override
  State<CurrencyList> createState() => _CurrencyListState();
}

class _CurrencyListState extends State<CurrencyList> {
  final List<String> _currencies = ['USD', 'EUR', 'GBP', 'JPY', 'IDR', 'SGD'];
  final Map<String, double> _rates = {
    'USD': 4.15,
    'EUR': 4.94,
    'GBP': 5.89,
    'JPY': 0.038,
    'IDR': 0.00029,
    'SGD': 3.11,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Exchange Rates',
          style: GoogleFonts.aBeeZee(
            fontSize: 16.sp,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w500,
            color: kTextColor,
          ),
        ),
      ),
      body: Container(
        width: 100.w,
        height: 50.h,
        margin: kMargin,
        padding: kPadding,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: kRadius,
        ),
        child: ListView.builder(
          itemCount: _currencies.length,
          itemBuilder: (BuildContext context, int index) {
            final String currency = _currencies[index];
            final double rate = _rates[currency]!;
            return ListTile(
              title: Text(
                currency,
                style: GoogleFonts.abel(
                  fontSize: 14.sp,
                  color: kTextColor,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.0,
                ),
              ),
              subtitle: Text(
                '1 $currency = ${rate.toStringAsFixed(5)} MYR',
                style: GoogleFonts.abel(
                  fontSize: 14.sp,
                  color: kTextColor,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.0,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
