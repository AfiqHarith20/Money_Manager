// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/constants.dart';
import 'package:money_manager/models/cost_model.dart';
import 'package:money_manager/models/type_model.dart';
import 'package:money_manager/widget/circle_painter.dart';
import 'package:money_manager/widget/icon_btn.dart';
import 'package:sizer/sizer.dart';

class DetailPage extends StatefulWidget {
  final TypeModel? typeModel;
  const DetailPage({
    Key? key,
    this.typeModel,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    double tAmountSpent = 0;
    widget.typeModel!.expenses!.forEach((CostModel expenses) {
      tAmountSpent += expenses.cost!;
    });
    final double amountLeft = widget.typeModel!.maxAmount! - tAmountSpent;
    final double percentage = amountLeft / widget.typeModel!.maxAmount!;
    return Scaffold(
      appBar: AppBar(
        leading: CustomBtn(
          onPress: () {
            Navigator.pop(context);
          },
          iconData: Icons.arrow_back_outlined,
        ),
        title: Text(
          widget.typeModel!.name!,
          style: GoogleFonts.aBeeZee(
            fontSize: 12.sp,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w500,
            color: kTextColor,
          ),
        ),
        actions: [
          CustomBtn(
            onPress: () {
              Navigator.pop(context);
            },
            iconData: Icons.add_outlined,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: kMargin,
              padding: kPadding,
              height: 35.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: kRadius,
              ),
              child: CustomPaint(
                foregroundPainter: CirclePainter(
                  bgColor: Colors.grey[200],
                  lineColor: setupColor(percentage),
                  percentage: percentage,
                  width: 5.w,
                ),
                child: Center(
                  child: Text(
                    '\RM${amountLeft.toStringAsFixed(2)} / \RM${widget.typeModel!.maxAmount!}',
                    style: GoogleFonts.aubrey(
                      fontWeight: FontWeight.w500,
                      color: kSecondaryColor,
                      fontSize: 16.sp,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            _buildExpenseList(),
          ],
        ),
      ),
    );
  }

  _buildExpenseList() {
    List<Widget> expenseList = [];
    widget.typeModel!.expenses!.forEach((CostModel expense) {
      expenseList.add(
        Container(
          width: 100.w,
          height: 10.h,
          margin: kMargin,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: kRadius,
          ),
          child: Padding(
            padding: kPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  expense.name!,
                  style: GoogleFonts.atma(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: kTextColor,
                    letterSpacing: 1.0,
                  ),
                ),
                Text(
                  '\RM${expense.cost!.toStringAsFixed(2)}',
                  style: GoogleFonts.atma(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: kSecondaryColor,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
    return Column(
      children: expenseList,
    );
  }
}
