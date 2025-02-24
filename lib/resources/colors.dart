// Holds Color constants to ensure synchronized colors throughout the app.

import 'package:flutter/material.dart';

class TIColors {
  // Base of Tiles on the map
  static Color tileBase = const Color(0xFF002439);

  // Default backing color for the player and command panels
  static Color panelBase = const Color(0xFFE4EFF0);

  // Default backing color for the player and command panel title sections
  static Color panelTitleBase = const Color(0xFF78CCE2);

  // Default backing color for the player and command panel title sections
  static Color panelDivider = const Color(0xFF4E7988);

  // Other from the palatte
  static Color bodyText = const Color(0xFF005066);

  // Ship/Planet Colors of each player
  static final List<Color> _playerColors = [
    Colors.red,
    Colors.blue,
  ];

  // Color for Strategy Card 
  static Color strategyCardBorder = Colors.black;

  // Color for each strategy card
  static final List<Color> _strategyCardColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.greenAccent,
    Colors.lightBlue,
    Colors.blue,
    Colors.purple
  ];

  // Generic Color of Errors - make distinct from all others
  static const Color _errorColor = Color.fromARGB(255, 238, 50, 255);

  // Default method for getting a color
  static Color _getColor(int idx, List<Color> lib) {
    if (idx < 0 || idx >= lib.length) {
      return _errorColor;
    }
    return lib[idx];
  }

  static Color getPlayerColor(int seat) => _getColor(seat, _playerColors);

  static Color getStrategyCardColor(int card) => _getColor(card, _strategyCardColors);
}