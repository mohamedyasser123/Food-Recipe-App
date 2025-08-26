import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
class AppTextStyle{
  static final TextStyle titleBold = GoogleFonts.poppins(
    fontSize: 36,
    height: 72 / 36, // lineHeight ÷ fontSize
    fontWeight: FontWeight.bold,
  );

  static final TextStyle titleRegular = GoogleFonts.poppins(
    fontSize: 36,
    height: 72 / 36,
    fontWeight: FontWeight.normal,
  );

  // 🔹 Header
  static final TextStyle headerBold = GoogleFonts.poppins(
    fontSize: 30,
    height: 45 / 30,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle headerRegular = GoogleFonts.poppins(
    fontSize: 30,
    height: 45 / 30,
    fontWeight: FontWeight.normal,
  );

  // 🔹 Large
  static final TextStyle largeBold = GoogleFonts.poppins(
    fontSize: 20,
    height: 30 / 20,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle largeRegular = GoogleFonts.poppins(
    fontSize: 20,
    height: 30 / 20,
    fontWeight: FontWeight.normal,
  );

  // 🔹 Medium
  static final TextStyle mediumBold = GoogleFonts.poppins(
    fontSize: 18,
    height: 27 / 18,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle mediumRegular = GoogleFonts.poppins(
    fontSize: 18,
    height: 27 / 18,
    fontWeight: FontWeight.normal,
  );

  // 🔹 Normal
  static final TextStyle normalBold = GoogleFonts.poppins(
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle normalRegular = GoogleFonts.poppins(
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.normal,
  );

  // 🔹 Small
  static final TextStyle smallBold = GoogleFonts.poppins(
    fontSize: 14,
    height: 21 / 14,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle smallRegular = GoogleFonts.poppins(
    fontSize: 14,
    height: 21 / 14,
    fontWeight: FontWeight.normal,
  );

  // 🔹 Smaller
  static final TextStyle smallerBold = GoogleFonts.poppins(
    fontSize: 11,
    height: 17 / 11,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle smallerRegular = GoogleFonts.poppins(
    fontSize: 11,
    height: 17 / 11,
    fontWeight: FontWeight.normal,
  );
}