import 'package:flutter/material.dart';

import 'dragging_direction.dart';
import 'dart:math' as math;

class SegmentPaddings {
  final DraggingDirection alignment;
  double padding = 0;

  SegmentPaddings(this.alignment);

  EdgeInsets get widgetPadding {
    switch (alignment) {
      case DraggingDirection.nnw:
      case DraggingDirection.wnw:
        return EdgeInsets.only(left: padding, top: padding);
      case DraggingDirection.wsw:
      case DraggingDirection.ssw:
        return EdgeInsets.only(bottom: padding, left: padding);
      case DraggingDirection.sse:
      case DraggingDirection.ese:
        return EdgeInsets.only(bottom: padding, right: padding);
      case DraggingDirection.ene:
      case DraggingDirection.nne:
        return EdgeInsets.only(top: padding, right: padding);
    }
  }

  double paddingPosition(double width) => 11 - padding * 11 / width;

  void changeValue(DragUpdateDetails details, double width) {
    switch (alignment) {
      case DraggingDirection.nnw:
      case DraggingDirection.wnw:
        changeForNw(details, width);
        return;
      case DraggingDirection.wsw:
      case DraggingDirection.ssw:
        changeForSw(details, width);
        return;
      case DraggingDirection.sse:
      case DraggingDirection.ese:
        changeForSe(details, width);
        return;
      case DraggingDirection.ene:
      case DraggingDirection.nne:
        changeForNe(details, width);
        return;
    }
  }

  void changeForNw(DragUpdateDetails details, double width) {
    if ((details.delta.dx > 0 || details.delta.dy > 0) && padding < width - 20) {
      double a = math.max(details.globalPosition.dx, details.globalPosition.dy);
      padding += 0.008 * a;
    } else if (padding > 0.008 * details.globalPosition.dx &&
        padding > 0.008 * details.globalPosition.dy &&
        (details.delta.dx < 0 || details.delta.dy < 0)) {
      double a = math.max(details.globalPosition.dx, details.globalPosition.dy);
      padding -= 0.008 * a;
    }
  }

  void changeForSw(DragUpdateDetails details, double width) {
    if ((details.delta.dx > 0 || details.delta.dy < 0) && padding < width - 20) {
      double a = math.max(details.globalPosition.dx, details.globalPosition.dy);
      padding += 0.008 * a;
    } else if (padding > 0.008 * details.globalPosition.dx &&
        padding > 0.008 * details.globalPosition.dy &&
        (details.delta.dx < 0 || details.delta.dy > 0)) {
      double a = math.max(details.globalPosition.dx, details.globalPosition.dy);
      padding -= 0.008 * a;
    }
  }

  void changeForSe(DragUpdateDetails details, double width) {
    if ((details.delta.dx < 0 || details.delta.dy < 0) && padding < width - 20) {
      double a = math.max(details.globalPosition.dx, details.globalPosition.dy);
      padding += 0.008 * a;
    } else if (padding > 0.008 * details.globalPosition.dx &&
        padding > 0.008 * details.globalPosition.dy &&
        (details.delta.dx > 0 || details.delta.dy > 0)) {
      double a = math.max(details.globalPosition.dx, details.globalPosition.dy);
      padding -= 0.008 * a;
    }
  }

  void changeForNe(DragUpdateDetails details, double width) {
    if ((details.delta.dx < 0 || details.delta.dy > 0) && padding < width - 20) {
      double a = math.max(details.globalPosition.dx, details.globalPosition.dy);
      padding += 0.008 * a;
    } else if (padding > 0.008 * details.globalPosition.dx &&
        padding > 0.008 * details.globalPosition.dy &&
        (details.delta.dx > 0 || details.delta.dy < 0)) {
      double a = math.max(details.globalPosition.dx, details.globalPosition.dy);
      padding -= 0.008 * a;
    }
  }
}
