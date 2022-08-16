import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
  //they are named after Rose of Wind, to orientate
  double paddingNNW = 0;
  double paddingWNW = 0;
  double paddingNNE = 0;
  double paddingENE = 0;
  double paddingWSW = 0;
  double paddingSSW = 0;
  double paddingSSE = 0;
  double paddingESE = 0;

  double paddingNNWPosition = 10;
  double paddingWNWPosition = 10;
  double paddingNNEPosition = 10;
  double paddingENEPosition = 10;
  double paddingWSWPosition = 10;
  double paddingSSWPosition = 10;
  double paddingSSEPosition = 10;
  double paddingESEPosition = 10;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: [
            wheel(width),
            textWheel(Colors.cyan, paddingWNWPosition),
            textWheel(Colors.lightGreen, paddingENEPosition),
            textWheel(Colors.teal, paddingWSWPosition),
            textWheel(Colors.blueGrey, paddingESEPosition),
            textWheel(Colors.indigo, paddingNNWPosition),
            textWheel(Colors.grey, paddingNNEPosition),
            textWheel(Colors.deepPurple, paddingSSWPosition),
            textWheel(Colors.indigoAccent, paddingSSEPosition),
          ],
        ),
    );
  }


  Widget textWheel(Color color, double level) {
    return Text(
      'Значение: ${level.toInt()}',
      style: TextStyle(
          color: color, fontSize: 22, fontWeight: FontWeight.bold),
    );
  }

  Widget wheel(double width) {
    return Stack( // here are two columns in one place
     // clipBehavior: Clip.antiAlias,
      children: [
        Column(
          children: [
            Row(
              children: [
                wnw(
                  width / 2,
                  paddingWNW,
                  const QuarterCircle(
                    color: Colors.cyan,
                    circleAlignment: CircleAlignment.wnw,
                  ),
                ),
                ene(
                  width / 2,
                  paddingENE,
                  const QuarterCircle(
                    color: Colors.lightGreen,
                    circleAlignment: CircleAlignment.ene,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                wsw(
                  width / 2,
                  paddingWSW,
                  const QuarterCircle(
                    color: Colors.teal,
                    circleAlignment: CircleAlignment.wsw,
                  ),
                ),
                ese(
                  width / 2,
                  paddingESE,
                  const QuarterCircle(
                    color: Colors.blueGrey,
                    circleAlignment: CircleAlignment.ese,
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                nnw(
                  width / 2,
                  paddingNNW,
                  QuarterCircle(
                    color: Colors.indigo,
                    circleAlignment: CircleAlignment.nnw,
                  ),
                ),
                nne(
                  width / 2,
                  paddingNNE,
                  QuarterCircle(
                    color: Colors.grey,
                    circleAlignment: CircleAlignment.nne,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                ssw(
                  width / 2,
                  paddingSSW,
                  QuarterCircle(
                    color: Colors.deepPurple,
                    circleAlignment: CircleAlignment.ssw,
                  ),
                ),
                sse(
                  width / 2,
                  paddingSSE,
                  QuarterCircle(
                    color: Colors.indigoAccent,
                    circleAlignment: CircleAlignment.sse,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  //the following 8 widgets changing paddings correspondingly to the dragging
  Widget wnw(double width, double padding, Widget child) {
    return SizedBox(
      width: width,
      height: width,
      child: AnimatedPadding(
        padding: EdgeInsets.only(left: padding, top: padding),
        duration: Duration(milliseconds: 100),
        child: GestureDetector(
          child: child,
          onPanUpdate: (DragUpdateDetails details) {
            paddingWNWPosition = 11 - paddingWNW * 11 / width; //this shows level of every segment
            setState(() {
              if ((details.delta.dx > 0 || details.delta.dy > 0) &&
                  paddingWNW < width - 20) {
                double a = math.max(
                    details.globalPosition.dx, details.globalPosition.dy);
                paddingWNW += 0.008 * a;
              } else if (paddingWNW > 0.008 * details.globalPosition.dx &&
                  paddingWNW > 0.008 * details.globalPosition.dy &&
                  (details.delta.dx < 0 || details.delta.dy < 0)) {
                double a = math.max(
                    details.globalPosition.dx, details.globalPosition.dy);
                paddingWNW -= 0.008 * a;
              }
            });
          },
        ),
      ),
    );
  }

  Widget nnw(double width, double padding, Widget child) {
    return SizedBox(
      width: width,
      height: width,
      child: AnimatedPadding(
        padding: EdgeInsets.only(left: padding, top: padding),
        duration: Duration(milliseconds: 100),
        child: GestureDetector(
          child: child,
          onPanUpdate: (DragUpdateDetails details) {
            paddingNNWPosition = 11 - paddingNNW * 11 / width;
            setState(() {
              if ((details.delta.dx > 0 || details.delta.dy > 0) &&
                  paddingNNW < width - 20) {
                double a = math.max(
                    details.globalPosition.dx, details.globalPosition.dy);
                paddingNNW += 0.008 * a;
              } else if (paddingNNW > 0.008 * details.globalPosition.dx &&
                  paddingNNW > 0.008 * details.globalPosition.dy &&
                  (details.delta.dx < 0 || details.delta.dy < 0)) {
                double a = math.max(
                    details.globalPosition.dx, details.globalPosition.dy);
                paddingNNW -= 0.008 * a;
              }
            });
          },
        ),
      ),
    );
  }

  Widget ene(double width, double padding, Widget child) {
    return SizedBox(
      width: width,
      height: width,
      child: AnimatedPadding(
        padding: EdgeInsets.only(right: padding, top: padding),
        duration: Duration(milliseconds: 100),
        child: GestureDetector(
          child: child,
          onPanUpdate: (DragUpdateDetails details) {
            paddingENEPosition = 11 - paddingENE * 11 / width;
            setState(() {
              if ((details.delta.dx < 0 || details.delta.dy > 0) &&
                  paddingENE < width - 20) {
                double a = math.max(
                    details.globalPosition.dx, details.globalPosition.dy);
                paddingENE += 0.008 * a;
              } else if (paddingENE > 0.008 * details.globalPosition.dx &&
                  paddingENE > 0.008 * details.globalPosition.dy &&
                  (details.delta.dx > 0 || details.delta.dy < 0)) {
                double a = math.max(
                    details.globalPosition.dx, details.globalPosition.dy);
                paddingENE -= 0.008 * a;
              }
            });
          },
        ),
      ),
    );
  }

  Widget nne(double width, double padding, Widget child) {
    return SizedBox(
      width: width,
      height: width,
      child: AnimatedPadding(
        padding: EdgeInsets.only(right: padding, top: padding),
        duration: Duration(milliseconds: 100),
        child: GestureDetector(
          child: child,
          onPanUpdate: (DragUpdateDetails details) {
            paddingNNEPosition = 11 - paddingNNE * 11 / width;
            setState(() {
              if ((details.delta.dx < 0 || details.delta.dy > 0) &&
                  paddingNNE < width - 20) {
                double a = math.max(
                    details.globalPosition.dx, details.globalPosition.dy);
                paddingNNE += 0.008 * a;
              } else if (paddingNNE > 0.008 * details.globalPosition.dx &&
                  paddingNNE > 0.008 * details.globalPosition.dy &&
                  (details.delta.dx > 0 || details.delta.dy < 0)) {
                double a = math.max(
                    details.globalPosition.dx, details.globalPosition.dy);
                paddingNNE -= 0.008 * a;
              }
            });
          },
        ),
      ),
    );
  }

  Widget wsw(double width, double padding, Widget child) {
    return SizedBox(
      width: width,
      height: width,
      child: AnimatedPadding(
        padding: EdgeInsets.only(left: padding, bottom: padding),
        duration: Duration(milliseconds: 100),
        child: GestureDetector(
          child: child,
          onPanUpdate: (DragUpdateDetails details) {
            paddingWSWPosition = 11 - paddingWSW * 11 / width;
            setState(() {
              if ((details.delta.dx > 0 || details.delta.dy < 0) &&
                  paddingWSW < width - 20) {
                double a = math.max(
                    details.globalPosition.dx, details.globalPosition.dy);
                paddingWSW += 0.008 * a;
              } else if (paddingWSW > 0.008 * details.globalPosition.dx &&
                  paddingWSW > 0.008 * details.globalPosition.dy &&
                  (details.delta.dx < 0 || details.delta.dy > 0)) {
                double a = math.max(
                    details.globalPosition.dx, details.globalPosition.dy);
                paddingWSW -= 0.008 * a;
              }
            });
          },
        ),
      ),
    );
  }

  Widget ssw(double width, double padding, Widget child) {
    return SizedBox(
      width: width,
      height: width,
      child: AnimatedPadding(
        padding: EdgeInsets.only(left: padding, bottom: padding),
        duration: Duration(milliseconds: 100),
        child: GestureDetector(
          child: child,
          onPanUpdate: (DragUpdateDetails details) {
            paddingSSWPosition = 11 - paddingSSW * 11 / width;
            setState(() {
              if ((details.delta.dx > 0 || details.delta.dy < 0) &&
                  paddingSSW < width - 20) {
                double a = math.max(
                    details.globalPosition.dx, details.globalPosition.dy);
                paddingSSW += 0.008 * a;
              } else if (paddingSSW > 0.008 * details.globalPosition.dx &&
                  paddingSSW > 0.008 * details.globalPosition.dy &&
                  (details.delta.dx < 0 || details.delta.dy > 0)) {
                double a = math.max(
                    details.globalPosition.dx, details.globalPosition.dy);
                paddingSSW -= 0.008 * a;
              }
            });
          },
        ),
      ),
    );
  }

  Widget ese(double width, double padding, Widget child) {
    return SizedBox(
      width: width,
      height: width,
      child: AnimatedPadding(
        padding: EdgeInsets.only(right: padding, bottom: padding),
        duration: Duration(milliseconds: 100),
        child: GestureDetector(
          child: child,
          onPanUpdate: (DragUpdateDetails details) {
            paddingESEPosition = 11 - paddingESE * 11 / width;
            setState(() {
              if ((details.delta.dx < 0 || details.delta.dy < 0) &&
                  paddingESE < width - 20) {
                double a = math.max(
                    details.globalPosition.dx, details.globalPosition.dy);
                paddingESE += 0.008 * a;
              } else if (paddingESE > 0.008 * details.globalPosition.dx &&
                  paddingESE > 0.008 * details.globalPosition.dy &&
                  (details.delta.dx > 0 || details.delta.dy > 0)) {
                double a = math.max(
                    details.globalPosition.dx, details.globalPosition.dy);
                paddingESE -= 0.008 * a;
              }
            });
          },
        ),
      ),
    );
  }

  Widget sse(double width, double padding, Widget child) {
    return SizedBox(
      width: width,
      height: width,
      child: AnimatedPadding(
        padding: EdgeInsets.only(right: padding, bottom: padding),
        duration: Duration(milliseconds: 100),
        child: GestureDetector(
          child: child,
          onPanUpdate: (DragUpdateDetails details) {
            paddingSSEPosition = 11 - paddingSSE * 11 / width;
            setState(() {
              if ((details.delta.dx < 0 || details.delta.dy < 0) &&
                  paddingSSE < width - 20) {
                double a = math.max(
                    details.globalPosition.dx, details.globalPosition.dy);
                paddingSSE += 0.008 * a;
              } else if (paddingSSE > 0.008 * details.globalPosition.dx &&
                  paddingSSE > 0.008 * details.globalPosition.dy &&
                  (details.delta.dx > 0 || details.delta.dy > 0)) {
                double a = math.max(
                    details.globalPosition.dx, details.globalPosition.dy);
                paddingSSE -= 0.008 * a;
              }
            });
          },
        ),
      ),
    );
  }
}



//here we painting circle sectors and positioning them correspondingly to Rose of Wind
enum CircleAlignment { nnw, wnw, wsw, ssw, sse, ese, ene, nne }

class QuarterCircle extends StatelessWidget {
  final CircleAlignment circleAlignment;
  final Color color;

  const QuarterCircle({
    this.color = Colors.green,
    this.circleAlignment = CircleAlignment.nnw,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;

    return SizedBox(
      width: width / 2,
      height: width / 2,
      child: ClipRect(
        child: CustomPaint(
          painter: QuarterCirclePainter(
            circleAlignment: circleAlignment,
            color: color,
          ),
        ),
      ),
    );
  }
}

class QuarterCirclePainter extends CustomPainter {
  final CircleAlignment circleAlignment;
  final Color color;

  const QuarterCirclePainter(
      {required this.circleAlignment, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final radius = math.min(size.height, size.width);
    final offset = circleAlignment == CircleAlignment.sse
        ? Offset(.0, .0)
        : circleAlignment == CircleAlignment.ese
        ? Offset(.0, .0)
        : circleAlignment == CircleAlignment.wsw
        ? Offset(size.width, .0)
        : circleAlignment == CircleAlignment.ssw
        ? Offset(size.width, .0)
        : circleAlignment == CircleAlignment.ene
        ? Offset(.0, size.height)
        : circleAlignment == CircleAlignment.nne
        ? Offset(.0, size.height)
        : circleAlignment == CircleAlignment.nnw
        ? Offset(size.width, size.height)
        : Offset(size.width, size.height);
    final angle = circleAlignment == CircleAlignment.ssw
        ? (pi / 2)
        : circleAlignment == CircleAlignment.sse
        ? (pi / 2)
        : (circleAlignment == CircleAlignment.ese ||
        circleAlignment == CircleAlignment.ene)
        ? (-pi / 2)
        : circleAlignment == CircleAlignment.nnw
        ? (-pi)
        : circleAlignment == CircleAlignment.wnw
        ? (pi)
        : circleAlignment == CircleAlignment.wsw
        ? (-3 * pi / 2)
        : (3 * pi / 2);

    Rect rect = Rect.fromCircle(center: offset, radius: radius);
    Path path = Path()
    // set the "current point"
      ..moveTo(offset.dx, offset.dy)
      ..arcTo(rect, pi / 4, angle, false);
    canvas.drawPath(path, Paint()
      ..color = color);
    // canvas.drawCircle(offset, radius, Paint()..color = color);
  }

  @override
  bool shouldRepaint(QuarterCirclePainter oldDelegate) {
    return color == oldDelegate.color &&
        circleAlignment == oldDelegate.circleAlignment;
  }
}

enum DraggingAlignment { nnw, wnw, wsw, ssw, sse, ese, ene, nne }

// class Dragging {
//   Dragging({required this.draggingAlignment});
//
//   final DraggingAlignment draggingAlignment;
//   double paddingNNW = 0;
//   double paddingWNW = 0;
//   double paddingNNE = 0;
//   double paddingENE = 0;
//   double paddingWSW = 0;
//   double paddingSSW = 0;
//   double paddingSSE = 0;
//   double paddingESE = 0;
//
//
//   EdgeInsets paddingsDirection(double padding) {
//     if (draggingAlignment == DraggingAlignment.nnw || draggingAlignment == DraggingAlignment.wnw ) {
//       return EdgeInsets.only(left: padding, top: padding);
//     } else if (draggingAlignment == DraggingAlignment.nne || draggingAlignment == DraggingAlignment.ene ) {
//       return EdgeInsets.only(right: padding, top: padding);
//     } else if (draggingAlignment == DraggingAlignment.ese || draggingAlignment == DraggingAlignment.sse ) {
//       return EdgeInsets.only(right: padding, bottom: padding);
//     } else if (draggingAlignment == DraggingAlignment.ssw || draggingAlignment == DraggingAlignment.wsw ) {
//       return EdgeInsets.only(left: padding, bottom: padding);
//     } else {
//       return const EdgeInsets.all(0);
//     }
//   }
//
//   void paddingsDimention(DragUpdateDetails details, double width) {
//     if (draggingAlignment == DraggingAlignment.nnw || draggingAlignment == DraggingAlignment.wnw) {
//       if (details.delta.dx > 0 && paddingDirection < width - 20) {
//         paddingDirection += 0.008 * details.globalPosition.dx;
//       } else if (paddingDirection > 0.008 * details.globalPosition.dx &&
//           details.delta.dx < 0) {
//         paddingDirection -= 0.008 * details.globalPosition.dx;
//       }
//     } else if (draggingAlignment == DraggingAlignment.nne || draggingAlignment == DraggingAlignment.ene) {
//       if (details.delta.dx < 0 && paddingDirection < width - 20) {
//         paddingDirection += 0.008 * details.globalPosition.dx;
//       } else if (paddingDirection > 0.008 * details.globalPosition.dx &&
//           details.delta.dx > 0) {
//         paddingDirection -= 0.008 * details.globalPosition.dx;
//       }
//     } else if (draggingAlignment == DraggingAlignment.ese || draggingAlignment == DraggingAlignment.sse) {
//       if (details.delta.dx < 0 && paddingDirection < width - 20) {
//         paddingDirection += 0.008 * details.globalPosition.dx;
//       } else if (paddingDirection > 0.008 * details.globalPosition.dx &&
//           details.delta.dx > 0) {
//         paddingDirection -= 0.008 * details.globalPosition.dx;
//       }
//     } else if (draggingAlignment == DraggingAlignment.ssw || draggingAlignment == DraggingAlignment.wsw) {
//       if ((details.delta.dx < 0 || details.delta.dy < 0) &&
//           paddingSSE < width - 20) {
//         double a = math.max(
//             details.globalPosition.dx, details.globalPosition.dy);
//         paddingSSE += 0.008 * a;
//       } else if (paddingSSE > 0.008 * details.globalPosition.dx &&
//           paddingSSE > 0.008 * details.globalPosition.dy &&
//           (details.delta.dx > 0 || details.delta.dy > 0)) {
//         double a = math.max(
//             details.globalPosition.dx, details.globalPosition.dy);
//         paddingSSE -= 0.008 * a;
//       }
//     }
//   }
// }
