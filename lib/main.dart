import 'dart:math';

import 'package:calculadora_fo/widgets/calButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const CalApp());
}

class CalApp extends StatefulWidget {
  const CalApp({super.key});

  @override
  State<CalApp> createState() => _CalAppState();
}

class _CalAppState extends State<CalApp> {
  String history = "";
  String operation = "";
  void allClear(String text) {
    setState(() {
      history = "";
      operation = "";
    });
  }

  void clear(String text) {
    setState(() {
      operation = "";
    });
  }

  void evaluate(String text) {
    Parser expretion = Parser();
    Expression exp = expretion
        .parse(operation); //se parsea el tipo de operacion a efectuar (+,-,/,*)
    ContextModel cm = ContextModel();

    setState(() {
      history = operation;
      operation = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  void clickNumero(String text) {
    setState(() {
      operation += text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculadora",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Calculadora"),
        ),
        backgroundColor: const Color(0xFF283637),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment: const Alignment(
                    1.0, 1.0), //alineamiento de izquierda - Derecha
                //color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(history,
                      style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                              fontSize: 24, color: Colors.white))),
                ),
              ),
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    operation,
                    style: GoogleFonts.rubik(
                        textStyle: const TextStyle(
                            fontSize: 48, color: Colors.yellow)),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    color: 0xFFE3303A,
                    callback: allClear,
                    text: "AC",
                    textSize: 20,
                  ),
                  CalcButton(
                    color: 0xFF00BF45,
                    callback: clear,
                    text: "C",
                    textSize: 20,
                  ),
                  CalcButton(
                    color: 0xFFD9ED15,
                    callback:
                        clickNumero, //el parametro sera lo que este dentro de ese callbutton.
                    text: "%",
                    textSize: 20,
                  ),
                  CalcButton(
                    callback: clickNumero,
                    text: "/",
                    textSize: 20,
                  ),

                  // -----------------------
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    callback: clickNumero,
                    text: "1",
                    textSize: 20,
                  ),
                  CalcButton(
                    callback: clickNumero,
                    text: "2",
                    textSize: 20,
                  ),
                  CalcButton(
                    callback: clickNumero,
                    text: "3",
                    textSize: 20,
                  ),
                  CalcButton(
                    callback: clickNumero,
                    text: "*",
                    textSize: 20,
                  ),

                  // -----------------------
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    callback: clickNumero,
                    text: "4",
                    textSize: 20,
                  ),
                  CalcButton(
                    callback: clickNumero,
                    text: "5",
                    textSize: 20,
                  ),
                  CalcButton(
                    callback: clickNumero,
                    text: "6",
                    textSize: 20,
                  ),
                  CalcButton(
                    callback: clickNumero,
                    text: "-",
                    textSize: 20,
                  ),

                  // -----------------------
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    callback: clickNumero,
                    text: "7",
                    textSize: 20,
                  ),
                  CalcButton(
                    callback: clickNumero,
                    text: "8",
                    textSize: 20,
                  ),
                  CalcButton(
                    callback: clickNumero,
                    text: "9",
                    textSize: 20,
                  ),
                  CalcButton(
                    callback: clickNumero,
                    text: "+",
                    textSize: 20,
                  ),

                  // -----------------------
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    callback: clickNumero,
                    text: ".",
                    textSize: 20,
                  ),
                  CalcButton(
                    callback: clickNumero,
                    text: "0",
                    textSize: 20,
                  ),
                  CalcButton(
                    callback: clickNumero,
                    text: "00",
                    textSize: 20,
                  ),
                  CalcButton(
                    callback: evaluate,
                    text: "=",
                    textSize: 20,
                  ),

                  // -----------------------
                ],
              ),
            ],
          ),
          //color: Colors.amber,
        ),
      ),
    );
  }
}
