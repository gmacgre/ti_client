import 'package:flutter/material.dart';
import 'package:twilight_imperium/resources/colors.dart';
import 'package:twilight_imperium/resources/icons.dart';
import 'package:twilight_imperium/resources/outlined_letters.dart';
import 'package:twilight_imperium/resources/strategy_card.dart';
import 'package:twilight_imperium/shared/model/player.dart';

class PlayerGlanceRow extends StatelessWidget {
  const PlayerGlanceRow({
    super.key,
    required this.player
  });

  final Player player;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        width: constraints.maxWidth,
        decoration: BoxDecoration(color: TIColors.getPlayerColor(player.seatNumber), border: Border.all(color: TIColors.panelDivider, width: 4.0)),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // Faction Icon
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(height: 70, width: 70, child: Image.asset(IconLib.getIcon(player.race))),
            ),
            // Player Username
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedLetters(content: player.username),
              ),
            ),
            // Strategy Card Currently in use
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: StrategyCardVisualization(width: 50, height: 70, card: player.strategyCard),
              ),
            ),
            // Points Scored
      
            // Tactic Tokens
      
            // Fleet Tokens
      
            // Strategy Tokens
          ],
        ),
      ),
    );
  }
}