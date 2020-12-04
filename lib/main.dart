import 'package:f290_ddm2_mitridates_app/constants/contants.dart';
import 'package:f290_ddm2_mitridates_app/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mitrídates',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
