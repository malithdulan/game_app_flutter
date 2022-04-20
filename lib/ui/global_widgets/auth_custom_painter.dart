import 'package:flutter/material.dart';

class AuthCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    canvas.drawPath(_topLeftPath(size), _topLeftPaint(rect));
    canvas.drawPath(_bottomRightPath(size), _bottomRightPaint(rect));
  }

  Path _topLeftPath(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(
      size.width * 0.9,
      size.height * 0.1,
      size.width * 0.6,
      size.height * 0.1,
    );
    path.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.1,
      size.width * 0.1,
      size.height * 0.3,
    );
    path.quadraticBezierTo(
      size.width * 0.06,
      size.height * 0.4,
      size.width * 0,
      size.height * 0.4,
    );
    path.close();
    return path;
  }

  Path _bottomRightPath(Size size) {
    var path = Path();
    path.moveTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.7);
    path.quadraticBezierTo(
      size.width,
      size.height * .65,
      size.width,
      size.height * 0.7,
    );
    path.quadraticBezierTo(
      size.width * .9,
      size.height * .95,
      size.width * 0.2,
      size.height * 0.97,
    );
    path.quadraticBezierTo(
      size.width * .1,
      size.height * .98,
      size.width * 0.1,
      size.height,
    );
    path.close();
    return path;
  }

  //top left shape paint with color gradient
  Paint _topLeftPaint(Rect rect) {
    return Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [.01, .25],
        colors: [
          Color(0xfff8a55f),
          Color(0xfff1665f),
        ],
      ).createShader(rect);
  }

  //bottom right shape with color gradient
  Paint _bottomRightPaint(Rect rect) {
    return Paint()
      ..shader = const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [.05, 1],
        colors: [
          Color(0xff0ce8f9),
          Color(0xff45b7fe),
        ],
      ).createShader(rect);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
