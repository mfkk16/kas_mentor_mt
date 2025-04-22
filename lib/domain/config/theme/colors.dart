import 'package:flutter/material.dart';

class ColorConst {
  const ColorConst._();

  static const Color primary = Color.fromRGBO(110, 65, 255, 1);
  static const int _primaryRed = 110;
  static const int _primaryGreen = 65;
  static const int _primaryBlue = 255;

  static const Color gradientLeft = Color(0xFF6e41ff);
  static const Color gradientRight = Color(0xFF0abdff);

  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color red = Colors.red;
  static const Color green = Color(0xFF4caf50);
  static const Color blueLight = Color(0xFFf3f7ff);

  static const Color backgroundWhite = white;
  static const Color backgroundLight = Color(0xFFf1f3f5);

  static const Color textPrimary = Color(0xFF475a63);
  static const Color textPrimaryMedium = Color(0xFF5A6B79);
  static const Color textPrimaryLight = Color(0xFF83929A);

  static const Color textEmail = Color(0xFF83929a);
  static const Color textWelcome = Color(0xFF37597a);
  static const Color textCardHeading = Color(0xFF247dfd);
  static const Color textCardSubtitle = Color(0xFF666666);
  static const Color textBlack2 = Color(0xFF9e9e9e);

  static const Color iconPrimary = Color(0xFF2E4553);
  static const Color iconBorderSquare = Color(0xFF2E4553);
  static const Color textFielsBgColor = Color(0xFFf1f3f5);

  static const Map<int, Color> colorMap = {
    50: Color.fromRGBO(_primaryRed, _primaryGreen, _primaryBlue, .1),
    100: Color.fromRGBO(_primaryRed, _primaryGreen, _primaryBlue, .2),
    200: Color.fromRGBO(_primaryRed, _primaryGreen, _primaryBlue, .3),
    300: Color.fromRGBO(_primaryRed, _primaryGreen, _primaryBlue, .4),
    400: Color.fromRGBO(_primaryRed, _primaryGreen, _primaryBlue, .5),
    500: Color.fromRGBO(_primaryRed, _primaryGreen, _primaryBlue, .6),
    600: Color.fromRGBO(_primaryRed, _primaryGreen, _primaryBlue, .7),
    700: Color.fromRGBO(_primaryRed, _primaryGreen, _primaryBlue, .8),
    800: Color.fromRGBO(_primaryRed, _primaryGreen, _primaryBlue, .9),
    900: Color.fromRGBO(_primaryRed, _primaryGreen, _primaryBlue, 1),
  };
}
