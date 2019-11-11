import 'package:flutter/material.dart';

class CalcTheme {
  static Color main() => Colors.grey[200];
  static Color second() => Colors.green;
  static Color third() => Colors.blue;
  static Color text() => Colors.black;
  static Color off() => Color(~CalcTheme.main().value);

  Map<String, Color> bColors = {"mode":third(), '&':second(), '|':second(), '^':second(), };
}

List<String> long = ["CLR", "0", "="];
List<String> secondC = ['&', '|', '^', '~', "++", '%', '÷', '*', '-','+', '='];
List<String> offC = ["CLR", "DEL"];