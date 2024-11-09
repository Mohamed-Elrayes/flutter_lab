import 'package:flutter/material.dart';

class TicketBookingScreen extends StatelessWidget {
  const TicketBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF051F25),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomPaint(
                    size: const Size(double.infinity, 200),
                    painter: TvPainter(),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class TvPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const point1 = Offset(0, 0);
    final point2 = Offset(size.width, 0);
    // final contolPoint = Offset((point2.dx - point1.dx) / 2, (size.height / 2) - 40);

    final path = Path()
      ..moveTo(point1.dx, point1.dy)
      ..lineTo(point2.dx, point2.dy);
    // ..quadraticBezierTo(contolPoint.dx, contolPoint.dy, point2.dx, point2.dy);

    canvas.drawLine(point1, point2, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
