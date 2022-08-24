import 'package:flutter/material.dart';
import 'package:wheel_of_life_balance/quarter_circle.dart';

import 'package:wheel_of_life_balance/segment_gesture_detector.dart';
import 'package:wheel_of_life_balance/segment_paddings.dart';

import 'dragging_direction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Wheel of Life'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final directions = DraggingDirection.values.map((e) => SegmentPaddings(e)).toList();

  double width = 0;
  double height = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          wheel(),
          ...directions
              .map(
                (paddings) => textWheel(
                  paddings.alignment.color,
                  paddings.paddingPosition(width),
                ),
              )
              .toList(),
        ],
      ),
    );
  }

  Widget textWheel(Color color, double level) {
    return Text(
      'Значение: ${level.toInt()}',
      style: TextStyle(
        color: color,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget wheel() {
    return Stack(
      children: [
        Column(
          children: [
            Row(
              children: [
                segment(directions[0]),
                segment(directions[1]),
              ],
            ),
            Row(
              children: [
                segment(directions[2]),
                segment(directions[3]),
              ],
            ),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                segment(directions[4]),
                segment(directions[5]),
              ],
            ),
            Row(
              children: [
                segment(directions[6]),
                segment(directions[7]),
              ],
            ),
          ],
        ),
      ],
    );
  }

  //the following 8 widgets changing paddings correspondingly to the dragging
  Widget segment(SegmentPaddings segmentPaddings) {
    return SegmentGestureDetector(
        paddings: segmentPaddings,
        child: QuarterCircle(
          circleAlignment: segmentPaddings.alignment,
        ),
        onPanUpdate: (details) {
          setState(() {
            segmentPaddings.changeValue(details, width);
          });
        });
  }
}
