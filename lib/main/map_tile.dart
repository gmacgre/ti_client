import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'package:provider/provider.dart';
import 'package:twilight_imperium/resources/colors.dart';
import 'package:twilight_imperium/state/state_game.dart';
import 'package:twilight_imperium/state/state_turn.dart';

class MapTile extends StatefulWidget {
  const MapTile({super.key, required this.coords});

  final Coordinates coords;

  @override
  State<MapTile> createState() => _MapTileState();
}
// TODO: Build Map Tile Display after adding them to the Game Model
class _MapTileState extends State<MapTile> {
  @override
  Widget build(BuildContext context) {
    GameState gs = context.watch<GameState>();
    return LayoutBuilder(
      builder: (context, constraints) => GestureDetector(
        onTap: () { 
          TurnStage? ts = gs.tapTile(widget.coords);
          if(ts != null) {
            Provider.of<TurnState>(context, listen: false).currentStage = ts;
          }
          print('${widget.coords}');
        },
        child: Container(width: constraints.maxWidth, height: constraints.maxHeight,
          decoration: BoxDecoration(color: TIColors.panelDivider),
          child: Text("Bababooey", style: TextStyle(color: TIColors.bodyText),),
        )
      ),
    );
  }
}