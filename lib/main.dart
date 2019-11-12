import 'package:calculator/home_page.dart';
import 'package:flutter/material.dart';
import 'test.dart';
import "home_page.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData.dark(),
      home: new HomePage(),
    );
  }
}