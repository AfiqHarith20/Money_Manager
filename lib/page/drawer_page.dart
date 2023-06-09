import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/constants.dart';
import 'package:money_manager/page/currencylist_page.dart';
import 'package:money_manager/page/homepage.dart';
import 'package:money_manager/page/profile_page.dart';
import 'package:money_manager/page/statistics_page.dart';
import 'package:sizer/sizer.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Welcome Afiq Harith',
              style: GoogleFonts.aBeeZee(
                fontSize: 14.sp,
                color: kTextColor,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.0,
              ),
            ),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              // image: DecorationImage(
              //   fit: BoxFit.fill,
              //   image: AssetImage(''),
              // ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_rounded),
            title: Text('Home'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.av_timer_rounded),
            title: Text('Planned Payment'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.auto_graph_rounded),
            title: Text('Statistics'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StatisticsPage(),
                ),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.currency_exchange_rounded),
            title: Text('Currency Rates'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CurrencyList(),
                ),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
