import 'package:flutter/material.dart';
import 'package:twilight_imperium/resources/colors.dart';
import 'package:twilight_imperium/resources/outlined_letters.dart';

class StrategyCardVisualization extends StatelessWidget {
  const StrategyCardVisualization({
    super.key,
    required this.width,
    required this.height,
    required this.card
  });

  final double width;
  final double height;
  final int card;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(
        width, height
      ),
      painter: StrategyPainter(card: card),
      child: SizedBox(
        height: height, width: width, 
        child: Transform.translate(
          offset: Offset(width * 0.3, height * 0.3),
          child: OutlinedLetters(content: '$card', fontSize: height * 0.3,)
        )
      ),
    );
  }
}

class StrategyPainter extends CustomPainter {
  const StrategyPainter({required this.card});

  final int card;
  @override
  void paint(Canvas canvas, Size size) {
    Path p = Path();
    p.moveTo(0.0, size.height * 0.05);
    p.lineTo(0.0, size.height);
    p.lineTo(size.width * 0.6, size.height);
    p.lineTo(size.width, size.height * 0.1);
    p.lineTo(size.width * 0.9, 0.0);
    p.lineTo(size.height * 0.05,0.0);
    p.lineTo(0.0,size.height * 0.05);
    canvas.drawPath(p, Paint()..color=TIColors.getStrategyCardColor(card));
    canvas.drawPath(p, Paint()..style=PaintingStyle.stroke..color=TIColors.strategyCardBorder..strokeWidth=2.0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}