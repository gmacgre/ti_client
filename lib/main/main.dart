import 'package:flutter/material.dart';
import 'package:twilight_imperium/main/command_panel.dart';
import 'package:twilight_imperium/main/map_panel.dart';
import 'package:twilight_imperium/main/player_panel.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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