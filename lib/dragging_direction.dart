import 'package:flutter/material.dart';

enum DraggingDirection {
  nnw,
  nne,
  ssw,
  sse,
  wnw,
  ene,
  wsw,
  ese,
}

extension DraggingAlignmentExt on DraggingDirection {
  Color get color {
    switch (this) {
      case DraggingDirection.nnw:
        return Colors.cyan;
      case DraggingDirection.wnw:
        return Colors.deepOrange;
      case DraggingDirection.wsw:
        return Colors.deepPurple;
      case DraggingDirection.ssw:
        return Colors.red;
      case DraggingDirection.sse:
        return Colors.blueAccent;
      case DraggingDirection.ese:
        return Colors.yellowAccent;
      case DraggingDirection.ene:
        return Colors.orange;
      case DraggingDirection.nne:
        return Colors.green;
    }
  }

  Offset offset(Size size) {
    switch (this) {
      case DraggingDirection.nnw:
      case DraggingDirection.wnw:
        return Offset(size.width, size.height);
      case DraggingDirection.nne:
      case DraggingDirection.ene:
        return Offset(.0, size.height);
      case DraggingDirection.ssw:
      case DraggingDirection.wsw:
        return Offset(size.width, .0);
      default:
        return const Offset(.0, .0);
    }
  }
}