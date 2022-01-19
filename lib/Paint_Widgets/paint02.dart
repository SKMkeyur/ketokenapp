import 'package:flutter/material.dart';
import 'package:ketoken/constants/style.dart';



class Paint02 extends StatefulWidget {
  const Paint02({Key? key}) : super(key: key);

  @override
  _Paint02State createState() => _Paint02State();
}

class _Paint02State extends State<Paint02> {
  @override

  Widget build(BuildContext context) {
    double safe = MediaQuery.of(context).padding.top;

    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double height = height1-safe;
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: height1,
        child: CustomPaint(
            painter: BluePainter(),
            child: Container()
        ),
      ),

    );
  }
}


class BluePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path mainBackground = Path();
    //  mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));


    ///////////////////////////////////////////////////////////////
    Path ovalPath5 = Path();
    ovalPath5.moveTo(0, height * 0.88);
    //ovalPath.lineTo(0, 0);
    //ovalPath3.lineTo(width*0, height*0.94);
    ovalPath5.quadraticBezierTo(width*.5, height, width, height * 0.88);
    // Close line to reset it back
    ovalPath5.close();
    paint.color = Yellow1;
    canvas.drawPath(ovalPath5, paint);

    Path ovalPath6 = Path();
    ovalPath6.moveTo(0, 0);
    ovalPath6.lineTo(0, height*0.88);
    ovalPath6.lineTo(width, height*0.88);
    ovalPath6.lineTo(width, 0);

    //ovalPath2.quadraticBezierTo(width*.7, height*.5, width*.9, 0);
    // Close line to reset it back
    ovalPath6.close();
    paint.color =Yellow1;
    canvas.drawPath(ovalPath6, paint);

    ///////////////////////////////////////////////////////////////
    Path ovalPath3 = Path();
    ovalPath3.moveTo(0, height * 0.67);
    //ovalPath.lineTo(0, 0);
    //ovalPath3.lineTo(width*0, height*0.94);
    ovalPath3.quadraticBezierTo(width*.5, height*.80, width, height * 0.67);
    // Close line to reset it back
    ovalPath3.close();
    paint.color = Green1;
    canvas.drawPath(ovalPath3, paint);

    Path ovalPath4 = Path();
    ovalPath4.moveTo(0, 0);
    ovalPath4.lineTo(0, height*0.67);
    ovalPath4.lineTo(width, height*0.67);
    ovalPath4.lineTo(width, 0);

    //ovalPath2.quadraticBezierTo(width*.7, height*.5, width*.9, 0);
    // Close line to reset it back
    ovalPath4.close();
    paint.color =Green1;
    canvas.drawPath(ovalPath4, paint);

    ///////////////////////////////////////////////////////////////

    Path ovalPath = Path();
    ovalPath.moveTo(0, height * 0.46);
    //ovalPath.lineTo(0, 0);
    // ovalPath.lineTo(width*0, height*0.9);
    ovalPath.quadraticBezierTo(width*.5, height*.59, width, height * 0.46);
    // Close line to reset it back
    ovalPath.close();
    paint.color =Blue1;
    canvas.drawPath(ovalPath, paint);

    Path ovalPath2 = Path();
    ovalPath2.moveTo(0, 0);
    ovalPath2.lineTo(0, height*0.46);
    ovalPath2.lineTo(width, height*0.46);
    ovalPath2.lineTo(width, 0);

    //ovalPath2.quadraticBezierTo(width*.7, height*.5, width*.9, 0);
    // Close line to reset it back
    ovalPath2.close();
    paint.color = Blue1;
    canvas.drawPath(ovalPath2, paint);
    //




  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}