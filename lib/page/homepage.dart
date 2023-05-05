import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/constants.dart';
import 'package:money_manager/widget/icon_btn.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  final List<double> expenses;
  const HomePage({
    Key? key,
    required this.expenses,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    widget.expenses.forEach((double price) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    });
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            forceElevated: true,
            floating: true,
            expandedHeight: 10.h,
            leading: CustomBtn(
              onPress: () {},
              iconData: Icons.settings_outlined,
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "My Budget",
                style: GoogleFonts.aBeeZee(
                  fontSize: 12.sp,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w500,
                  color: kTextColor,
                ),
              ),
            ),
            actions: [
              CustomBtn(
                onPress: () {},
                iconData: Icons.add_outlined,
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, int index) => Container(
                margin: EdgeInsets.only(
                  left: 2.w,
                  right: 2.w,
                  top: 2.w,
                  bottom: 2.w,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(3.h),
                ),
                child: Padding(
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
                          CustomBtn(
                              onPress: () {},
                              iconData: Icons.arrow_back_outlined),
                          Text(
                            "10 Nov 2023 - 18 Nov 2023",
                            style: GoogleFonts.atma(
                              fontWeight: FontWeight.w600,
                              fontSize: 13.sp,
                              color: kTextColor,
                            ),
                          ),
                          CustomBtn(
                              onPress: () {},
                              iconData: Icons.arrow_forward_outlined),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          CustomBar(
                            day: 'su',
                            amountSpent: widget.expenses[0],
                            expensive: mostExpensive,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              childCount: 1,
            ),
          ),
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
          "/RM${amountSpent.toStringAsFixed(2)}",
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
