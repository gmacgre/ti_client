import 'package:flutter/material.dart';
import 'package:twilight_imperium/main/player/player_glance.dart';
import 'package:twilight_imperium/shared/model/player.dart';

class PlayerTab extends StatelessWidget {
  const PlayerTab({
    super.key,
    required this.player
  });

  final Player player;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Center(
        child: SizedBox(
          width: constraints.maxWidth * 0.95,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PlayerGlanceRow(player: player),
              )
            ],
          ),
        ),
      ),
    );
  }
}