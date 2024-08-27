import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as math;
import 'main.dart';

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({super.key});

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late ColorTween colorTween;
  late Timer backgroundTimer;
  List<Color> backgroundColors = [
    Colors.amber,
    Colors.orange,
    Colors.green,
    Colors.red,
    Colors.purpleAccent,
    Colors.cyan
  ];
  int currentColorIndex = 0;

  String get timerString {
    Duration duration = controller.duration! * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(minutes: 15),
    );

    colorTween = ColorTween(
        begin: backgroundColors[currentColorIndex],
        end: backgroundColors[currentColorIndex]);

    controller.reverse(from: 1.0);

    backgroundTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        // Increment the color index and cycle through the colors
        currentColorIndex = (currentColorIndex + 1) % backgroundColors.length;

        // Update the ColorTween with the new color
        colorTween = ColorTween(
            begin: colorTween.end, end: backgroundColors[currentColorIndex]);
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    backgroundTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: colorTween.evaluate(controller),
      appBar: AppBar(
        title: const Text('Count Down Minutes - POC'),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              // Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder: (context) => const MyHomePage()));
            }),
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.center,
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: Stack(
                            children: <Widget>[

                              Positioned.fill(
                                child:SizedBox(
                                  width: 100,
                                  child: CustomPaint(
                                    painter: CustomTimerPainter(
                                      animation: controller,
                                      backgroundColor: Colors.white,
                                      color: themeData.indicatorColor,
                                    ),
                                  ),
                                )
                              ),
                              Align(
                                alignment: FractionalOffset.center,
                                child: Text(
                                  timerString,
                                  style: const TextStyle(
                                    fontSize: 52.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) {
                        return ElevatedButton(
                            onPressed: () {
                              controller.reset();
                              controller.reverse(from: 1.0);
                            },
                            child: const Text('Reset'));
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    required this.animation,
    required this.backgroundColor,
    required this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
