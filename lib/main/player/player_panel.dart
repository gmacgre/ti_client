import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twilight_imperium/main/player/player_tab.dart';
import 'package:twilight_imperium/main/player/world_tab.dart';
import 'package:twilight_imperium/resources/colors.dart';
import 'package:twilight_imperium/resources/icons.dart';
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
    List<Widget> tabBarView = [];
    tabBarView.addAll(gs.game.players.map((e) => PlayerTab(player: e)).toList());
    tabBarView.add(WorldInfoTab(state: gs));
    List<Tab> tabBar = gs.game.players.map((e) => Tab(icon: Image.asset(IconLib.getIcon(e.race)))).toList();
    tabBar.add(Tab(icon: Image.asset(IconLib.getIcon('jol_nar'))));

    return DefaultTabController(
      initialIndex: gs.game.players.length,
      length: gs.game.players.length + 1,
      child: Scaffold(
        appBar: AppBar(
          shape: Border(right: BorderSide(color: TIColors.panelDivider, width: dividerWidth),),
          backgroundColor: TIColors.panelTitleBase,
          title: DecoratedBox(
            decoration: BoxDecoration(color: TIColors.panelTitleBase),
            child: TabBar(
              tabs: tabBar
            ),
          ),
        ),
        body: DecoratedBox(
          decoration: BoxDecoration(
            color: TIColors.panelBase,
            border: Border(right: BorderSide(color: TIColors.panelDivider, width: dividerWidth))
          ),
          child: TabBarView(
            children: tabBarView
          ),
        ),
      )
    );
  }
}