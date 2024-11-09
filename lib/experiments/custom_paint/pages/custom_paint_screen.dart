import 'dart:math';

import 'package:flutter/material.dart';

/// Canvas
///  ---------------> +X
///  |
///  |
///  |
/// +y
///
/// Can Draw on Canvas
///  - Shapes -> Methods like drawRect(), drawCircle(), drawOval(), and drawPath() allow drawing basic shapes.
///  - Lines -> Use drawLine() to draw lines.
///  - Path -> he Path class allows drawing more complex shapes with curves, arcs, and custom points.
///
/// Can Paint with Paint
///  - Paint is a class that holds attributes for drawing, such as color, stroke width, and style.
///    + color: Defines the color of the shape or line.
///    + style: Specifies whether you want a PaintingStyle.fill (for filled shapes) or PaintingStyle.stroke (for outlined shapes).
///    + strokeWidth: Controls the width of the lines.
///    + strokeCap: Defines the style of the ends of lines (e.g., round, square).
///    + shader: For gradient or pattern effects on paint.
///    + blendMode: Defines how shapes overlap with colors behind them (e.g., BlendMode.multiply).
///
/// Work with Path:
/// The Path class lets you create complex shapes. Paths allow:
///    + Adding Lines: Use moveTo() to start at a position and lineTo() to draw lines.
///    + Curves and Arcs: Use quadraticBezierTo() and cubicTo() for curves, or arcTo() for circular arcs.
///    + Closed Shapes: Use close() to complete a shape by connecting the last point to the starting point.
///
///
class CustomPaintScreen extends StatelessWidget {
  const CustomPaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF051F25),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PaintShapeContainer(
                      painter: DrawShapes(),
                      title: 'Paint Rectangle Shape',
                    ),
                    PaintShapeContainer(
                      painter: DrawRoundedRectangle(),
                      title: 'Paint Rounded Rectangle Shape',
                    ),
                    PaintShapeContainer(
                      painter: DrawCircleAndOval(),
                      title: 'Paint Circle and Oval Shape',
                    ),
                    PaintShapeContainer(
                      painter: DrawLinesAndArch(),
                      title: 'Paint Lines and Arch Shape',
                    ),
                    PaintShapeContainer(
                      painter: DrawPath(),
                      title: 'Paint Path Shape',
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class PaintShapeContainer extends StatelessWidget {
  final CustomPainter painter;
  final String title;
  final double height;
  final double? width;

  const PaintShapeContainer({
    super.key,
    required this.painter,
    required this.title,
    this.height = 200,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.all(40),
          color: Colors.grey.withOpacity(0.2),
          child: CustomPaint(
            size: Size(width ?? double.infinity, height),
            painter: painter,
          ),
        ),
      ],
    );
  }
}

/*------------------  -----------------*/

class DrawShapes extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;

/*================== Rectangle ⬜ =================*/

    /// How Draw rectangle? ⬜
    /// Draw rectangle using canvas.drawRect() method
    /// Parameters:
    /// - Rect: The rectangle to draw have multiple ways to create it
    ///    + Rect.fromPoints(Offset(x1, y1), Offset(x2, y2))
    ///    + Rect.fromCircle(center: Offset(x, y), radius: radius)
    ///    + Rect.fromCenter(center: Offset(x, y), width: width, height: height)
    ///    + Rect.fromLTRB(left, top, right, bottom)
    ///    + Rect.fromLTWH(left, top, width, height)

    /// Draw Rect from Points
    const point1 = Offset(0, 0);
    const point2 = Offset(100, 100);
    canvas.drawRect(Rect.fromPoints(point1, point2), paint);

    /// Draw Rect from Circle
    const recRadius = 20.0;
    const centerPointCircle = Offset(100 + recRadius, recRadius);
    canvas.drawRect(Rect.fromCircle(center: centerPointCircle, radius: recRadius),
        paint..color = Colors.blueAccent);

    /// Draw Rect from Center Point
    final centerPoint = Offset(centerPointCircle.dx + recRadius + 10, 0);
    canvas.drawRect(
        Rect.fromCenter(center: centerPoint, width: 15, height: 15), paint..color = Colors.red);

    /// Draw Rect from Left, Top, Right, Bottom
    canvas.drawRect(const Rect.fromLTRB(140, 50, 200, 100), paint..color = Colors.red);

    /// Draw Rect from Left, Top, Width, Height
    canvas.drawRect(const Rect.fromLTWH(140, 50, 15, 15), paint..color = Colors.blueGrey);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class DrawRoundedRectangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;

/*================== Round Rectangle ⬜ =================*/

    /// How Draw Round rectangle?
    /// Draw rectangle using canvas.drawRRect() method
    /// Parameters:
    /// - Round Rect: The rectangle to draw have multiple ways to create it
    ///    + RRect.fromRectAndCorners(Rect rect, {topLeft, topRight, bottomLeft, bottomRight})
    ///    + RRect.fromRectAndRadius(Rect rect, Radius radius)

    /// Draw Round Rect
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          const Rect.fromLTWH(0, 0, 100, 100),
          topLeft: const Radius.circular(20),
          topRight: const Radius.circular(20),
          bottomLeft: const Radius.circular(20),
          bottomRight: const Radius.circular(20),
        ),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class DrawCircleAndOval extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;
/*================== Circle ⏺ =================*/
    /// How Draw circle? ⏺
    /// Draw circle using canvas.drawCircle() method
    /// Parameters:
    /// - Offset: The center point of the circle (x,y coordinates)
    /// - radius: The radius of the circle
    const radius1 = 50.0;
    final centerOffset = Offset(0 + radius1, size.height - radius1);
    canvas.drawCircle(
      centerOffset, // Center of the canvas
      radius1, // Radius of 50 pixels
      paint,
    );
    /*================== Oval ⭕ =================*/
    canvas.drawOval(Rect.fromCenter(center: const Offset(100, 100), width: 100, height: 50),
        paint..color = Colors.green);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class DrawLinesAndArch extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;
/*================== Circle ⏺ =================*/
    canvas.drawLine(const Offset(0, 0), const Offset(100, 100), paint);
    canvas.drawArc(
      Rect.fromCenter(center: const Offset(100, 100), width: 100, height: 50),
      0,
      pi * 2,
      true, // show line from center to start point
      paint..color = Colors.red,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class DrawPath extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;
/*================== line by path  =================*/
    final path = Path();
    // line

    path.lineTo(100, 100);

    // arc to point (start from end of last point drawn)
    path.arcToPoint(const Offset(100, 50), radius: const Radius.circular(20));
    // relative arc to point => mean that add last point to this point (offset(100,50) to (100,100) = offset(200,150))
    // it equal use arcToPoint with (offset(100,50) + (100,100) = offset(200,150))
    path.relativeArcToPoint(const Offset(100, 100), radius: const Radius.circular(20));

    // arc (not depend on last point)
    path.addArc(Rect.fromCenter(center: const Offset(100, 100), width: 100, height: 50), 0, pi);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
