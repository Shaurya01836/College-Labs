import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Basic shapes',
      home: DrawingScreen(),
    );
  }
}

class DrawingScreen extends StatelessWidget {
  const DrawingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basic shapes')),
      body: Center(
        child: CustomPaint(size: const Size(300, 300), painter: ShapePainter()),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3
      ..style = PaintingStyle.fill;

    // Draw a line
    canvas.drawLine(const Offset(20, 20), Offset(200, 20), paint);


    // Draw a rectangle
    canvas.drawRect(const Rect.fromLTWH(20, 50, 120, 80), paint..color= Colors.amberAccent);

    // Draw a circle
    canvas.drawCircle(Offset(200, 150 ) , 40, paint);

    canvas.drawArc(const Rect.fromLTWH(20, 160, 100, 100) , 0 , 3.14 , false , paint);

  
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
