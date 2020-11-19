//********** THIS FILE CONTAIN TEXT Style*/
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtualtribe/src/MainApp/styles/AppFontSizes.dart';

class AppTextStyle{

  static TextStyle header1(BuildContext context, Color color) {
    return GoogleFonts.roboto(
      fontSize: AppFontSizes.largest,
     textStyle: 
    TextStyle(
        color: color));
  }

  static TextStyle normalStyle(Color color, double size,) {
   return GoogleFonts.roboto(
      fontSize: size,
     textStyle: 
    TextStyle(
        color: color));
  }

   static TextStyle rampatStyle(Color color, double size) {
   return GoogleFonts.roboto(
      fontSize: size,
     textStyle: 
    TextStyle(
        color: color));
  }
  static TextStyle rampatBoldStyle(Color color, double size) {
   return GoogleFonts.roboto(
      fontSize: size,
      fontWeight: FontWeight.bold,
     textStyle: 
    TextStyle(
        color: color));
  }




}