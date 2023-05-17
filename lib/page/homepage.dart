import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/constants.dart';
import 'package:money_manager/data/data.dart';
import 'package:money_manager/models/cost_model.dart';
import 'package:money_manager/models/type_model.dart';
import 'package:money_manager/page/detail_page.dart';
import 'package:money_manager/page/drawer_page.dart';
import 'package:money_manager/page/newrecord_page.dart';
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
          "New Record",
        ],
        secondaryIconsOnPress: [
          () {},
          () {},
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewRecordPage(),
              ),
            );
          },
        ],
        primaryBackgroundColor: Colors.blueAccent,
        primaryForegroundColor: Colors.white,
        secondaryBackgroundColor: Colors.lightGreen,
        secondaryForegroundColor: Colors.white,
      ),
      drawer: DrawerPage(),
      appBar: AppBar(
        title: Text(
          'My Budget',
          style: GoogleFonts.aBeeZee(
            fontSize: 16.sp,
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
            iconData: Icons.notifications,
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 36.h,
                child: _head(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transaction History",
                      style: GoogleFonts.aubrey(
                        fontWeight: FontWeight.w600,
                        color: kTextColor,
                        fontSize: 16.sp,
                        letterSpacing: 2.0,
                      ),
                    ),
                    Text(
                      "See all..",
                      style: GoogleFonts.aubrey(
                        fontWeight: FontWeight.w600,
                        color: kTextColorShade,
                        fontSize: 12.sp,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      'assets/images/${geter()[index].image}',
                    ),
                  ),
                  title: Text(
                    geter()[index].name,
                    style: GoogleFonts.breeSerif(
                      fontWeight: FontWeight.w600,
                      color: kTextColor,
                      fontSize: 12.sp,
                      letterSpacing: 2.0,
                    ),
                  ),
                  subtitle: Text(
                    geter()[index].time,
                    style: GoogleFonts.aubrey(
                      fontWeight: FontWeight.w500,
                      color: kTextColor,
                      fontSize: 12.sp,
                      letterSpacing: 2.0,
                    ),
                  ),
                  trailing: Text(
                    geter()[index].fee,
                    style: GoogleFonts.aubrey(
                      fontWeight: FontWeight.w500,
                      color: geter()[index].buy ? Colors.red : Colors.green,
                      fontSize: 12.sp,
                      letterSpacing: 2.0,
                    ),
                  ),
                );
              }, childCount: geter().length),
            ),
          ],
        ),
      ),
    );
  }

  Widget _head() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 25.h,
              decoration: BoxDecoration(
                color: Color(0xff368983),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 35,
                      left: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good Morning",
                          style: GoogleFonts.aubrey(
                            fontWeight: FontWeight.w500,
                            color: kTextColor,
                            fontSize: 12.sp,
                            letterSpacing: 2.0,
                          ),
                        ),
                        Text(
                          "Afiq Harith",
                          style: GoogleFonts.breeSerif(
                            fontWeight: FontWeight.w600,
                            color: kTextColor,
                            fontSize: 16.sp,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 140,
          left: 50,
          right: 50,
          child: Container(
            height: 20.h,
            width: 40.w,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(47, 125, 121, 0.3),
                  offset: Offset(0, 6),
                  blurRadius: 12,
                  spreadRadius: 6,
                ),
              ],
              color: Color.fromARGB(255, 47, 125, 121),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Balance",
                        style: GoogleFonts.aubrey(
                          fontWeight: FontWeight.w600,
                          color: kTextColor,
                          fontSize: 12.sp,
                          letterSpacing: 1.0,
                        ),
                      ),
                      Icon(
                        Icons.more_horiz_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Text(
                        "\RM 3,759.90",
                        style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.bold,
                          color: kTextColor,
                          fontSize: 14.sp,
                          letterSpacing: 1.0,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 13,
                            backgroundColor: Color.fromARGB(255, 85, 145, 141),
                            child: Icon(
                              Icons.arrow_downward_outlined,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "Income",
                            style: GoogleFonts.aubrey(
                              fontWeight: FontWeight.w600,
                              color: kTextColor,
                              fontSize: 12.sp,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 13,
                            backgroundColor: Color.fromARGB(255, 85, 145, 141),
                            child: Icon(
                              Icons.arrow_upward_outlined,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "Expense",
                            style: GoogleFonts.aubrey(
                              fontWeight: FontWeight.w600,
                              color: kTextColor,
                              fontSize: 12.sp,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\RM 1,808.67",
                        style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.bold,
                          color: kTextColor,
                          fontSize: 10.sp,
                          letterSpacing: 1.0,
                        ),
                      ),
                      Text(
                        "\RM 403.82",
                        style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.bold,
                          color: kTextColor,
                          fontSize: 10.sp,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
