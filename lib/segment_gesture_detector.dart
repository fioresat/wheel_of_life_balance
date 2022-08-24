import 'package:flutter/material.dart';
import 'package:wheel_of_life_balance/segment_paddings.dart';

class SegmentGestureDetector extends StatelessWidget {
  final SegmentPaddings paddings;
  final Widget child;
  final void Function(DragUpdateDetails details) onPanUpdate;

  const SegmentGestureDetector({
    Key? key,
    required this.paddings,
    required this.child,
    required this.onPanUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width / 2,
      height: width / 2,
      child: AnimatedPadding(
        padding: paddings.widgetPadding,
        duration: const Duration(milliseconds: 100),
        child: GestureDetector(
          onPanUpdate: onPanUpdate,
          child: child,
        ),
      ),
    );
  }
}
