import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  final Function callback;
  final String text;
  final double textSize;
  final int color;
  const CalcButton(
      {super.key,
      required this.callback,
      required this.text,
      this.textSize = 28,
      this.color = 0xFF283637}); //agrego la fx callback en el constructor.

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10), //margenes para todos los lados
      child: SizedBox(
        //es una caja que se puede redimensionar
        width: 65,
        height: 65,
        child: TextButton(
          onPressed: () => {
            callback(text),
          },
          style: TextButton.styleFrom(
              backgroundColor: Color(
                  color), //se coloca el color que se le pasa como parametro al instanciar.
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(16.0),
              textStyle: const TextStyle(fontSize: 20)),
          child: Text(text,
              style:
                  GoogleFonts.rubik(textStyle: TextStyle(fontSize: textSize))),
        ),
      ),
    );
  }
}
