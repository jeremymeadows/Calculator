import 'package:flutter/material.dart';
import 'theme.dart';

Size screen;

class HomePage extends StatefulWidget {
  @override 
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  String disp = '0', mode = "DEC";
  int res = 0, radix = 10;
  @override 
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Calculator"),
      // ),
      body: Container(
        child: Column(children: <Widget>[
          Row(children: <Widget>[
            // Container(height: screen.height*.23, child: 
            // Column(children: <Widget>[
            //   Container(
            //     alignment: Alignment.topLeft,
            //     child: Text("BIN:", style: TextStyle(fontFamily: "Roboto Mono"),),
            //   ),
            //   Container(
            //     alignment: Alignment.topLeft,
            //     child: Text("DEC:"),
            //   ),
            //   Container(
            //     alignment: Alignment.topLeft,
            //     child: Text("HEX:"),
            //   ),
            // ],),
            // ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                height: screen.height*.23,
                child: Text('$disp', 
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          ],),
          Row(children: <Widget>[
            button("BIN", _mode),
            button("DEC", _mode),
            button("HEX", _mode),
            button("CLR", _clear),
          ],),
          Row(children: <Widget>[
            button("D", _number),
            button("E", _number),
            button("F", _number),
            button("&", null),
            button("%", null),
          ],),
          Row(children: <Widget>[
            button("A", _number),
            button("B", _number),
            button("C", _number),
            button("|", null),
            button("÷", null),
          ],),
          Row(children: <Widget>[
            button("7", _number),
            button("8", _number),
            button("9", _number),
            button("^", null),
            button("*", null),
          ],),
          Row(children: <Widget>[
            button("4", _number),
            button("5", _number),
            button("6", _number),
            button("~", _unary),
            button("-", null),
          ],),
          Row(children: <Widget>[
            button("1", _number),
            button("2", _number),
            button("3", _number),
            button("++", _unary),
            button("+", null),
          ],),
          Row(children: <Widget>[
            //button("⚙", null),
            button("0", _number),
            button("DEL", _delete),
            button("=", null),
          ],),
        ],)
      ),
    );
  }

  Widget button(String number, Function(String number) f) {
    RegExp expD = new RegExp("^[A-F]\$"), expB = new RegExp("^[2-9A-F]\$");
    return MaterialButton( 
      height: screen.height * .11,
      minWidth: long.contains(number) ? screen.width/5 * 2 : screen.width/5,
      color: bColors.containsKey(number) ? bColors[number] : main(),
      textColor: offC.contains(number) ? main() : text(),
      disabledColor: Colors.grey[800],
      disabledTextColor: Colors.grey[700],
      shape: BeveledRectangleBorder(side: BorderSide(width: .25)),
      child: Text(number,
        style: TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.normal, fontSize: 24),
      ),
      onPressed: mode == "DEC" && expD.hasMatch(number) ? null : mode == "BIN" && expB.hasMatch(number) ? null : () => f(number),
    );
  }

  _clear(String s) {
    setState(() {
      disp = '0'; 
    });
    res = 0;
  }
  _delete(String s) {
    if (disp.length > 1)
      setState(() {
        disp = disp.substring(0, disp.length-1);
      });
    else 
      setState(() {
        disp = '0'; 
      });
  }
  _mode(String s) {
    setState(() {
      bColors[mode] = main();
      bColors[s] = third();
    });
    mode = s;
  }
  _number(String s) {
    if (disp == '0')
      setState(() {
        disp = s; 
      });
    else 
      setState(() {
        disp += s; 
      });
  }
  _unary(String s) {
    if (s == '~')
      setState(() {
        disp = (~int.parse(disp)).toString(); 
      });
    else 
      setState(() {
        disp = (int.parse(disp)+1).toString(); 
      });
  }
  _oper(String s) {

  }
}