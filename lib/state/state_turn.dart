import 'package:flutter/material.dart';

enum TurnStage {
  start,
  // Tactical Action
  movement,
  spaceCombat,
  landCombat,
  production,
  // Strategic Action
  strategic
}

class TurnState extends ChangeNotifier {
  TurnStage _ts = TurnStage.start;
  TurnStage get currentStage => _ts;
  set currentStage (TurnStage value) {
    _ts = value;
    notifyListeners();
  }
}