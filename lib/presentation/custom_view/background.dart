import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:wiki_work_assignment/resources/colors.dart';
class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;


    Path path_0 = Path();
    path_0.moveTo(size.width*-0.0051563,size.height*0.6134875);
    path_0.lineTo(0,size.height*0.0006250);
    path_0.quadraticBezierTo(size.width*0.5468750,size.height*-0.0007813,size.width*0.7291667,size.height*-0.0012500);
    path_0.cubicTo(size.width*0.9135625,size.height*0.0878438,size.width*0.3376979,size.height*0.0487063,size.width*0.3873646,size.height*0.1271375);
    path_0.cubicTo(size.width*0.3904479,size.height*0.1535313,size.width*0.4314479,size.height*0.2108250,size.width*0.3291667,size.height*0.2325000);
    path_0.cubicTo(size.width*0.2280729,size.height*0.2491875,size.width*0.1133021,size.height*0.1354687,size.width*0.1458333,size.height*0.2887500);
    path_0.cubicTo(size.width*0.1714479,size.height*0.3637625,size.width*-0.0968333,size.height*0.3866750,size.width*0.0552083,size.height*0.5075000);
    path_0.quadraticBezierTo(size.width*0.0898021,size.height*0.5338188,size.width*-0.0051979,size.height*0.6259375);

    canvas.drawPath(path_0, paint_fill_0);


    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;



    canvas.drawPath(path_0, paint_stroke_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
