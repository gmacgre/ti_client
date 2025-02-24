import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twilight_imperium/main/command/command_panel.dart';
import 'package:twilight_imperium/main/map/map_panel.dart';
import 'package:twilight_imperium/main/player/player_panel.dart';
import 'package:twilight_imperium/state/state_game.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
  @override
  void initState() {
    Provider.of<GameState>(context, listen: false).populate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Row(
        children: [
          SizedBox(
            width: constraints.maxWidth * 0.3,
            height: constraints.maxHeight,
            child: const PlayerPanel(),
          ),
          SizedBox(
            width: constraints.maxWidth * 0.7,
            height: constraints.maxHeight,
            child: Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.8,
                  child: const MapPanel(),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.2,
                  child: const CommandPanel(),
                ),
              ]
            ),
          ),
        ],
      )
    );
  }
}