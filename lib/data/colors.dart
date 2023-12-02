import 'package:flutter/material.dart';

/// Classe responsável por armazenar as cores escolhidas no gerador de paletas de cores (coolors).
class ColorsProject {
  /// Background color - White - (White | HexColor: FBFCFF).
  static const white = Color(0xFFFBFCFF);

  /// Variant of Primary Swatch - Cyan - (Dark Cyan | HexColor: 119DA4).
  static const darkCyan = Color(0xFF119DA4);

  /// Primary Swatch - Cerulean - (Cerulean | HexColor: 0C7489).
  static const cerulean = Color(0xFF0C7489);

  /// Accent Color - Amber - (Xanthous | HexColor: FFBC42).
  static const xanthous = Color(0xFFFFBC42);

  /// Variant of Accent Color - Red - (Crimson | HexColor: D7263D).
  static const crimson = Color(0xFFD7263D);

  final primarySwatchPallet = MaterialColor(cerulean.value, const <int, Color>{
    50: Color(0xFFE2EEF1),
    100: Color(0xFFB6D5DC),
    200: Color(0xFF86BAC4),
    300: Color(0xFF559EAC),
    400: Color(0xFF30899B),
    500: Color(0xFF0C7489),
    600: Color(0xFF0A6C81),
    700: Color(0xFF086176),
    800: Color(0xFF06576C),
    900: Color(0xFF034459),
  });
}
