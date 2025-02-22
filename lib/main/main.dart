import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twilight_imperium/state/state_game.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GameState()..populate(),
      child: Consumer<GameState>(
        builder: (context, gamestate, child) => const Placeholder()
      ),
    );
  }
}