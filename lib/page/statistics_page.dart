import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/constants.dart';
import 'package:money_manager/data/data.dart';
import 'package:money_manager/widget/chart.dart';
import 'package:sizer/sizer.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  List day = ['Day', 'Week', 'Month', 'Year'];
  int index_color = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Statistics",
          style: GoogleFonts.aBeeZee(
            fontSize: 16.sp,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w500,
            color: kTextColor,
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          4,
                          (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  index_color = index;
                                });
                              },
                              child: Container(
                                height: 5.h,
                                width: 20.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: index_color == index
                                      ? Colors.greenAccent
                                      : Colors.white,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  day[index],
                                  style: GoogleFonts.abel(
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: kMargin,
                          padding: kPadding,
                          height: 7.h,
                          width: 32.w,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(47, 125, 121, 0.3),
                                offset: Offset(0, 6),
                                blurRadius: 12,
                                spreadRadius: 6,
                              ),
                            ],
                            color: kPrimaryColor,
                            borderRadius: kRadius,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Expense",
                                style: GoogleFonts.abel(
                                  fontSize: 14.sp,
                                  color: kTextColor,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0,
                                ),
                              ),
                              Icon(
                                Icons.arrow_downward_sharp,
                                color: kTextColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: kMargin,
                    padding: kPadding,
                    height: 30.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: kRadius,
                    ),
                    // child: Chart(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Top Spending",
                          style: GoogleFonts.abel(
                            fontSize: 14.sp,
                            color: kTextColor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                        Icon(
                          Icons.swap_vert,
                          size: 25,
                          color: kTextColor,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ListTile(
                    leading: Image.asset(
                      'assets/images/${geter_top()[index].image}',
                      height: 50,
                    ),
                    title: Text(
                      geter_top()[index].name,
                      style: GoogleFonts.breeSerif(
                        fontWeight: FontWeight.w600,
                        color: kTextColor,
                        fontSize: 12.sp,
                        letterSpacing: 2.0,
                      ),
                    ),
                    subtitle: Text(
                      geter_top()[index].time,
                      style: GoogleFonts.aubrey(
                        fontWeight: FontWeight.w500,
                        color: kTextColor,
                        fontSize: 12.sp,
                        letterSpacing: 2.0,
                      ),
                    ),
                    trailing: Text(
                      geter_top()[index].fee,
                      style: GoogleFonts.aubrey(
                        fontWeight: FontWeight.w700,
                        color: Colors.red,
                        fontSize: 12.sp,
                        letterSpacing: 2.0,
                      ),
                    ),
                  );
                },
                childCount: geter_top().length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
