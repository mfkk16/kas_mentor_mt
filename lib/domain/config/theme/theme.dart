import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTheme {
  AppTheme._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: false,
    primaryColor: ColorConst.primary,
    scaffoldBackgroundColor: ColorConst.backgroundWhite,
    primarySwatch: MaterialColor(ColorConst.primary.value, ColorConst.colorMap),
    textTheme: GoogleFonts.robotoTextTheme(),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: GoogleFonts.robotoTextTheme(),
  );
}
