import 'package:flutter/material.dart';

Color main() => Colors.grey[200];
Color second() => Colors.green;
Color third() => Colors.yellow;
Color text() => Colors.black;
Color off() => Color(~main().value);

Map<String, Color> bColors = {
  "BIN":main(), "DEC":third(), "HEX":main(), '&':second(), '|':second(), '^':second(), '~':second(), 
  '++':second(), '%':second(), '÷':second(), '*':second(), '-':second(), '+':second(), '=':second(),
  "CLR":text(), "DEL":text()
};

List<String> long = ["CLR", "0", "="];
List<String> secondC = ['&', '|', '^', '~', "++", '%', '÷', '*', '-','+', '='];
List<String> offC = ["CLR", "DEL"];
List<String> dec = ['A','B','C'];