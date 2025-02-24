import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'package:twilight_imperium/resources/colors.dart';
import 'package:twilight_imperium/main/map/map_tile.dart';

class MapPanel extends StatefulWidget {
  const MapPanel({super.key});

  @override
  State<MapPanel> createState() => _MapPanelState();
}

class _MapPanelState extends State<MapPanel> {
  final double internalLength = 2500;
  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      constrained: false,
      minScale: 0.1,
      child: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children:[
            SizedBox(
              height: internalLength,
              width: internalLength, 
              child: Image.asset('images/basebackground.jpg', fit: BoxFit.cover,)),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: HexagonGrid.flat(
                  width: internalLength,
                  height: internalLength,
                  color: Colors.transparent,
                  depth: 3,
                  buildTile: (coordinates) => HexagonWidgetBuilder(
                    color: TIColors.tileBase,
                    padding: 5,
                    cornerRadius: 8.0,
                    child: MapTile(coords: coordinates)
                  )
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}