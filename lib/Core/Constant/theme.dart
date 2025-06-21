import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData English_theme = ThemeData(
  iconTheme: IconThemeData(color: Appcolor.white),
  appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Appcolor.primary_color,
      titleTextStyle: TextStyle(
          color: Appcolor.white, fontWeight: FontWeight.w800, fontSize: 30)),
  scaffoldBackgroundColor: Appcolor.background,
  textTheme: TextTheme(
    //////////////text theme for headline
    headlineLarge: GoogleFonts.montserrat(
        fontSize: 28, fontWeight: FontWeight.w800, color: Appcolor.black),
    ////////////////// text theme for headline
    headlineMedium: GoogleFonts.montserrat(
        fontSize: 25, fontWeight: FontWeight.w800, color: Appcolor.gray),
    //////////////text theme for body
    bodyMedium: GoogleFonts.actor(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 1.5,
        color: Appcolor.gray),
  ),
);
ThemeData Arabic_theme = ThemeData(
  iconTheme: IconThemeData(color: Appcolor.white),
  appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Appcolor.primary_color,
      titleTextStyle: TextStyle(
          color: Appcolor.white, fontWeight: FontWeight.w800, fontSize: 30)),
  scaffoldBackgroundColor: Appcolor.background,
  textTheme: TextTheme(
    //////////////text theme for headline
    headlineLarge: GoogleFonts.montserrat(
        fontSize: 28, fontWeight: FontWeight.w800, color: Appcolor.black),
    ////////////////// text theme for headline
    headlineMedium: GoogleFonts.montserrat(
        fontSize: 25, fontWeight: FontWeight.w800, color: Appcolor.gray),
    //////////////text theme for body
    bodyMedium: GoogleFonts.actor(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 1.5,
        color: Appcolor.gray),
  ),
);
