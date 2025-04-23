import 'package:flutter/material.dart';

class ColorConst {
  const ColorConst._();

  static const Color primary = Color(0xFF235DFF);
  static const int _primaryRed = 35;
  static const int _primaryGreen = 93;
  static const int _primaryBlue = 255;

  static const Color backgroundWhite = Color(0xFFFFFFFF);
  static const Color btBlueShaded = Color(0xFF5E91F8);

  static const Color textBlue = Color(0xFF326BDF);
  static const Color textBlack = Color(0xFF4B5563);
  static const Color textAppBar = Color(0xFF1F2937);

  static const Color iconDarkGrey = Color(0xFF4B5563);
  static const Color iconLightGrey = Color(0xFF9CA3AF);

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