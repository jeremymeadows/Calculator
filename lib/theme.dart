import 'package:calculator/home_page.dart';
import 'package:flutter/material.dart';

Color myColor = Colors.green;

// void changeColor(Color color) => myColor = color;

Color main() => Colors.grey[200];
Color off() => Colors.grey;
Color second() => myColor;
Color third() => Colors.purple;
Color fourth() => Colors.yellow;
Color text() => Colors.black;
//Color off() => Color(~main().value);

Map<String, Color> bColors = {
  "BIN":main(), "DEC":fourth(), "HEX":main(), '&':second(), '|':second(), '^':second(), '~':second(), 
  '++':second(), '%':second(), '÷':second(), '*':second(), '-':second(), '+':second(), '=':second(),
  "CLR":third(), "CLR HIST":third(), "DEL":third()
};

List<String> long = ["CLR", "CLR HIST", "0", "="];
List<String> offC = ["CLR", "CLR HIST", "DEL"];