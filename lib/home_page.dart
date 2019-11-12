import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_colorpicker/material_picker.dart';
import 'package:flutter_colorpicker/block_picker.dart';
import 'theme.dart';

Size screen;

class HomePage extends StatefulWidget {
  @override 
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  String disp = '0', mode = "DEC", history = '';
  int radix = 10;
  bool op = false;
  Color pickerCol;
  RegExp expD = RegExp("^[A-F]\$"), expB = RegExp("^[2-9A-F]\$"), ops = RegExp("[&|^~%÷*+-]");
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
            Container(
              child: PopupMenuButton(
                //icon: Icon(Icons.menu),
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    child: FlatButton(
                      child: Text("Clear History"),
                      onPressed: ()=>_clear("HIST"),
                    ),
                  ),
                  // PopupMenuItem(
                  //   child: FlatButton(
                  //     child: Text("Theme"),
                  //     onPressed: ()=>showDialog(
                  //       context: context,
                  //       builder: (BuildContext context) {
                  //         return SimpleDialog(title: Text("Choose Theme"), children: <Widget>[
                  //           Center(child: RaisedButton(
                  //             onPressed: (){showDialog(
                  //               context: context,
                  //               builder: (BuildContext context) {
                  //                 return AlertDialog(
                  //                   content: BlockPicker(
                  //                     pickerColor: myColor,
                  //                     onColorChanged: changeColor,
                  //                   ),
                  //                 );
                  //               }
                  //             );},
                  //             color: myColor,
                  //             child: Text("Change me"),
                  //           ),),
                  //           Center(child: RaisedButton(
                  //             onPressed: (){},
                  //           ),),
                  //           Center(child: RaisedButton(
                  //             onPressed: (){},
                  //           ),),
                  //         ],);
                  //       },
                  //     ),
                  //   )
                  // )
                ],
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                height: screen.height*.15,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  reverse: true,
                  child: Text(history,
                    textAlign: TextAlign.right, 
                    style: TextStyle(fontSize: 25, color: Colors.grey),
                  ),
                )
              ),
            ),
          ],),
          Row(children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                height: screen.height*.08,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  child: Text('$disp',
                    style: TextStyle(fontSize: 50),
                  ),
                )
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
            button("&", _oper),
            button("%", _oper),
          ],),
          Row(children: <Widget>[
            button("A", _number),
            button("B", _number),
            button("C", _number),
            button("|", _oper),
            button("÷", _oper),
          ],),
          Row(children: <Widget>[
            button("7", _number),
            button("8", _number),
            button("9", _number),
            button("^", _oper),
            button("*", _oper),
          ],),
          Row(children: <Widget>[
            button("4", _number),
            button("5", _number),
            button("6", _number),
            button("~", _unary),
            button("-", _oper),
          ],),
          Row(children: <Widget>[
            button("1", _number),
            button("2", _number),
            button("3", _number),
            button("++", _unary),
            button("+", _oper),
          ],),
          Row(children: <Widget>[
            button("0", _number),
            button("DEL", _delete),
            button("=", _equal),
          ],),
        ],)
      ),
    );
  }

  Widget button(String str, Function(String number) f) {
    return MaterialButton( 
      height: screen.height * .11,
      minWidth: long.contains(str) ? screen.width/5 * 2 : screen.width/5,
      color: bColors.containsKey(str) ? bColors[str] : main(),
      textColor: offC.contains(str) ? main() : text(),
      disabledColor: Colors.grey[800],
      disabledTextColor: Colors.grey[700],
      shape: BeveledRectangleBorder(side: BorderSide(width: .25)),
      child: Text(str,
        style: TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.normal, fontSize: 24),
      ),
      onPressed: mode == "DEC" && expD.hasMatch(str) ? null : mode == "BIN" && expB.hasMatch(str) ? null : () => f(str),
    );
  }

  void changeColor(Color color) => setState(() => myColor = color);

  _clear(String s) {
    setState(() {
      disp = '0'; 
    });
    op = false;
    if (s == "HIST")
      setState(() {
        history = ''; 
      });
  }
  _delete(String s) {
    setState(() {
      disp = disp.length > 1 ? disp.substring(0, disp.length-1) : '0';
    });
    op = !ops.hasMatch(disp[disp.length-1]);
  }
  _mode(String s) {
    var tmp = BigInt.parse(disp.toLowerCase(), radix: radix);
    switch(s) {
      case "BIN": radix = 2; break;
      case "DEC": radix = 10; break;
      case "HEX": radix = 16; break;
    }
    setState(() {
      disp = tmp.toRadixString(radix).toUpperCase();
      bColors[mode] = main();
      bColors[s] = fourth();
    });
    mode = s;
  }
  _number(String s) {
    op = false;
    if (disp == '0')
      setState(() {
        disp = s; 
      });
    else {
      setState(() {
        disp += s;
      });
    }
  }
  _unary(String s) {
    if (s == '~') {
      String tmp = '';
      disp = BigInt.parse(disp, radix: radix).toRadixString(2);
      for (int i = 0; i < disp.length; ++i) {
        tmp += (disp[i] == '1') ? '0' : '1';
      }
      setState(() {
        disp = tmp; 
      });
    }
    else if (s == "++") 
      setState(() {
        disp = (BigInt.parse(disp.toLowerCase(), radix: radix)+BigInt.one).toRadixString(radix).toUpperCase(); 
      });
  }
  _oper(String s) {
    if (disp == '0') {
      disp += '0';
    }
    if (op)
      disp = disp.substring(0, disp.length-1);
    setState(() {
      disp += s; 
    });
    op = true;
  }
  _equal(String s) {
    String eq = disp;
    RegExp exp = RegExp("[0-9A-F]*");
    Queue<BigInt> operand = Queue<BigInt>();
    Queue<String> operate = Queue<String>();
    Map<String, int> pre = {'*':1, '÷':1, '%':1, '+':2, '-':2};

    bool m = true;
    while (disp.length > 0) {
      if (m && exp.hasMatch(disp)) {
        m = !m;
        operand.addLast(BigInt.parse(exp.stringMatch(disp), radix: radix));
        disp = disp.replaceFirst(exp, '');
      }
      else if (!m && ops.hasMatch(disp)) {
        m = !m;
        String thisop = ops.stringMatch(disp);
        while (operate.isNotEmpty && pre[operate.last] < pre[thisop]) {
          BigInt y = operand.removeLast(), x = operand.removeLast();
          operand.addLast(eval(x,y,operate.removeLast()));
        }
        operate.addLast(thisop);
        disp = disp.replaceFirst(ops, '');
      }
    }
    while (operate.isNotEmpty) {
      var o = operate.removeLast();
      BigInt y = operand.removeLast(), x = operand.removeLast();
      operand.addLast(eval(x, y, o));
    }
    setState(() {
      disp = operand.removeLast().toRadixString(radix).toUpperCase();
      history += '\n$eq = $disp';
    });
  }
}

BigInt eval(BigInt x, BigInt y, String op) {
  switch (op) {
    case '%': return x%y;
    case '÷': return x~/y;
    case '*': return x*y;
    case '-': return x-y; 
    case '+': return x+y;
  }
  throw new FormatException();
}