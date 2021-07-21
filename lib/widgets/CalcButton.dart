import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final int textColor;
  final int fillColor;
  final double textSize;

  const CalcButton({
    Key? key,
    required this.text,
    this.textColor = 0xFFFFFFFF,
    required this.fillColor,
    this.textSize = 28.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: SizedBox(
        width: 65.0,
        height: 65.0,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0)
          ),
          child: Text(
            text,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: textSize,
              ),
            ),
          ),
          onPressed: () {},
          color: fillColor != null ? Color(fillColor) : null,
          textColor: Color(textColor),
        ),
      ),
    );
  }
}
