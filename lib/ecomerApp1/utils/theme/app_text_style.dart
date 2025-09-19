import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  //large TextStyle
  static TextStyle h1 = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
  );
  static TextStyle h2 = GoogleFonts.poppins(
    fontSize: 26,
    fontWeight: FontWeight.w700,
  );
  static TextStyle h3 = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
  //body TextStyle
  static TextStyle b1 = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static TextStyle b2 = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static TextStyle b3 = GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );
  static TextStyle b4 = GoogleFonts.poppins(
    fontSize: 11,
    fontWeight: FontWeight.w200,
  ); //helper funcaton
  static TextStyle apply({
    required final TextStyle textstyle,
    final Color? color,
    final FontWeight? fwight,
    final double? letterspacing,
  }) {
    return textstyle.copyWith(
      color: color,
      fontWeight: fwight,
      letterSpacing: letterspacing,
    );
  }
}
