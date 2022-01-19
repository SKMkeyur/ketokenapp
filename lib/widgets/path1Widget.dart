



import 'package:flutter/cupertino.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();


    // Path number 1


    paint.color = Color(0xff002233);
    path = Path();
    path.lineTo(0, 0);
    path.cubicTo(0, 0, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, size.width, size.height, size.width, size.height);
    path.cubicTo(size.width, size.height, 0, size.height, 0, size.height);
    path.cubicTo(0, size.height, 0, 0, 0, 0);
    canvas.drawPath(path, paint);


    // Path number 2


    paint.color = Color(0xff0066FF);
    path = Path();
    path.lineTo(0, size.height * 0.88);
    path.cubicTo(0, size.height * 0.88, size.width * 0.08, size.height * 0.86, size.width * 0.08, size.height * 0.86);
    path.cubicTo(size.width * 0.17, size.height * 0.84, size.width / 3, size.height * 0.81, size.width / 2, size.height * 0.71);
    path.cubicTo(size.width * 0.67, size.height * 0.62, size.width * 0.83, size.height * 0.46, size.width * 0.92, size.height * 0.38);
    path.cubicTo(size.width * 0.92, size.height * 0.38, size.width, size.height * 0.3, size.width, size.height * 0.3);
    path.cubicTo(size.width, size.height * 0.3, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, size.width * 0.92, 0, size.width * 0.92, 0);
    path.cubicTo(size.width * 0.83, 0, size.width * 0.67, 0, size.width / 2, 0);
    path.cubicTo(size.width / 3, 0, size.width * 0.17, 0, size.width * 0.08, 0);
    path.cubicTo(size.width * 0.08, 0, 0, 0, 0, 0);
    path.cubicTo(0, 0, 0, size.height * 0.88, 0, size.height * 0.88);
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}