import 'package:flutter/material.dart';
import 'package:calculator_app/widgets/CalcButton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalcApp());
}

// Making the CalcApp a Stateful Widget so that it can show
// the data that it has calculated
class CalcApp extends StatefulWidget {
  const CalcApp({Key? key}) : super(key: key);

  @override
  _CalcAppState createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
  String _history = ""; // This will store the previous expression
  String _expression = ""; // This will store the expression being evaluated

  void numClick (String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear (String text) {
    setState(() {
      _history = "";
      _expression = "";
    });
  }

  void clear (String text) {
    setState(() {
      _expression = "";
    });
  }

  void evaluate (String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    String temp = eval.toString();

    // Gets last 2 characters from eval and if it is ".0" then removes it
    var newString = temp.substring((temp.length - 2).clamp(0, temp.length));
    if(newString == ".0"){
      temp = temp.substring(0, temp.length - 2);
    }

    setState(() {
      _history = _expression;
      _expression = temp;
    });
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: Color(0xFF283637),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 12.0),
              child: Text(
                _history,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF545F61),
                  ),
                ),
              ),
              alignment: Alignment(1 ,1),
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              child: Text(
                _expression,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                  ),
                ),
              ),
              alignment: Alignment(1 ,1),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: "AC",
                  fillColor: 0xFF6C807F,
                  textSize: 22.0,
                  callback: allClear,
                ),
                CalcButton(
                  text: "(",
                  fillColor: 0xFF283637,
                  callback: numClick,
                ),
                CalcButton(
                  text: ")",
                  fillColor: 0xFF283637,
                  callback: numClick,
                ),
                CalcButton(
                  text: "/",
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: "7",
                  fillColor: 0xFF283637,
                  callback: numClick,
                ),
                CalcButton(
                  text: "8",
                  fillColor: 0xFF283637,
                  callback: numClick,
                ),
                CalcButton(
                  text: "9",
                  fillColor: 0xFF283637,
                  callback: numClick,
                ),
                CalcButton(
                  text: "*",
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: "4",
                  fillColor: 0xFF283637,
                  callback: numClick,
                ),
                CalcButton(
                  text: "5",
                  fillColor: 0xFF283637,
                  callback: numClick,
                ),
                CalcButton(
                  text: "6",
                  fillColor: 0xFF283637,
                  callback: numClick,
                ),
                CalcButton(
                  text: "-",
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: "1",
                  fillColor: 0xFF283637,
                  callback: numClick,
                ),
                CalcButton(
                  text: "2",
                  fillColor: 0xFF283637,
                  callback: numClick,
                ),
                CalcButton(
                  text: "3",
                  fillColor: 0xFF283637,
                  callback: numClick,
                ),
                CalcButton(
                  text: "+",
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: ".",
                  fillColor: 0xFF283637,
                  callback: numClick,
                ),
                CalcButton(
                  text: "0",
                  fillColor: 0xFF283637,
                  callback: numClick,
                ),
                CalcButton(
                  text: "00",
                  fillColor: 0xFF283637,
                  textSize: 26.0,
                  callback: numClick,
                ),
                CalcButton(
                  text: "=",
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  callback: evaluate,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
