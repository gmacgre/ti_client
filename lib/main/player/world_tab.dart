import 'package:flutter/material.dart';
import 'package:twilight_imperium/main/player/player_glance.dart';
import 'package:twilight_imperium/state/state_game.dart';

class WorldInfoTab extends StatelessWidget {
  const WorldInfoTab({
    super.key,
    required this.state
  });

  final GameState state;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Center(
        child: SizedBox(
          width: constraints.maxWidth * 0.95,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: state.game.players.map((e) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: PlayerGlanceRow(player: e),
              )
            ).toList(),
          ),
        ),
      ),
    );
  }
}