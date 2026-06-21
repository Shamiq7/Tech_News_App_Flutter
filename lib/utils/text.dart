import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class modtext extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const modtext({super.key, required this.color, required this.size, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,style: GoogleFonts.lato(color: color,fontSize: size),
    );
  }
}



class modtext2 extends StatelessWidget {
  final String text;
  final double size;
  final Color color;

  const modtext2({super.key, required this.color, required this.size, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,style: GoogleFonts.lato(color: color,fontSize: size,fontWeight: FontWeight.bold),
    );
  }
}
