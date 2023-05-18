// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class Chart extends StatefulWidget {
//   const Chart({Key? key}) : super(key: key);

//   @override
//   State<Chart> createState() => _ChartState();
// }

// class _ChartState extends State<Chart> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 300,
//       width: double.infinity,
//       child: SfCartesianChart(
//         primaryXAxis: CategoryAxis(),
//         series: <SplineSeries<SalesData, String>>[
//           SplineSeries<SalesData, String>(
//             color: Color.fromARGB(255, 47, 125, 121),
//             width: 3,
//             dataSource: <SalesData>[
//               SalesData('Mon', 100),
//               SalesData('Tue', 20),
//               SalesData('Wed', 75),
//               SalesData('Thu', 15),
//               SalesData('Fri', 40),
//             ],
//             xValueMapper: (SalesData sales, _) => sales.day,
//             yValueMapper: (SalesData sales, _) => sales.sales,
//           )
//         ],
//       ),
//     );
//   }
// }

// class SalesData {
//   final String day;
//   final double sales;

//   SalesData(this.day, this.sales);
// }
