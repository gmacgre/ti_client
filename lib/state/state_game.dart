import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'package:twilight_imperium/shared/model/game.dart';
import 'package:twilight_imperium/shared/model/player.dart';
import 'package:twilight_imperium/state/state_turn.dart';

class GameState extends ChangeNotifier {
  final Game game = Game();
  void populate() {
    game.players.add(
      Player()..race='sol'
              ..seatNumber=0
              ..strategyCard=0
              ..username="Bob"
    );
    game.players.add(
      Player()..race='sol'
              ..seatNumber=1
              ..strategyCard=1
              ..username="Ethan"
    );
    game.players.add(
      Player()..race='sol'
              ..seatNumber=2
              ..strategyCard=2
              ..username="Player 3"
    );
    notifyListeners();
  }

  TurnStage? tapTile(Coordinates coords) {
    return null;
  }
}