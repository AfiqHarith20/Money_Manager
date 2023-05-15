import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/api/api.dart';
import 'package:money_manager/constants.dart';
import 'package:money_manager/widget/icon_btn.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:sizer/sizer.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class NewRecordPage extends StatefulWidget {
  const NewRecordPage({Key? key}) : super(key: key);

  @override
  State<NewRecordPage> createState() => _NewRecordPageState();
}

class _NewRecordPageState extends State<NewRecordPage> {
  String _fromCurrency = 'MYR';
  String _toCurrency = 'USD';
  double _exchangeRate = 0.0;
  int _selectedOption = 1;
  TextEditingController _amountController = TextEditingController();
  final FocusNode _nodeNumber = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedOption = 1;
    // _fetchExchangeRate();
    // _amountController.addListener(_onAmountChanged);
  }

  // void _onAmountChanged() {
  //   setState(() {
  //     final amount = double.tryParse(_amountController.text) ?? 0.0;
  //     _amountController.text = NumberFormat.currency(
  //       locale: 'en_US',
  //       symbol: _selectedOption == 1 ? '\$' : 'RM',
  //       decimalDigits: 2,
  //     ).format(amount / _exchangeRate);
  //   });
  // }

  // Future<void> _fetchExchangeRate() async {
  //   try {
  //     final rate = await getExchangeRate(_fromCurrency, _toCurrency);
  //     setState(() {
  //       _exchangeRate = rate;
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardActionsItem(focusNode: _nodeNumber, toolbarButtons: [
          (node) {
            return GestureDetector(
              onTap: () => node.unfocus(),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Close",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            );
          }
        ])
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBtn(
          onPress: () {
            Navigator.pop(context);
          },
          iconData: Icons.cancel_outlined,
        ),
        actions: [
          CustomBtn(
            onPress: () {
              if (_amountController.text.isEmpty) {
                return;
              }
              Navigator.pop(context);
            },
            iconData: Icons.check_outlined,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomSlidingSegmentedControl(
              isStretch: true,
              fromMax: true,
              children: {
                1: Text(
                  'INCOME',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.abel(
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.0,
                  ),
                ),
                2: Text(
                  'EXPENSE',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.abel(
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.0,
                  ),
                ),
                3: Text(
                  'TRANSFER',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.abel(
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.0,
                  ),
                ),
              },
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              thumbDecoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                    offset: const Offset(
                      0.0,
                      2.0,
                    ),
                  ),
                ],
              ),
              onValueChanged: (int value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              margin: kMargin,
              padding: kPadding,
              height: 15.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: kRadius,
              ),
              child: TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                focusNode: _nodeNumber,
                textInputAction: TextInputAction.done,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: _amountController.text.isEmpty ? 36 : 36,
                ),
                decoration: InputDecoration(
                  labelText: _selectedOption == 1
                      ? 'Enter Income Amount'
                      : _selectedOption == 2
                          ? 'Enter Expense Amount'
                          : 'Enter Transfer Amount',
                  prefixIcon: _selectedOption == 1
                      ? Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 40,
                        )
                      : _selectedOption == 2
                          ? Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 40,
                            )
                          : Icon(
                              Icons.compare_arrows_rounded,
                              color: Colors.white,
                              size: 40,
                            ),
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 70,
                    minHeight: 100,
                  ),
                  contentPadding: EdgeInsets.only(bottom: 12),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 19.sp,
                    height: 1,
                  ),
                ),
              ),
            ),
            Container(
              margin: kMargin,
              padding: kPadding,
              height: 15.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: kRadius,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Exchange Rate',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 12.sp,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w500,
                      color: kTextColor,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '$_fromCurrency to $_toCurrency',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 12.sp,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w500,
                      color: kTextColor,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    _exchangeRate > 0.0
                        ? '1 $_fromCurrency = ${_exchangeRate.toStringAsFixed(2)} $_toCurrency'
                        : 'Loading...',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 12.sp,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w500,
                      color: kTextColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: kMargin,
              padding: kPadding,
              height: 10.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: kRadius,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
