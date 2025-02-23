import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'package:twilight_imperium/shared/model/game.dart';
import 'package:twilight_imperium/shared/model/player.dart';
import 'package:twilight_imperium/state/state_turn.dart';

class GameState extends ChangeNotifier {
  final Game game = Game()..players = [Player(), Player(), Player()];
  void populate() {
    
  }

  TurnStage? tapTile(Coordinates coords) {
    return null;
  }
}