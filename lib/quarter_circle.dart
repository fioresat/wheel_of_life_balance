//here we painting circle sectors and positioning them correspondingly to Rose of Wind
//enum CircleAlignment { nnw, wnw, wsw, ssw, sse, ese, ene, nne }

import 'dart:math';

import 'package:flutter/material.dart';

import 'dragging_direction.dart';

class QuarterCircle extends StatelessWidget {
  final DraggingDirection circleAlignment;

  const QuarterCircle({
    this.circleAlignment = DraggingDirection.nnw,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width / 2,
      height: width / 2,
      child: ClipRect(
        child: CustomPaint(
          painter: QuarterCirclePainter(
            circleAlignment: circleAlignment,
            color: circleAlignment.color,
          ),
        ),
      ),
    );
  }
}

class QuarterCirclePainter extends CustomPainter {
  final DraggingDirection circleAlignment;
  final Color color;

  const QuarterCirclePainter({required this.circleAlignment, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final radius = min(size.height, size.width);
    final offset = circleAlignment.offset(size);
// TODO re-write to switch-case and exclude into extension
    final angle = circleAlignment == DraggingDirection.ssw || circleAlignment == DraggingDirection.sse
        ? (pi / 2)
        : (circleAlignment == DraggingDirection.ese || circleAlignment == DraggingDirection.ene)
            ? (-pi / 2)
            : circleAlignment == DraggingDirection.nnw
                ? (-pi)
                : circleAlignment == DraggingDirection.wnw
                    ? (pi)
                    : circleAlignment == DraggingDirection.wsw
                        ? (-3 * pi / 2)
                        : (3 * pi / 2);

    Rect rect = Rect.fromCircle(center: offset, radius: radius);
    Path path = Path()
// set the "current point"
      ..moveTo(offset.dx, offset.dy)
      ..arcTo(rect, pi / 4, angle, false);
    canvas.drawPath(path, Paint()..color = color);
// canvas.drawCircle(offset, radius, Paint()..color = color);
  }

  @override
  bool shouldRepaint(QuarterCirclePainter oldDelegate) {
    return color == oldDelegate.color && circleAlignment == oldDelegate.circleAlignment;
  }
}
