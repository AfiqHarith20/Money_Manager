import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  int _selectedOption = 1;
  TextEditingController _amountController = TextEditingController();
  final FocusNode _nodeNumber = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedOption = 1;
  }

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [KeyboardActionsItem(focusNode: _nodeNumber)],
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
              Navigator.pop(context);
            },
            iconData: Icons.check_outlined,
          ),
        ],
      ),
      body: Column(
        children: [
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
            height: 35.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: kRadius,
            ),
            child: TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              focusNode: _nodeNumber,
              style: TextStyle(color: Colors.white),
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
                  minWidth: 48,
                  minHeight: 48,
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
        ],
      ),
    );
  }
}
