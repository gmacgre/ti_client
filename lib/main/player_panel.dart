import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twilight_imperium/resources/colors.dart';
import 'package:twilight_imperium/state/state_game.dart';

class PlayerPanel extends StatefulWidget {
  const PlayerPanel({super.key});

  @override
  State<PlayerPanel> createState() => _PlayerPanelState();
}

class _PlayerPanelState extends State<PlayerPanel> {
  final double dividerWidth = 4.0;

  @override
  Widget build(BuildContext context) {
    GameState gs = context.watch<GameState>();
    return DefaultTabController(
      length: gs.game.players.length,
      child: Scaffold(
        appBar: AppBar(
          shape: Border(right: BorderSide(color: TIColors.panelDivider, width: dividerWidth),),
          backgroundColor: TIColors.panelTitleBase,
          title: DecoratedBox(
            decoration: BoxDecoration(color: TIColors.panelTitleBase),
            child: TabBar(
              tabs: gs.game.players.map((e) => const Tab(icon: Icon(Icons.abc))).toList()
            ),
          ),
        ),
        body: DecoratedBox(
          decoration: BoxDecoration(
            color: TIColors.panelBase,
            border: Border(right: BorderSide(color: TIColors.panelDivider, width: dividerWidth))
          ),
          child: TabBarView(
            children: gs.game.players.map((e) => const Icon(Icons.abc)).toList()
          ),
        ),
      )
    );
  }
}