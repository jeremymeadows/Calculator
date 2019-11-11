import 'package:flutter/material.dart';
import 'theme.dart';

Size screen;

class HomePage extends StatefulWidget {
  @override 
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  String disp = '0', mode = "DEC";
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
            button("BIN", null),
            button("DEC", null),
            button("HEX", null),
            button("CLR", _clear),
          ],),
          Row(children: <Widget>[
            button("D", null),
            button("E", null),
            button("F", null),
            button("&", null),
            button("%", null),
          ],),
          Row(children: <Widget>[
            button("A", null),
            button("B", null),
            button("C", null),
            button("|", null),
            button("÷", null),
          ],),
          Row(children: <Widget>[
            button("7", null),
            button("8", null),
            button("9", null),
            button("^", null),
            button("*", null),
          ],),
          Row(children: <Widget>[
            button("4", null),
            button("5", null),
            button("6", null),
            button("~", null),
            button("-", null),
          ],),
          Row(children: <Widget>[
            button("1", null),
            button("2", null),
            button("3", null),
            button("++", null),
            button("+", null),
          ],),
          Row(children: <Widget>[
            //button("⚙", null),
            button("0", null),
            button("DEL", null),
            button("=", null),
          ],),
        ],)
      ),
    );
  }

  Widget button(String number, Function(String number) f) {
    return MaterialButton( 
      height: screen.height * .11,
      minWidth: long.contains(number) ? screen.width/5 * 2 : screen.width/5,
      color: secondC.contains(number) ? CalcTheme.second() : offC.contains(number) ? CalcTheme.off() : CalcTheme.main(),
      textColor: offC.contains(number) ? CalcTheme.main() : CalcTheme.text(),
      shape: BeveledRectangleBorder(side: BorderSide(width: .25)),
      child: Text(number,
        style: TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.normal, fontSize: 24),
      ),
      onPressed: (){},
    );
  }

  _clear(String number) {
    disp = '0';
  }
}