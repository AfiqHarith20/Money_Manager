import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/constants.dart';
import 'package:money_manager/data/data.dart';
import 'package:money_manager/models/cost_model.dart';
import 'package:money_manager/models/type_model.dart';
import 'package:money_manager/page/detail_page.dart';
import 'package:money_manager/widget/custom_chart.dart';
import 'package:money_manager/widget/icon_btn.dart';
import 'package:sizer/sizer.dart';
import 'package:speed_dial_fab/speed_dial_fab.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDialFabWidget(
        secondaryIconsList: [
          Icons.lightbulb_circle_rounded,
          Icons.compare_arrows_rounded,
          Icons.mode_edit_outline,
        ],
        secondaryIconsText: [
          "Create First Template",
          "Transfer",
          "Edit",
        ],
        secondaryIconsOnPress: [
          () {},
          () {},
          () {},
        ],
        primaryBackgroundColor: Colors.blueAccent,
        primaryForegroundColor: Colors.white,
        secondaryBackgroundColor: Colors.lightGreen,
        secondaryForegroundColor: Colors.white,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            forceElevated: true,
            floating: true,
            expandedHeight: 10.h,
            leading: CustomBtn(
              onPress: () {},
              iconData: Icons.menu,
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
                iconData: Icons.notifications,
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, int index) {
                if (index == 0) {
                  return Container(
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
                    child: CustomChart(
                      expenses: weeklySpending,
                    ),
                  );
                } else {
                  final TypeModel typeModel = typeNames[index - 1];
                  double tAmountSpent = 0;
                  typeModel.expenses!.forEach((CostModel expense) {
                    tAmountSpent += expense.cost!;
                  });
                  return _buildCategories(typeModel, tAmountSpent);
                }
              },
              childCount: 1 + typeNames.length,
            ),
          ),
        ],
      ),
    );
  }

  _buildCategories(TypeModel category, double tAmountSpent) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              typeModel: category,
            ),
          ),
        );
      },
      child: Container(
        width: 100.w,
        height: 13.h,
        margin: kMargin,
        padding: kPadding,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: kRadius,
        ),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category.name!,
                style: GoogleFonts.abel(
                  fontSize: 14.sp,
                  color: kTextColor,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.0,
                ),
              ),
              Text(
                '\RM${(category.maxAmount! - tAmountSpent).toStringAsFixed(2)} / \RM${category.maxAmount!.toStringAsFixed(2)}',
                style: GoogleFonts.atma(
                  fontSize: 14.sp,
                  color: kTextColor,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final double maxBarWidth = constraints.maxWidth;
              final double percentage =
                  (category.maxAmount! - tAmountSpent) / category.maxAmount!;
              double width = percentage * maxBarWidth;
              if (width < 0) {
                width = 0;
              }
              return Stack(
                children: [
                  Container(
                    height: 3.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(2.h),
                        bottomRight: Radius.circular(2.h),
                      ),
                    ),
                  ),
                  Container(
                    height: 3.h,
                    width: width,
                    decoration: BoxDecoration(
                      color: setupColor(percentage),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(2.h),
                        bottomRight: Radius.circular(2.h),
                      ),
                    ),
                  ),
                ],
              );
            },
          )
        ]),
      ),
    );
  }
}
