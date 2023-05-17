import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

const Color kScaffoldColor = Color(0xFF1C2833);
const Color kPrimaryColor = Color(0xFF17202A);
const Color kSecondaryColor = Color(0xFF32B3DF);
const Color kTextColor = Color(0xFFFFFFFF);
const Color kTextColorShade = Color.fromARGB(199, 187, 184, 184);

final kMargin = EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h);
final kPadding = EdgeInsets.all(2.h);
final kRadius = BorderRadius.circular(2.h);

Color setupColor(double percentage) {
  if (percentage >= 0.50) {
    return Colors.blueAccent;
  } else if (percentage >= 0.25) {
    return Colors.orange;
  }
  return Colors.red;
}
