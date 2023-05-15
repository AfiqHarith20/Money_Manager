import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class HomePageHost extends StatefulWidget {
  const HomePageHost({Key? key}) : super(key: key);

  @override
  State<HomePageHost> createState() => _HomePageHostState();
}

class _HomePageHostState extends State<HomePageHost> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
