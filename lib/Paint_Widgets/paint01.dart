import 'package:flutter/material.dart';
import 'package:ketoken/constants/style.dart';



class Paint01 extends StatefulWidget {
  const Paint01({Key? key}) : super(key: key);

  @override
  _Paint01State createState() => _Paint01State();
}

class _Paint01State extends State<Paint01> {
  @override

  Widget build(BuildContext context) {
    double safe = MediaQuery.of(context).padding.top;

    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double height = height1-safe;
    return Scaffold(
      body: Container(

        color: Colors.white,
        height: height1*0.27,
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
    ovalPath5.moveTo(0, height * 0.9);
    //ovalPath.lineTo(0, 0);
    //ovalPath3.lineTo(width*0, height*0.94);
    ovalPath5.quadraticBezierTo(width*.90, height, width, 0);
    // Close line to reset it back
    ovalPath5.close();
    paint.color = Yellow1;
    canvas.drawPath(ovalPath5, paint);

    Path ovalPath6 = Path();
    ovalPath6.moveTo(0, 0);
    ovalPath6.lineTo(0, height*0.9);
    ovalPath6.lineTo(width, 0);
    //ovalPath2.quadraticBezierTo(width*.7, height*.5, width*.9, 0);
    // Close line to reset it back
    ovalPath6.close();
    paint.color =Yellow1;
    canvas.drawPath(ovalPath6, paint);

    ///////////////////////////////////////////////////////////////
    Path ovalPath3 = Path();
    ovalPath3.moveTo(0, height * 0.9);
    //ovalPath.lineTo(0, 0);
    //ovalPath3.lineTo(width*0, height*0.94);
    ovalPath3.quadraticBezierTo(width*.65, height*.95, width*.92, 0);
    // Close line to reset it back
    ovalPath3.close();
    paint.color = Green1;
    canvas.drawPath(ovalPath3, paint);

    Path ovalPath4 = Path();
    ovalPath4.moveTo(0, 0);
    ovalPath4.lineTo(0, height*0.9);
    ovalPath4.lineTo(width*0.92, 0);
    //ovalPath2.quadraticBezierTo(width*.7, height*.5, width*.9, 0);
    // Close line to reset it back
    ovalPath4.close();
    paint.color =Green1;
    canvas.drawPath(ovalPath4, paint);

    ///////////////////////////////////////////////////////////////

    Path ovalPath = Path();
    ovalPath.moveTo(0, height * 0.9);
    //ovalPath.lineTo(0, 0);
    // ovalPath.lineTo(width*0, height*0.9);
    ovalPath.quadraticBezierTo(width*.6, height*.8, width*.8, 0);
    // Close line to reset it back
    ovalPath.close();
    paint.color =Blue1;
    canvas.drawPath(ovalPath, paint);

    Path ovalPath2 = Path();
    ovalPath2.moveTo(0, 0);
    ovalPath2.lineTo(0, height*0.9);
    ovalPath2.lineTo(width*0.8, 0);
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