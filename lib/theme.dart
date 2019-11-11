import 'package:flutter/material.dart';

Color main() => Colors.grey[200];
Color off() => Colors.grey;
Color second() => Colors.green;
Color third() => Colors.purple;
Color fourth() => Colors.yellow;
Color text() => Colors.black;
//Color off() => Color(~main().value);

Map<String, Color> bColors = {
  "BIN":main(), "DEC":fourth(), "HEX":main(), '&':second(), '|':second(), '^':second(), '~':second(), 
  '++':second(), '%':second(), '÷':second(), '*':second(), '-':second(), '+':second(), '=':second(),
  "CLR":third(), "DEL":third()
};

List<String> long = ["CLR", "0", "="];
List<String> offC = ["CLR", "DEL"];